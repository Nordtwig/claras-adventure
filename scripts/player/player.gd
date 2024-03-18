extends CharacterBody3D

@export var navmesh: NavigationRegion3D

const DISTANCE_THRESHOLD: float = 1.0
const SPEED: float = 3.0

var path:= []
var path_index:=0

@onready var camera: Camera3D = get_viewport().get_camera_3d()
@onready var space_state: PhysicsDirectSpaceState3D = get_world_3d().direct_space_state


func _physics_process(delta) -> void:
	move_along(path)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == 1:
		print("click")
		find_path(event)


func find_path(event: InputEvent) -> void:
	var ray = PhysicsRayQueryParameters3D.new()
	ray.from= camera.project_ray_origin(event.position)
	ray.to = ray.from + camera.project_ray_normal(event.position) * 100
	var result = space_state.intersect_ray(ray)

	if result and result.collider:
		path = NavigationServer3D.map_get_path(NavigationServer3D.get_maps()[0], global_transform.origin, result.position, true)
		path_index = 0
		



func move_along(new_path: Array) -> void:
	if !new_path or path_index == path.size():
		return

	var distance_to_next_step = global_transform.origin.distance_to(path[path_index])
	var direction: Vector3 = path[path_index] - global_transform.origin

	if distance_to_next_step < DISTANCE_THRESHOLD:
		path_index += 1
	else:
		velocity = direction.normalized() * SPEED
		move_and_slide()
