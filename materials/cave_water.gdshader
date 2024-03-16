shader_type spatial;

uniform sampler2D wave_pattern;
uniform vec4 color:source_color = vec4(0.10, 0.71, 0.82, 0.44);
uniform float height_factor:hint_range(0, 1.0) = 0.1;

void vertex() {
	vec4 wave = texture(wave_pattern, UV);
	float displacement = sin(VERTEX.x * wave.x * TIME) + cos(VERTEX.z * wave.z * TIME);
	
	VERTEX.y += displacement * height_factor;
}

void fragment() {
	ALBEDO = color.rgb;
	ALPHA = color.a;
}
