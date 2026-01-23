varying vec3 vColor;

void main()
{
    // DISC PATTERN
    /* float strength = distance(gl_PointCoord, vec2(0.5));
    strength = step(0.5, strength);
    strength = 1.0 - strength; */

    // DIFFUSE POINT PATTERN
    // Calculate the distance to the center (0.0 at the center, 0.5 at the edges)
    // float strength = distance(gl_PointCoord, vec2(0.5));

    // Multiply by 2 to get 1.0 at the center and 0.0 at the edge.    
        // strength *= 2.0;
    // Invert the value to obtain soft edges.
        // strength = 1.0 - strength;


    // LIGHT POINT PATTERN
    float strength = distance(gl_PointCoord, vec2(0.5));
    strength = 1.0 - strength;
    // Applying power to make the edge transitions more "organic"
    strength = pow(strength, 7.0);

    // FINAL COLOR
    vec3 color = mix(vec3(0.0), vColor, strength);

    gl_FragColor = vec4(vec3(color), 1.0);
}