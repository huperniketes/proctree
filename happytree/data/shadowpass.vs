#version 120

attribute vec3 vertexPosition;
attribute vec3 vertexNormal;
attribute vec2 vertexTexCoord;

varying vec2 texcoord;

uniform mat4 RotationMatrix;

void main()
{
    texcoord = vertexTexCoord;
    gl_Position = RotationMatrix * vec4(vertexPosition, 1.0);
}