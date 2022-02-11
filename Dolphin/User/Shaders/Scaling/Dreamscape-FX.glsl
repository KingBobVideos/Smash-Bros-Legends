/*
[configuration]

[OptionRangeInteger]
GUIName = DitherType
OptionName = A_DITHER_TYPE
MinValue = 0
MaxValue = 1
StepAmount = 1
DefaultValue = 1

[OptionRangeInteger]
GUIName = ShowMethod
OptionName = B_DITHER_SHOW
MinValue = 0
MaxValue = 1
StepAmount = 1
DefaultValue = 0

[OptionRangeFloat]
GUIName = Border Width
OptionName = BorderWidth
MinValue = 0.0, 0.0
MaxValue = 1024.0, 1024.0
StepAmount = 1.0, 1.0
DefaultValue = 2.0, 2.0

[OptionRangeFloat]
GUIName = Border Color
OptionName = BorderColor
MinValue = 0.0, 0.0, 0.0
MaxValue = 1.0, 1.0, 1.0
StepAmount = 0.01, 0.01, 0.01
DefaultValue = 0.0, 0.0, 0.0

[OptionRangeFloat]
GUIName = AA Shader 4.o Sharpness Control
OptionName = SHARPNESS
MinValue = 1.0
MaxValue = 10.0
StepAmount = 0.5
DefaultValue = 2.0


[Pass]
Input0=ColorBuffer
Input0Mode=Clamp
Input0Filter=Linear
EntryPoint=AA4

[Pass]
Input0=PreviousPass
Input0Mode=Clamp
Input0Filter=Linear
EntryPoint=DitherPass

[Pass]
Input0=PreviousPass
Input0Mode=Clamp
Input0Filter=Linear
EntryPoint=BorderPass

[Pass]
Input0=PreviousPass
Input0Mode=Clamp
Input0Filter=Linear
EntryPoint=DS0

[Pass]
Input0=PreviousPass
Input0Mode=Clamp
Input0Filter=Linear
EntryPoint=DS1

[Pass]
Input0=PreviousPass
Input0Mode=Clamp
Input0Filter=Linear
EntryPoint=DS2

[Pass]
Input0=PreviousPass
Input0Mode=Clamp
Input0Filter=Linear
EntryPoint=DS3

[Pass]
Input0=PreviousPass
Input1=Pass3
Input0Mode=Clamp
Input0Filter=Linear
EntryPoint=DS4

[/configuration]
*/

/*===============================================================================*\
|########################       [DITHERING,PX BORDER]      #######################|
|##########################        By Asmodean          ##########################|
||                                                                               ||
||          This program is free software; you can redistribute it and/or        ||
||          modify it under the terms of the GNU General Public License          ||
||          as published by the Free Software Foundation; either version 2       ||
||          of the License, or (at your option) any later version.               ||
||                                                                               ||
||          This program is distributed in the hope that it will be useful,      ||
||          but WITHOUT ANY WARRANTY; without even the implied warranty of       ||
||          MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        ||
||          GNU General Public License for more details. (C)2015                 ||
||                                                                               ||
|#################################################################################|
\*===============================================================================*/

/*------------------------------------------------------------------------------
[DITHERING CODE SECTION]
------------------------------------------------------------------------------*/

void DitherPass()
{
	
    float2 texcoord = GetCoordinates();
	float4 color = SampleLocation(texcoord);
	
	float ditherBits = 8.0;
	float2 fragcoord = GetFragmentCoord();
	if (GetOption(A_DITHER_TYPE) == 1) {  //random dithering
		Randomize();	
		float noise = Rndfloat();
		float ditherShift = (1.0 / (pow(2.0, ditherBits) - 1.0));
		float ditherHalfShift = (ditherShift * 0.5);
		ditherShift = ditherShift * noise - ditherHalfShift;

		color.rgb += float3(-ditherShift, ditherShift, -ditherShift);

		if (GetOption(B_DITHER_SHOW) == 1)
		{
			color.rgb = float3(noise, noise,noise);
		}
	}

	else if (GetOption(A_DITHER_TYPE) == 0) { //ordered dithering

		float2 ditherSize = float2(1.0 / 16.0, 10.0 / 36.0);
		float gridPosition = frac(dot(fragcoord.xy, ditherSize) + 0.25);
		float ditherShift = (0.25) * (1.0 / (pow(2.0, ditherBits) - 1.0));

		float3 RGBShift = float3(ditherShift, -ditherShift, ditherShift);
		RGBShift = lerp(2.0 * RGBShift, -2.0 * RGBShift, gridPosition);

		color.rgb += RGBShift;

		if (GetOption(B_DITHER_SHOW) == 1)
		{
			color.rgb = float3(gridPosition, gridPosition, gridPosition);
		}
	}

	SetOutput(color);
}


/*------------------------------------------------------------------------------
[PX BORDER CODE SECTION]
------------------------------------------------------------------------------*/

void BorderPass()
{
	float3 border_color_float = GetOption(BorderColor);

	float2 tex = GetCoordinates();
	float4 colorInput = SampleLocation(tex);
	
	float2 border = (GetInvResolution().xy * GetOption(BorderWidth));
	float2 within_border = saturate((-tex * tex + tex) - (-border * border + border));

	colorInput.rgb = all(within_border) ? colorInput.rgb : border_color_float;

	SetOutput(colorInput);

}


//##############################################################//
//						                                        //
//       AA Shader 4.o shader - coded by guest(r)               //
//		     part of code by ShadX		                        //
//##############################################################// 
// Ported by Hyllian - 2015



float3 texture2d (float2 texcoord, float4 yx) {
	const float3 dt = float3(1.0,1.0,1.0);

	float3 s00 = SampleLocation(texcoord + yx.zw).xyz; 
	float3 s20 = SampleLocation(texcoord + yx.xw).xyz; 
	float3 s22 = SampleLocation(texcoord + yx.xy).xyz; 
	float3 s02 = SampleLocation(texcoord + yx.zy).xyz; 

	float m1=dot(abs(s00-s22),dt)+0.001;
	float m2=dot(abs(s02-s20),dt)+0.001;

	return .5*(m2*(s00+s22)+m1*(s02+s20))/(m1+m2);
}


void AA4()
{
	const float3 dt = float3(1.0,1.0,1.0);

	// Calculating texel coordinates
	float2 size     = GetOption(SHARPNESS)*GetTargetResolution();
	float2 inv_size = 1.0/size;

	float4 yx = float4(inv_size, -inv_size);
	
	float2 OGL2Pos = GetCoordinates()*size;

	float2 fp = frac(OGL2Pos);
	float2 dx = float2(inv_size.x,0.0);
	float2 dy = float2(0.0, inv_size.y);
	float2 g1 = float2(inv_size.x,inv_size.y);
	float2 g2 = float2(-inv_size.x,inv_size.y);
	
	float2 pC4 = floor(OGL2Pos) * inv_size + 0.5*inv_size;	
	
	// Reading the texels
	float3 C0 = texture2d(pC4 - g1, yx); 
	float3 C1 = texture2d(pC4 - dy, yx);
	float3 C2 = texture2d(pC4 - g2, yx);
	float3 C3 = texture2d(pC4 - dx, yx);
	float3 C4 = texture2d(pC4     , yx);
	float3 C5 = texture2d(pC4 + dx, yx);
	float3 C6 = texture2d(pC4 + g2, yx);
	float3 C7 = texture2d(pC4 + dy, yx);
	float3 C8 = texture2d(pC4 + g1, yx);
	
	float3 ul, ur, dl, dr;
	float m1, m2;
	
	m1 = dot(abs(C0-C4),dt)+0.001;
	m2 = dot(abs(C1-C3),dt)+0.001;
	ul = (m2*(C0+C4)+m1*(C1+C3))/(m1+m2);  
	
	m1 = dot(abs(C1-C5),dt)+0.001;
	m2 = dot(abs(C2-C4),dt)+0.001;
	ur = (m2*(C1+C5)+m1*(C2+C4))/(m1+m2);
	
	m1 = dot(abs(C3-C7),dt)+0.001;
	m2 = dot(abs(C6-C4),dt)+0.001;
	dl = (m2*(C3+C7)+m1*(C6+C4))/(m1+m2);
	
	m1 = dot(abs(C4-C8),dt)+0.001;
	m2 = dot(abs(C5-C7),dt)+0.001;
	dr = (m2*(C4+C8)+m1*(C5+C7))/(m1+m2);
	
	float3 c11 = 0.5*((dr*fp.x+dl*(1-fp.x))*fp.y+(ur*fp.x+ul*(1-fp.x))*(1-fp.y) );

	SetOutput(float4(c11, 1.0));
}


    
/*
   Authors: Themaister, guest.r
   License: Public domain
*/

float fractx (float a)
{
	return a - floor(a);
}

float fmodx(float a, float b)
{
    float c = fractx(abs(a/b))*abs(b);
    return sign(a)*c;
}
     
void DS0()
{
    float2 texcoord = GetCoordinates();
    float2 texture_size = GetResolution();

	float4  frame = SampleLocation(texcoord);
	
	SetOutput(frame);
}

// Implementation based on the article "Efficient Gaussian blur with linear sampling"
// http://rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/
/* A version for MasterEffect Reborn, a standalone version, and a custom shader version for SweetFX can be 
   found at http://reshade.me/forum/shader-presentation/27-gaussian-blur-bloom-unsharpmask */

#define BloomIntensity 3.0
      
void DS1()
{
    float2 texcoord = GetCoordinates();
	float4  color = SampleLocation(texcoord);
	color = float4 (color.rgb * pow (abs (max (color.r, max (color.g, color.b))), 2.0), 2.0f)*BloomIntensity;
	SetOutput(color);
}


// Implementation based on the article "Efficient Gaussian blur with linear sampling"
// http://rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/
/* A version for MasterEffect Reborn, a standalone version, and a custom shader version for SweetFX can be 
   found at http://reshade.me/forum/shader-presentation/27-gaussian-blur-bloom-unsharpmask */
 /*-----------------------------------------------------------.
/                  Gaussian Blur settings                     /
'-----------------------------------------------------------*/

#define HW 1.00

void DS2()
{

	float2 texcoord  = GetCoordinates();
	float2 PIXEL_SIZE = 1.0/GetResolution();

	float sampleOffsets[5] = { 0.0, 1.4347826, 3.3478260, 5.2608695, 7.1739130 };
	float sampleWeights[5] = { 0.16818994, 0.27276957, 0.11690125, 0.024067905, 0.0021112196 };

	float4 color = SampleLocation(texcoord) * sampleWeights[0];
	for(int i = 1; i < 5; ++i) {
		color += SampleLocation(texcoord + float2(sampleOffsets[i]*HW * PIXEL_SIZE.x, 0.0)) * sampleWeights[i];
		color += SampleLocation(texcoord - float2(sampleOffsets[i]*HW * PIXEL_SIZE.x, 0.0)) * sampleWeights[i];
	} 
	SetOutput(color);	
}


// Implementation based on the article "Efficient Gaussian blur with linear sampling"
// http://rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/
/* A version for MasterEffect Reborn, a standalone version, and a custom shader version for SweetFX can be 
   found at http://reshade.me/forum/shader-presentation/27-gaussian-blur-bloom-unsharpmask */
 /*-----------------------------------------------------------.
/                  Gaussian Blur settings                     /
'-----------------------------------------------------------*/

#define VW 1.00

void DS3()
{

	float2 texcoord  = GetCoordinates();
	float2 PIXEL_SIZE = float2(1.0,1.0)/GetResolution();

	float sampleOffsets[5] = { 0.0, 1.4347826, 3.3478260, 5.2608695, 7.1739130 };
	float sampleWeights[5] = { 0.16818994, 0.27276957, 0.11690125, 0.024067905, 0.0021112196 };

	float4 color = SampleLocation(texcoord) * sampleWeights[0];
	for(int i = 1; i < 5; ++i) {
		color += SampleLocation(texcoord + float2(0.0, sampleOffsets[i]*VW * PIXEL_SIZE.y)) * sampleWeights[i];
		color += SampleLocation(texcoord - float2(0.0, sampleOffsets[i]*VW * PIXEL_SIZE.y)) * sampleWeights[i]; 
	} 
	SetOutput(color);	
}


#define GaussStrength 0.45
#define BloomStrength 0.0825
#define SW             2.0
#define BRIGHT         0.5


//GaussEffect
//0 = off, 1 = Blur, 2 = Unsharpmask (expensive), 3 = Bloom, 4 = Sketchy, 5 = effects image only.
#define GaussEffect 1

//addBloom
//Set to 1 to add bloom to Blur or Unsharpmask. 0 = off. Set GaussEffect to 0 for bloom only.
#define addBloom 1
#define bloomPass 1
#define USE_addBlur 0

//GaussBloomWarmth
//0 = neutral, 1 = warm, 2 = hazy/foggy 
#define GaussBloomWarmth 0


#define CoefLuma_G            float3(0.2126, 0.7152, 0.0722)      // BT.709 & sRBG luma coefficient (Monitors and HD Television)
#define sharp_strength_luma_G (CoefLuma_G * GaussStrength + 0.2)
#define sharp_clampG        0.035


void DS4()
{

	float2 texcoord  = GetCoordinates();
	float2 PIXEL_SIZE = 1.0/GetResolution();

	float sampleOffsets[5] = { 0.0, 1.4347826, 3.3478260, 5.2608695, 7.1739130 };
	float sampleWeights[5] = { 0.16818994, 0.27276957, 0.11690125, 0.024067905, 0.0021112196 }; 
	
	float4 color = SampleInputLocation(0, texcoord) * sampleWeights[0];
	for(int i = 1; i < 5; ++i) {
		color += SampleInputLocation(0, texcoord + float2(sampleOffsets[i]*SW * PIXEL_SIZE.x, sampleOffsets[i] * PIXEL_SIZE.y)) * sampleWeights[i];
		color += SampleInputLocation(0, texcoord - float2(sampleOffsets[i]*SW * PIXEL_SIZE.x, sampleOffsets[i] * PIXEL_SIZE.y)) * sampleWeights[i];
		color += SampleInputLocation(0, texcoord + float2(-sampleOffsets[i]*SW * PIXEL_SIZE.x, sampleOffsets[i] * PIXEL_SIZE.y)) * sampleWeights[i];
		color += SampleInputLocation(0, texcoord + float2(sampleOffsets[i]*SW * PIXEL_SIZE.x, -sampleOffsets[i] * PIXEL_SIZE.y)) * sampleWeights[i];
	}  
	float4 blur = BRIGHT*color;
	
	float4 orig = SampleInputLocation(1, texcoord);
	//float4 orig = SampleLocation(texcoord);	
	
	float3 sharp;
	#if (GaussEffect == 0)
		orig = orig;
	#elif (GaussEffect == 1)
		// Blur...
		orig = lerp(orig, blur, GaussStrength);
	#elif (GaussEffect == 2)
		// Sharpening
		sharp = orig.rgb - blur.rgb;
		float sharp_luma = dot(sharp, sharp_strength_luma_G);
		sharp_luma = clamp(sharp_luma, -sharp_clampG, sharp_clampG);
		orig = orig + sharp_luma;
	#elif (GaussEffect == 3)
		// Bloom
		#if (GaussBloomWarmth == 0)
			orig = lerp(orig, blur *4, GaussStrength);                                     
// Neutral
		#elif (GaussBloomWarmth == 1)
			orig = lerp(orig, max(orig *1.8 + (blur *5) - 1.0, 0.0), GaussStrength);       // Warm and cheap
		#else
			orig = lerp(orig, (1.0 - ((1.0 - orig) * (1.0 - blur *1.0))), GaussStrength);  // Foggy bloom
		#endif
	#elif (GaussEffect == 4)
		// Sketchy
		sharp = orig.rgb - blur.rgb;		
		orig = float4(1.0, 1.0, 1.0, 0.0) - min(orig, dot(sharp, sharp_strength_luma_G)) *3;
		// orig = float4(1.0, 1.0, 1.0, 0.0) - min(blur, orig);      // Negative
	#else
		orig = blur;
	#endif

	#if (addBloom == 1)
		#if (GaussBloomWarmth == 0)
			orig += lerp(orig, blur *4.0, BloomStrength);
			orig = orig * 0.5;
		#elif (GaussBloomWarmth == 1)
			orig += lerp(orig, max(orig *1.8 + (blur *5.0) - 1.0, 0.0), BloomStrength);
			orig = orig * 0.5;
		#else
			orig += lerp(orig, (1.0 - ((1.0 - orig) * (1.0 - blur *1.0))), BloomStrength);
			orig = orig * 0.5;
		#endif
	#else
		orig = orig;
	#endif
	
	#if (USE_addBlur == 1)
		orig += lerp(orig, blur2, BlurStrength);
		//orig = blur2;
	#endif	 
	float2 fragpos = floor(GetFragmentCoord());
	
	//float fragpos = floor(texcoord.y * (GetTargetResolution()).y * texture_size.y / (GetInputResolution(0)).y);
	
	float4 background;
	if (fmodx(fragpos.y, 2.0) == 0.0) orig*=0.5;
	SetOutput(orig);	
}