#version 120

attribute vec3 vertexPosition;
attribute vec3 vertexNormal;
attribute vec2 vertexTexCoord;

varying vec3 color;
varying vec2 texcoord;
varying vec4 origcoord;

uniform mat4 RotationMatrix;
uniform vec3 lightdir;
uniform bool EnableLighting;

void main()
{
    float v = dot(normalize(vertexNormal), normalize(lightdir));
    v = v + 2;
    if (EnableLighting)
        color = vec3(v);
    else
        color = vec3(1,1,1);
    texcoord = vertexTexCoord;
    origcoord = vec4(vertexPosition, 1.0);
    gl_Position = RotationMatrix * vec4(vertexPosition, 1.0);
}