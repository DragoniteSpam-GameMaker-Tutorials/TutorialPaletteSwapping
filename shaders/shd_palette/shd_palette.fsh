//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D samp_targets;
uniform vec2 palette_size;
uniform float palette_index;

uniform vec2 u_palette_start;
uniform vec2 u_palette_end;

void main()
{
    vec4 sampled = texture2D(gm_BaseTexture, v_vTexcoord);
    
    for (float i = 0.0; i < palette_size.x; i += 1.0) {
        vec2 target_uvs = vec2(mix(u_palette_start.x, u_palette_end.x, i / palette_size.x), u_palette_start.y);
        
        vec3 target = texture2D(samp_targets, target_uvs).rgb;
        if (distance(target, sampled.rgb) < 0.001) {
            vec2 replacement_uvs = vec2(
                mix(u_palette_start.x, u_palette_end.x, i / palette_size.x),
                mix(u_palette_start.y, u_palette_end.y, palette_index / palette_size.y)
            );
            sampled.rgb = texture2D(samp_targets, replacement_uvs).rgb;
        }
    }
    
    gl_FragColor = sampled * v_vColour;
}