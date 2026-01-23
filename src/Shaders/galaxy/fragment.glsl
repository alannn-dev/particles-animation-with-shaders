void main()
{
    float strength = distance(gl_PointCoord, vec2(0.5));
    strength = abs(1.0 - step(0.5, strength)); // Version nette
    // For a milder version, use :
    // strength = 1.0 - smoothstep(0.45, 0.5, strength);

    gl_FragColor = vec4(vec3(strength), 1.0);
}