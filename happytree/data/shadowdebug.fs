#version 120

varying vec2 texcoord;

uniform sampler2D tex;

void main()
{
    gl_FragColor = texture2D(tex, texcoord.st);    
}