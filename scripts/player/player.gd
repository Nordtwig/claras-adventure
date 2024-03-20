extends CharacterBody3D

@export var navmesh: NavigationRegion3D

const DISTANCE_THRESHOLD: float = 1.0
const SPEED: float = 3.0

var path:= []
var path_index:=0
var is_moving: bool = false
var has_key: bool = false

@onready var camera: Camera3D = get_viewport().get_camera_3d()
@onready var space_state: PhysicsDirectSpaceState3D = get_world_3d().direct_space_state


func _physics_process(delta) -> void:
	move_along(path)


func _unhandled_input(event) -> void:
	# if event is InputEventMouseMotion:
	# 	turn_to(event)
	if event is InputEventMouseButton and event.button_index == 1:
		find_path(event)


func find_path(event: InputEvent) -> void:
	path = NavigationServer3D.map_get_path(NavigationServer3D.get_maps()[0], global_transform.origin, get_destination(event), true)
	path_index = 0
		

func move_along(new_path: Array) -> void:
	if !new_path or path_index == path.size():
		is_moving = false
		$Clara/AnimationPlayer.play("Idle")
		$FootstepsSound.stream_paused = true
		return
	
	is_moving = true
	$Clara/AnimationPlayer.play("Walk")
	$FootstepsSound.stream_paused = false

	var distance_to_next_step = global_transform.origin.distance_to(path[path_index])
	var direction: Vector3 = path[path_index] - global_transform.origin

	if distance_to_next_step < DISTANCE_THRESHOLD:
		path_index += 1
	else:
		velocity = direction.normalized() * SPEED
		move_and_slide()
		look_at(path[path_index], Vector3.UP)


func turn_to(event: InputEvent) -> void:
	if is_moving:
		return
	
	var direction: Vector3 = get_destination(event) * Vector3(1, 0, 1) + Vector3(0, global_transform.origin.y, 0)

	look_at(direction, Vector3.UP)


func get_destination(event: InputEvent) -> Vector3:
	var ray = PhysicsRayQueryParameters3D.new()
	ray.from= camera.project_ray_origin(event.position)
	ray.to = ray.from + camera.project_ray_normal(event.position) * 100
	var result = space_state.intersect_ray(ray)

	if result and result.collider:
		return result.position
	
	return Vector3.ZERO
