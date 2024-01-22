shader_type spatial;

uniform float resolution = 64.0;
uniform float height_offset = 0.0;
uniform float height_coeff = 7.5;
uniform float lod = 6.0;
uniform float cutoff = 30.0;

uniform vec3 color1;
uniform vec3 color2;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

varying vec3 world_position;

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
	vec4 upos = INV_PROJECTION_MATRIX * vec4(SCREEN_UV * 2.0 - 1.0, FRAGCOORD.z, 1.0);
	vec3 pixel_position = upos.xyz / upos.w;
	float distance = -pixel_position.z;
	
	if (distance > cutoff) {
		discard;
	}
	
	float lod_resolution = resolution;
	
	lod_resolution = 1.0 / (1.0 + exp(round(distance/lod) - 10.0));
	lod_resolution *= resolution;
	ALBEDO = mix(color1, color2, 2.5 * (world_position.y - height_offset));
	if (random(floor(world_position.xz * lod_resolution) / lod_resolution) >= height_coeff * (world_position.y - height_offset)) {
		
	} else {
		ALPHA = 0.02;
	}
	
    
}