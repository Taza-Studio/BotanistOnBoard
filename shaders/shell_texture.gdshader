shader_type spatial;

uniform float resolution = 1.0;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

varying vec3 world_position;
varying float t;

float random (vec2 v) {
    return fract(sin(dot(v,
        vec2(12.9898,78.233))) * 43758.5453123);
}

void vertex()
{
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() 
{   
    if (random(round(world_position.xz * resolution)) >= 0.5) {
		ALBEDO = vec3(1.0,1.0,1.0);
	} else {
		ALBEDO = vec3(0.0,0.0,0.0);
	}
}