package shaders;

import flixel.system.FlxAssets.FlxShader;
import openfl.display.BitmapData;
import openfl.display.Shader;
import openfl.display.ShaderInput;
import openfl.utils.Assets;
import flixel.FlxG;
import openfl.Lib;
using StringTools;
typedef NTSCSHADER = {
  var shader:Dynamic;
}

class NTSC extends FlxShader
{
@:glFragmentSource('
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
    
    // Loosely based on postprocessing shader by inigo quilez, License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
    
    vec3 xsample( sampler2D tex, vec2 tc )
    {
        vec3 s = pow(texture(tex,vec2(tc.x, tc.y)).rgb, vec3(2.2));
        return s;
    }
    
    vec3 filmic( vec3 LinearColor )
    {
        vec3 x = max(vec3(0.0), LinearColor-0.004);
        return (x*(6.2*x+0.5))/(x*(6.2*x+1.7)+0.06);
    }
    
    vec3 blur(sampler2D tex, vec2 tc, float offs)
    {
        vec4 xoffs = offs * vec4(-2.0, -1.0, 1.0, 2.0) / iResolution.x;
        vec4 yoffs = offs * vec4(-2.0, -1.0, 1.0, 2.0) / iResolution.y;
        
        vec3 color = vec3(0.0, 0.0, 0.0);
        color += xsample(tex,tc + vec2(xoffs.x, yoffs.x)) * 0.00366;
        color += xsample(tex,tc + vec2(xoffs.y, yoffs.x)) * 0.01465;
        color += xsample(tex,tc + vec2(    0.0, yoffs.x)) * 0.02564;
        color += xsample(tex,tc + vec2(xoffs.z, yoffs.x)) * 0.01465;
        color += xsample(tex,tc + vec2(xoffs.w, yoffs.x)) * 0.00366;
        
        color += xsample(tex,tc + vec2(xoffs.x, yoffs.y)) * 0.01465;
        color += xsample(tex,tc + vec2(xoffs.y, yoffs.y)) * 0.05861;
        color += xsample(tex,tc + vec2(    0.0, yoffs.y)) * 0.09524;
        color += xsample(tex,tc + vec2(xoffs.z, yoffs.y)) * 0.05861;
        color += xsample(tex,tc + vec2(xoffs.w, yoffs.y)) * 0.01465;
        
        color += xsample(tex,tc + vec2(xoffs.x, 0.0)) * 0.02564;
        color += xsample(tex,tc + vec2(xoffs.y, 0.0)) * 0.09524;
        color += xsample(tex,tc + vec2(    0.0, 0.0)) * 0.15018;
        color += xsample(tex,tc + vec2(xoffs.z, 0.0)) * 0.09524;
        color += xsample(tex,tc + vec2(xoffs.w, 0.0)) * 0.02564;
        
        color += xsample(tex,tc + vec2(xoffs.x, yoffs.z)) * 0.01465;
        color += xsample(tex,tc + vec2(xoffs.y, yoffs.z)) * 0.05861;
        color += xsample(tex,tc + vec2(    0.0, yoffs.z)) * 0.09524;
        color += xsample(tex,tc + vec2(xoffs.z, yoffs.z)) * 0.05861;
        color += xsample(tex,tc + vec2(xoffs.w, yoffs.z)) * 0.01465;
        
        color += xsample(tex,tc + vec2(xoffs.x, yoffs.w)) * 0.00366;
        color += xsample(tex,tc + vec2(xoffs.y, yoffs.w)) * 0.01465;
        color += xsample(tex,tc + vec2(    0.0, yoffs.w)) * 0.02564;
        color += xsample(tex,tc + vec2(xoffs.z, yoffs.w)) * 0.01465;
        color += xsample(tex,tc + vec2(xoffs.w, yoffs.w)) * 0.00366;
    
        return color;
    }
    
    //Credit: http://stackoverflow.com/questions/4200224/random-noise-functions-for-glsl
    float rand(vec2 co){
        return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
    }
    
    vec2 curve(vec2 uv)
    {
        uv = (uv - 0.5) * 2.0;
        uv *= 1.1;	
        uv.x *= 1.0 + pow((abs(uv.y) / 5.0), 2.0);
        uv.y *= 1.0 + pow((abs(uv.x) / 4.0), 2.0);
        uv  = (uv / 2.0) + 0.5;
        uv =  uv *0.92 + 0.04;
        return uv;
    }
    void mainImage( out vec4 fragColor, in vec2 fragCoord )
    {
        // Curve
        vec2 FragCoord = vec2( fragCoord.x, fragCoord.y );
        vec2 q = FragCoord.xy / iResolution.xy;
        vec2 uv = q;
        uv = mix( curve( uv ), uv, 0.5 );
        
        vec3 oricol = texture( iChannel0, vec2(q.x,q.y) ).xyz;
        
        // Main color, Bleed
        vec3 col;
        float x =  sin(0.1*iTime+uv.y*13.0)*sin(0.23*iTime+uv.y*19.0)*sin(0.3+0.11*iTime+uv.y*23.0)*0.0012;
        float o =sin(FragCoord.y*1.5)/iResolution.x;
        x+=o*0.25;
        col.r = blur(iChannel0,vec2(x+uv.x+0.0009,uv.y+0.0009),iResolution.y/800.0).x+0.02;
        col.g = blur(iChannel0,vec2(x+uv.x+0.0000,uv.y-0.0011),iResolution.y/800.0).y+0.02;
        col.b = blur(iChannel0,vec2(x+uv.x-0.0015,uv.y+0.0000),iResolution.y/800.0).z+0.02;
        float i = clamp(col.r*0.299 + col.g*0.587 + col.b*0.114, 0.0, 1.0 );
        
        // Glow
        vec3 glow = (12.5*i*i)*pow(clamp(blur(iChannel0,vec2(x+uv.x+0.2*sin(uv.x + 10.0*iTime)*0.012,uv.y + 0.2*sin( uv.y + 7.3*iTime)*0.012),4.0)-0.3,0.0,1.0),vec3(5.0));
        glow = 0.75*clamp( glow, 0.0, 1.0 );
        col += glow;
        
        i = pow( 1.0 - pow(i,2.0), 1.0 );
        i = (1.0-i) * 0.96 + 0.04;	
    
        // Ghosting
        float ghs = 0.6;
        vec3 r = blur(iChannel0,vec2(x-0.014*1.0, -0.027)+0.003*vec2( 0.35*sin(1.0/7.0 + 35.0*uv.y + 0.9*iTime), 0.55*sin( 2.0/7.0 + 10.0*uv.y + 2.37*iTime) )+vec2(uv.x+0.001,uv.y+0.001),5.5+1.3*sin( 3.0/9.0 + 31.0*uv.y + 1.70*iTime)).xyz*vec3(0.5,0.25,0.25);
        vec3 g = blur(iChannel0,vec2(x-0.019*1.0, -0.020)+0.003*vec2( 0.35*sin(1.0/9.0 + 35.0*uv.y + 0.5*iTime), 0.55*sin( 2.0/9.0 + 10.0*uv.y + 2.50*iTime) )+vec2(uv.x+0.000,uv.y-0.002),5.4+1.3*sin( 3.0/3.0 + 71.0*uv.y + 1.90*iTime)).xyz*vec3(0.25,0.5,0.25);
        vec3 b = blur(iChannel0,vec2(x-0.017*1.0, -0.003)+0.003*vec2( 0.35*sin(2.0/3.0 + 35.0*uv.y + 0.7*iTime), 0.55*sin( 2.0/3.0 + 10.0*uv.y + 2.63*iTime) )+vec2(uv.x-0.002,uv.y+0.000),5.3+1.3*sin( 3.0/7.0 + 91.0*uv.y + 1.65*iTime)).xyz*vec3(0.25,0.25,0.5);
        
        col += vec3(ghs*(1.0-0.299))*pow(clamp(3.0*r,0.0,1.0),vec3(2.0))*i;
        col += vec3(ghs*(1.0-0.587))*pow(clamp(3.0*g,0.0,1.0),vec3(2.0))*i;
        col += vec3(ghs*(1.0-0.114))*pow(clamp(3.0*b,0.0,1.0),vec3(2.0))*i;
        
        // Level adjustment (curves)
        col = clamp(col*1.7 + 1.4*col*col + 2.5*col*col*col*col*col,0.0,10.0);
        
        // Vignette
        float vig = (0.1 + 1.0*16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y));
        vig = 1.0*pow(vig,0.5);
        col *= vec3(vig);
    
        // Scanlines
        float scans = clamp( 0.35+0.18*sin(6.0*iTime+uv.y*iResolution.y*1.5), 0.0, 1.0);
        float s = pow(scans,0.9);
        col = col*vec3( s) ;
    
        // Vertical lines (aperture) 
        col*=1.0-0.23*vec3(clamp((mod(FragCoord.x, 2.0)-1.0)*2.0,0.0,1.0));
    
        // Flicker
        col *= 1.0+0.0017*sin(300.0*iTime);
    
        // Noise
        vec2 seed = floor(uv*iResolution.xy*0.5)/iResolution.xy;
        col *= vec3( 1.0 ) - 0.15*vec3( rand( seed+0.00001*iTime),  rand( seed+0.000011*iTime + 0.3 ),  rand( seed+0.000012*iTime+ 0.5 )  );
        
        // Tone map
        col = filmic( col );
    
        // Clamp
        if (uv.x < 0.0 || uv.x > 1.0)
            col *= 0.0;
        if (uv.y < 0.0 || uv.y > 1.0)
            col *= 0.0;
            
    
        // Crossfade
        float comp = smoothstep( 0.1, 0.9, sin(iTime) );
        col = mix( col, oricol, comp );
    
        fragColor = vec4(col,texture(iChannel0, uv).a);
    }
    
    void main() {
        mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
    }
    ')
  public function new()
  {
    super();
  }
}