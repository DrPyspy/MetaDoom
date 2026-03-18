void main()
{
	FragColor = vec4(0.0);
	for ( int i = 0; i < 4; i++ )
	{
		vec2 uv = TexCoord;
		float dist = distance(vec2(0.5,0.5), uv);
		float pull = 0.95 + (1.0-dist+sin(i+md_timer)*0.15) * 0.075;
		
		uv -= 0.5;
		uv *= mix(1.0, pull, md_amount);
		uv += 0.5;

		vec4 warpedColor = texture(InputTexture, uv);
		float gray = dot(warpedColor.rgb, vec3(0.3, 0.56, 0.14));
		
		warpedColor = mix(warpedColor, vec4(vec3(gray), 1.0), (0.25+dist*0.75)*md_amount);
		float mixer = (-0.25+dist*1.25);
		warpedColor = mix(warpedColor, vec4(vec3(gray*0.5, gray*0.1, gray*0.1), 1.0), clamp(mixer, 0.0, 1.0)*md_amount);

		FragColor += warpedColor;
	}

	FragColor /= 4.0;
}