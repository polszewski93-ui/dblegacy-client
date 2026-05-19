uniform mat4 u_Color;
varying vec2 v_TexCoord;
uniform sampler2D u_Tex0;
const float ALPHA_TOLERANCE = 0.01;

uniform float u_Time;

vec3 generateColor(float t) {
    vec3 color1 = vec3(1.0, 0.0, 0.0);
    vec3 color2 = vec3(0.9, 0.2, 0.0);
    vec3 color3 = vec3(1.0, 0.4, 0.0);
    vec3 color4 = vec3(0.8, 0.0, 0.0);
    vec3 color5 = vec3(0.7, 0.1, 0.1);
    vec3 color6 = vec3(0.9, 0.1, 0.1);
    vec3 color7 = vec3(0.7, 0.0, 0.0);

    float transition = smoothstep(0.1, 0.9, t);

    return mix(mix(mix(mix(color1, color2, transition), color3, transition),
                   mix(color4, color5, transition), transition),
               mix(color6, color7, transition), t);
}

void main()
{
    vec4 baseColor = texture2D(u_Tex0, v_TexCoord);

    vec4 pixel1 = texture2D(u_Tex0, vec2(v_TexCoord.x + 0.001, v_TexCoord.y));
    vec4 pixel2 = texture2D(u_Tex0, vec2(v_TexCoord.x - 0.001, v_TexCoord.y));
    vec4 pixel3 = texture2D(u_Tex0, vec2(v_TexCoord.x, v_TexCoord.y + 0.001));
    vec4 pixel4 = texture2D(u_Tex0, vec2(v_TexCoord.x, v_TexCoord.y - 0.001));

    bool neighbourColor = pixel4.a > ALPHA_TOLERANCE || pixel3.a > ALPHA_TOLERANCE || pixel2.a > ALPHA_TOLERANCE || pixel1.a > ALPHA_TOLERANCE;

    float pulse = 0.5 + 0.5 * sin(u_Time * 5.0);

    if (baseColor.a < ALPHA_TOLERANCE && neighbourColor) {
        vec3 pulsatingOutlineColor = generateColor(pulse);
        baseColor.rgb = pulsatingOutlineColor;
        baseColor.a = 0.7;
    }
    
    gl_FragColor = baseColor;
    if(gl_FragColor.a < 0.01) discard;
}
