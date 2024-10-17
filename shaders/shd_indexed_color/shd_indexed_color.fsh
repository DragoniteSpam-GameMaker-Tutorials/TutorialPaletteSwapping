varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D samp_palette;

uniform float u_palette_index;
uniform float u_palette_size;

void main()
{
    vec4 index = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 sampled_color = texture2D(samp_palette, vec2(index.r, u_palette_index / u_palette_size));
    gl_FragColor = vec4(sampled_color.rgb, index.a);
}
