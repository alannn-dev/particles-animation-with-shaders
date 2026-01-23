uniform float uTime;

uniform float uSize;

attribute float aScale;

varying vec3 vColor;

void main()
{
    // POSITION
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    // SPIN (ROTATION) calculation
    float angle = atan(modelPosition.x, modelPosition.z);
    float distanceToCenter = length(modelPosition.xz);

    // If the distance is close to the center, the offset is large (it rotates quickly).
    // If the distance is far from the center, the offset is small (it rotates slowly).
    float angleOffset = (1.0 / distanceToCenter) * uTime * 0.2;

    // angle update
    angle += angleOffset;
    modelPosition.x = cos(angle) * distanceToCenter;
    modelPosition.z = sin(angle) * distanceToCenter;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // SIZE * Scale for randmness size
    gl_PointSize = uSize * aScale;
    gl_PointSize *= (1.0 / - viewPosition.z);

    // COLOR
    vColor = color;
}