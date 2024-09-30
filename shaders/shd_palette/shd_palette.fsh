//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 sampled = texture2D(gm_BaseTexture, v_vTexcoord);
    
    vec3 targets[16];
    targets[0] = vec3(252.0 / 255.0, 193.0 / 255.0, 18.0 / 255.0);
    targets[1] = vec3(255.0 / 255.0, 203.0 / 255.0, 50.0 / 255.0);
    targets[2] = vec3(212.0 / 255.0, 159.0 / 255.0, 0.0 / 255.0);
    targets[3] = vec3(105.0 / 255.0, 78.0 / 255.0, 0.0 / 255.0);
        
    targets[4] = vec3(172.0 / 255.0, 120.0 / 255.0, 52.0 / 255.0);
    targets[5] = vec3(136.0 / 255.0, 104.0 / 255.0, 64.0 / 255.0);
    targets[6] = vec3(176.0 / 255.0, 104.0 / 255.0, 40.0 / 255.0);
    targets[7] = vec3(207.0 / 255.0, 116.0 / 255.0, 0.0 / 255.0);
    
    targets[8] = vec3(106.0 / 255.0, 35.0 / 255.0, 0.0 / 255.0);
    targets[9] = vec3(192.0 / 255.0, 96.0 / 255.0, 71.0 / 255.0);
    targets[10] = vec3(138.0 / 255.0, 60.0 / 255.0, 40.0 / 255.0);
    targets[11] = vec3(219.0 / 255.0, 226.0 / 255.0, 138.0 / 255.0);
    
    targets[12] = vec3(40.0 / 255.0, 58.0 / 255.0, 62.0 / 255.0);
    targets[13] = vec3(40.0 / 255.0, 35.0 / 255.0, 27.0 / 255.0);
    targets[14] = vec3(173.0 / 255.0, 97.0 / 255.0, 0.0 / 255.0);
    targets[15] = vec3(246.0 / 255.0, 159.0 / 255.0, 48.0 / 255.0);
    
    vec3 replacements[16];
    replacements[0] = vec3(0.0 / 255.0, 155.0 / 255.0, 208.0 / 255.0);
    replacements[1] = vec3(0.0 / 255.0, 130.0 / 255.0, 241.0 / 255.0);
    replacements[2] = vec3(0.0 / 255.0, 97.0 / 255.0, 152.0 / 255.0);
    replacements[3] = vec3(0.0 / 255.0, 75.0 / 255.0, 60.0 / 255.0);
    
    replacements[4] = vec3(0.0 / 255.0, 149.0 / 255.0, 10.0 / 255.0);
    replacements[5] = vec3(0.0 / 255.0, 120.0 / 255.0, 79.0 / 255.0);
    replacements[6] = vec3(0.0 / 255.0, 117.0 / 255.0, 84.0 / 255.0);
    replacements[7] = vec3(0.0 / 255.0, 182.0 / 255.0, 101.0 / 255.0);
    
    replacements[8] = vec3(106.0 / 255.0, 35.0 / 255.0, 0.0 / 255.0);
    replacements[9] = vec3(192.0 / 255.0, 96.0 / 255.0, 71.0 / 255.0);
    replacements[10] = vec3(138.0 / 255.0, 60.0 / 255.0, 40.0 / 255.0);
    replacements[11] = vec3(219.0 / 255.0, 226.0 / 255.0, 138.0 / 255.0);
    
    replacements[12] = vec3(40.0 / 255.0, 58.0 / 255.0, 62.0 / 255.0);
    replacements[13] = vec3(40.0 / 255.0, 35.0 / 255.0, 27.0 / 255.0);
    replacements[14] = vec3(0.0 / 255.0, 156.0 / 255.0, 68.0 / 255.0);
    replacements[15] = vec3(0.0 / 255.0, 224.0 / 255.0, 133.0 / 255.0);
    
    for (int i = 0; i < 16; i++) {
        if (distance(targets[i], sampled.rgb) < 0.001) {
            sampled.rgb = replacements[i];
        }
    }
    
    gl_FragColor = sampled * v_vColour;
}