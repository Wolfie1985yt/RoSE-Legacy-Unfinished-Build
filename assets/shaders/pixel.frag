// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

vec2 curve(vec2 uv)
{
	uv = (uv - 0.5) * 2.0;
	uv *= 1.0;	
	uv.x *= 1.0 + pow((abs(uv.y) / 5.0), 2.0);
	uv.y *= 1.0 + pow((abs(uv.x) / 4.0), 2.0);
	uv  = (uv / 2.0) + 0.5;
	return uv;
}

vec3 chroma(sampler2D source, vec2 uv){
    vec3 col = vec3(0.0);
    col.r = texture(source,vec2(uv.x+0.004,uv.y)).x;
    col.g = texture(source,vec2(uv.x+0.000,uv.y)).y;
    col.b = texture(source,vec2(uv.x-0.004,uv.y)).z;
    return col;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
	uv = curve( uv );
    
    vec3 col;
    
    // Chromatic
    col = chroma(iChannel0, uv);
    
    // uncomment to disable chroma
    //col = texture(iChannel0, uv).rgb;
    
    // drop things beyond curved image
    col *= step(0.0, uv.x) * step(0.0, uv.y);
    col *= 1.0 - step(1.0, uv.x) * 1.0 - step(1.0, uv.y);

    // vignete
    float vig = (0.0 + 32.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y));
	col *= vec3(pow(vig,0.3));
    
    // more green, less other components
    col *= vec3(0.975,1.05,0.975);
    
    // horizontal scanlines:
    // gues what is it
	float scanSpeed = 10.0;
	// bigger number - more scanlines
	float scanlinesNumber = 20.0;
    // scanline darkness
	float s_am = 0.0350;
	float s_b = 1.0 - s_am;
    col *= s_b + s_am*(sin(scanSpeed * iTime + 
                          (uv.y*scanlinesNumber*3.14)));
  
    // screen flickering
    float freq = 35.0*3.14;			// PI is used to make it "per second"
	float f_am = 0.020;				// amplitude of bright changing
	float f_b = 1.0 - f_am;         // base level of color
	col *= f_b + f_am*sin(freq*iTime);

    fragColor = vec4(col,texture(iChannel0, uv).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}