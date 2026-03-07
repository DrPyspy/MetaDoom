vec4 Process(vec4 color)
{
	float dist = (distance(vec2(0.5, 0.5), vTexCoord.st) + (sin(timer*8)*0.025) - 0.3) / 0.5;
	return vec4(0.8, 0.0, 0.0, dist);
}