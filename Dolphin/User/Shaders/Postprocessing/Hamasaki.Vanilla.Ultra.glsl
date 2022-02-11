/*==================================================================================*\
|########################          [Hamasaki FX 0.1]          ######################||
|########################      [From Ishiiruka FX 0.9.1]      ######################||
|| Credits to:                                                                      ||
|| Asmodean (DolphinFX)                                                             ||
|| Matso (MATSODOF)                                                                 ||
|| Gilcher Pascal aka Marty McFly (MATSODOF original port to MCFX)                  ||
|| Daniel Rákos (Efficient Gaussian blur with linear sampling)                      ||
|| mudlord (FXAA)                                                                   ||
|| Cozimo (Default shader settings for Twilight Princess Mod presets)               ||
|| Drakonas (Integrated DolphinFX effects for Twilight Princess Mod Team)           ||
|| Drakonas (With Tino, ported ReShade's Gaussian AnamFlare & GodRays)              ||
|########################               By Tino               ######################||
\*==================================================================================*/
/*
[configuration]
[OptionBool]
GUIName = Ambient Only
GUIName.SPA = Solo Oclusi�n Ambiental
OptionName = A_SSAO_ONLY
DefaultValue = False
GUIDescription = Displays SSAO/SSGI ambient color only.
GUIDescription.SPA = Muestra solo el componente de Oclusi�n Ambiental.

[OptionRangeFloat]
GUIName = SSAO Occlusion Attenuation Start
GUIName.SPA = Inicio de atenuaci�n en la oclusi�n.
OptionName = C_AOASTART
MinValue = 0.0
MaxValue = 0.4
StepAmount = 0.01
DefaultValue = 0.26
GUIDescription = Depth where the attenuation to the SSAO effect starts.
GUIDescription.SPA = Profundidad a partir de la cual se comienza a atenuar la Oclusi�n Ambiental.

[OptionRangeFloat]
GUIName = SSAO Occlusion Attenuation End
GUIName.SPA = Final de atenuaci�n en la oclusi�n.
OptionName = D_AOAEND
MinValue = 0.5
MaxValue = 2.0
StepAmount = 0.01
DefaultValue = 0.92
GUIDescription = Deph where the SSAO attenuation ends, after this value no SSAO is applyed.
GUIDescription.SPA = Profundidad a partir de la cual finaliza la aplicaci�n de la Oclusi�n Ambiental.

[OptionRangeFloat]
GUIName = SSGI Occlusion Attenuation Start
GUIName.SPA = Inicio de atenuaci�n en la oclusi�n.
OptionName = E_AOASTART_SSGI
MinValue = 0.0
MaxValue = 0.4
StepAmount = 0.01
DefaultValue = 0.40
GUIDescription = Depth where the attenuation to the SSAO effect starts.
GUIDescription.SPA = Profundidad a partir de la cual se comienza a atenuar la Oclusi�n Ambiental.

[OptionRangeFloat]
GUIName = SSGI Occlusion Attenuation End
GUIName.SPA = Final de atenuaci�n en la oclusi�n.
OptionName = F_AOAEND_SSGI
MinValue = 0.5
MaxValue = 2.0
StepAmount = 0.01
DefaultValue = 1.20
GUIDescription = Deph where the SSAO attenuation ends, after this value no SSAO is applyed.
GUIDescription.SPA = Profundidad a partir de la cual finaliza la aplicaci�n de la Oclusi�n Ambiental.

[OptionBool]
GUIName = SSAO
OptionName = A_SSAO_ENABLED
DefaultValue = True
ResolveAtCompilation = True
GUIDescription = Enables Screen Space Ambient Occlusion.
GUIDescription.SPA = Habilita la Oclusi�n Ambiental.

[OptionBool]
GUIName = SSGI
OptionName = A_SSAO_SSGI_ENABLED
DefaultValue = false
ResolveAtCompilation = True
DependentOption = A_SSAO_ENABLED
GUIDescription = Enables Screen Space Global Ilumination simulation.
GUIDescription.SPA = Habilita la simulaci�n de Iluminaci�n global.

[OptionRangeInteger]
GUIName = SSAO Quality
GUIName.SPA = Calidad SSAO
OptionName = B_SSAO_SAMPLES
MinValue = 16
MaxValue = 64
StepAmount = 4
DefaultValue = 40
DependentOption = A_SSAO_ENABLED
ResolveAtCompilation = True
GUIDescription = Number of samples used to calculate SSAO component, large values gives more quality but may cause performance drops.
GUIDescription.SPA = Cantidad de muestras utilizadas para el calculo del componente de oclusi�n, valores muly altos producen una mejor calidad pero pueden acarrear una perdida de performance.

[OptionRangeFloat]
GUIName = Sample Range
GUIName.SPA = Rango de Muestras
OptionName = C_SAMPLE_RANGE
MinValue = 0.001
MaxValue = 0.04
StepAmount = 0.0001
DefaultValue = 0.0168
DependentOption = A_SSAO_ENABLED
GUIDescription = Max distance from the center sample.
GUIDescription.SPA = Distancia maxima de las muestras a partir de la muestra central.

[OptionRangeFloat]
GUIName = Filter Limit
GUIName.SPA = Limite de Filtrado
OptionName = D_FILTER_LIMIT
MinValue = 0.001
MaxValue = 0.01
StepAmount = 0.0001
DefaultValue = 0.001
DependentOption = A_SSAO_ENABLED
GUIDescription = Amount of filtering applyed to the AO component.
GUIDescription.SPA = Intensidad de filtrado aplicada al Componente de Oclusi�n.

[OptionRangeFloat]
GUIName = Max Depth
GUIName.SPA = Profundidad Maxima
OptionName = E_MAX_DEPTH
MinValue = 0.0001
MaxValue = 0.02
StepAmount = 0.0001
DefaultValue = 0.0105
DependentOption = A_SSAO_ENABLED

[OptionRangeFloat]
GUIName = Min Depth
GUIName.SPA = Profundidad Minima
OptionName = F_MIN_DEPTH
MinValue = 0.0
MaxValue = 0.02
StepAmount = 0.0001
DefaultValue = 0.0008
DependentOption = A_SSAO_ENABLED

[OptionBool]
GUIName = SSGI
OptionName = A_SSGI_ENABLED
DefaultValue = True
ResolveAtCompilation = True

[OptionRangeInteger]
GUIName = SSGI Samples
OptionName = iSSGISamples
MinValue = 5
MaxValue = 24
StepAmount = 1
DefaultValue = 24
DependentOption = A_SSGI_ENABLED
ResolveAtCompilation = True

[OptionRangeFloat]
GUIName = Sample Range
OptionName = fSSGISamplingRange
MinValue = 5.0
MaxValue = 80.0
StepAmount = 0.1
DefaultValue = 5.0
DependentOption = A_SSGI_ENABLED

[OptionRangeFloat]
GUIName = Ilumination Multiplier
OptionName = fSSGIIlluminationMult
MinValue = 1.0
MaxValue = 8.0
StepAmount = 0.1
DefaultValue = 5.2
DependentOption = A_SSGI_ENABLED

[OptionRangeFloat]
GUIName = Occlusion Multiplier
OptionName = fSSGIOcclusionMult
MinValue = 1.0
MaxValue = 10.0
StepAmount = 0.1
DefaultValue = 2.9
DependentOption = A_SSGI_ENABLED

[OptionRangeFloat]
GUIName = Model Thickness
OptionName = fSSGIModelThickness
MinValue = 0.5
MaxValue = 100.0
StepAmount = 0.1
DefaultValue = 8
DependentOption = A_SSGI_ENABLED

[OptionRangeFloat]
GUIName = Saturation
OptionName = fSSGISaturation
MinValue = 0.2
MaxValue = 2.0
StepAmount = 0.01
DefaultValue = 1.57
DependentOption = A_SSGI_ENABLED

[OptionRangeFloat]
GUIName = AO Sharpness
OptionName = AO_SHARPNESS
MinValue = 0.1
MaxValue = 5.0
StepAmount = 0.01
DefaultValue = 0.64
DependentOption = A_SSGI_ENABLED

[OptionBool]
GUIName = Ambient Only
OptionName = A_AO_ONLY
DefaultValue = False
DependentOption = A_SSGI_ENABLED

[OptionBool]
GUIName = Ilumination Only
OptionName = A_ILUMINATION_ONLY
DefaultValue = False
DependentOption = A_SSGI_ENABLED

[OptionBool]
GUIName = MATSO DOF
OptionName = B_MATSODOF
DefaultValue = True

[OptionBool]
GUIName = Use depth range focus
OptionName = DOF_A_FOCUSPOINT_RANGE
DefaultValue = True
DependentOption = B_MATSODOF

[OptionRangeFloat]
GUIName = Focus Point
OptionName = DOF_B_FOCUSPOINT
MinValue = 0.0, 0.0
MaxValue = 1.0, 1.0
DefaultValue = 0.06, 0.89
StepAmount = 0.01, 0.01
DependentOption = B_MATSODOF

[OptionRangeFloat]
GUIName = Near Blue Curve
OptionName = DOF_NEARBLURCURVE
MinValue = 0.4
MaxValue = 2.0
DefaultValue = 0.4
StepAmount = 0.01
DependentOption = B_MATSODOF

[OptionRangeFloat]
GUIName = FarBlue Curve
OptionName = DOF_FARBLURCURVE
MinValue = 0.4
MaxValue = 2.0
DefaultValue = 1.44
StepAmount = 0.01
DependentOption = B_MATSODOF

[OptionRangeFloat]
GUIName = Blur Radius
OptionName = DOF_BLURRADIUS
MinValue = 5.0
MaxValue = 50.0
DefaultValue = 7
StepAmount = 1.0
DependentOption = B_MATSODOF

[OptionRangeInteger]
GUIName = Vignette
OptionName = DOF_VIGNETTE
MinValue = 0
MaxValue = 1000
DefaultValue = 0
StepAmount = 10
DependentOption = B_MATSODOF

[OptionBool]
GUIName = CROMA Enable
OptionName = bMatsoDOFChromaEnable
DefaultValue = True
DependentOption = B_MATSODOF

[OptionRangeFloat]
GUIName = Chroma Pow
OptionName = fMatsoDOFChromaPow
MinValue = 0.2
MaxValue = 3.0
DefaultValue = 1.35
StepAmount = 0.01
DependentOption = B_MATSODOF

[OptionRangeFloat]
GUIName = Bokeh Curve
OptionName = fMatsoDOFBokehCurve
MinValue = 0.5
MaxValue = 20.0
DefaultValue = 0.5
StepAmount = 0.01
DependentOption = B_MATSODOF

[OptionRangeFloat]
GUIName = Bokeh Light
OptionName = fMatsoDOFBokehLight
MinValue = 0.0
MaxValue = 2.0
DefaultValue = 0.473
StepAmount = 0.001
DependentOption = B_MATSODOF

[OptionRangeInteger]
GUIName = Bokeh Quality
OptionName = iMatsoDOFBokehQuality
MinValue = 1
MaxValue = 10
DefaultValue = 3
StepAmount = 1
DependentOption = B_MATSODOF
ResolveAtCompilation = True

[OptionRangeInteger]
GUIName = Bokeh Angle
OptionName = fMatsoDOFBokehAngle
MinValue = 0
MaxValue = 360
DefaultValue = 0
StepAmount = 1
DependentOption = B_MATSODOF

[OptionBool]
GUIName = Bloom
OptionName = C_BLOOM
DefaultValue = true

[OptionBool]
GUIName = Bloom Only
OptionName = A_BLOOMONLY
DefaultValue = false
DependentOption = C_BLOOM

[OptionRangeFloat]
GUIName = Bloom Width
OptionName = A_BLOOMWIDTH
MinValue = 0.5
MaxValue = 3.0
StepAmount = 0.01
DefaultValue = 1.05
DependentOption = C_BLOOM

[OptionRangeFloat]
GUIName = Bloom Power
OptionName = B_BLOOMPOWER
MinValue = 1.0
MaxValue = 8.0
StepAmount = 0.1
DefaultValue = 5.7
DependentOption = C_BLOOM

[OptionRangeFloat]
GUIName = Bloom Intensity
OptionName = C_BLOOMINTENSITY
MinValue = 0.1
MaxValue = 1.0
StepAmount = 0.01
DefaultValue = 0.35
DependentOption = C_BLOOM

[OptionBool]
GUIName = Light Scattering
OptionName = D_SCATTERRING
DefaultValue = True
DependentOption = C_BLOOM

[OptionRangeFloat]
GUIName = Density
OptionName = E_SDENSITY
MinValue = 0.0
MaxValue = 1.0
StepAmount = 0.01
DefaultValue = 0.14
DependentOption = C_BLOOM

[OptionRangeFloat]
GUIName = Start
OptionName = F_SSTART
MinValue = 0.0
MaxValue = 0.5
StepAmount = 0.01
DefaultValue = 0.16
DependentOption = C_BLOOM

[OptionRangeFloat]
GUIName = End
OptionName = G_SEND
MinValue = 0.5
MaxValue = 2.0
StepAmount = 0.01
DefaultValue = 2.0
DependentOption = C_BLOOM

[OptionRangeFloat]
GUIName = Default Color
OptionName = H_SCOLOR
MinValue = 0.1, 0.1, 0.1
MaxValue = 1.0, 1.0, 1.0
StepAmount = 0.01, 0.01, 0.01
DefaultValue = 0.82, 0.81, 0.91
DependentOption = C_BLOOM

[OptionRangeFloat]
GUIName = Scattering Intensity
OptionName = I_SINTENSITY
MinValue = 0.0
MaxValue = 1.0
StepAmount = 0.01
DefaultValue = 0.33
DependentOption = C_BLOOM

[OptionBool]
GUIName = Gaussian AnamFlare
OptionName = C_GAUSSIAN_ANAMFLARE
DefaultValue = True
GUIDescription = Enable to apply a horizontal light beam to bright pixels.

[OptionRangeFloat]
GUIName = Threshhold
OptionName = A_ANAMFLARE_THRESHOLD
MinValue = 0.10
MaxValue = 1.00
StepAmount = 0.01
DefaultValue = 0.90
DependentOption = C_GAUSSIAN_ANAMFLARE
GUIDescription = Every pixel brighter than this value gets a flare.

[OptionRangeFloat]
GUIName = Wideness
OptionName = A_ANAMFLARE_WIDENESS
MinValue = 0.5
MaxValue = 2.0
StepAmount = 0.1
DefaultValue = 1.0
DependentOption = C_GAUSSIAN_ANAMFLARE
GUIDescription = Horizontal wideness of flare. Don't set too high, otherwise the single samples are visible

[OptionRangeFloat]
GUIName = Amount
OptionName = B_ANAMFLARE_AMOUNT
MinValue = 1.0
MaxValue = 20.0
StepAmount = 0.5
DefaultValue = 7.5
DependentOption = C_GAUSSIAN_ANAMFLARE
GUIDescription = Intensity of anamorphic flare.

[OptionRangeFloat]
GUIName = Curve
OptionName = B_ANAMFLARE_CURVE
MinValue = 1.0
MaxValue = 2.0
StepAmount = 0.1
DefaultValue = 1.0
DependentOption = C_GAUSSIAN_ANAMFLARE
GUIDescription = Intensity curve of flare with distance from source

[OptionRangeFloat]
GUIName = Colors
OptionName = C_ANAMFLARE_COLOR
MinValue = 0.0, 0.0, 0.0
MaxValue = 1.0, 1.0, 1.0
StepAmount = 0.01, 0.01, 0.01
DefaultValue = 0.010, 0.160, 0.580
DependentOption = C_GAUSSIAN_ANAMFLARE
GUIDescription = R, G and B components of anamorphic flare. Flare is always same color.

[OptionBool]
GUIName = God Rays
OptionName = C_GODRAYS
DefaultValue = True
GUIDescription = Adds some light rays rotating around screen center.

[OptionBool]
GUIName = God Rays Only
OptionName = A_GODRAYS_ONLY
DefaultValue = False
DependentOption = C_GODRAYS
GUIDescription = Show only God Rays.

[OptionBool]
GUIName = GodRay Depth Check
OptionName = A_GODRAY_DEPTH_CHECK
DefaultValue = True
DependentOption = C_GODRAYS
GUIDescription = If True, only pixels with depth = 1 get godrays, this prevents white objects from getting godray source which would normally happen in LDR.

[OptionRangeFloat]
GUIName = Depth Check Value
OptionName = A_GODRAY_DEPTH_CHECK_VALUE
MinValue = 0.574
MaxValue = 0.999
StepAmount = 0.005
DefaultValue = 0.999
DependentOption = C_GODRAYS
GUIDescription = The value to perform the Depth Check against.

[OptionRangeFloat]
GUIName = Threshold
OptionName = A_GODRAY_THRESHOLD
MinValue = 0.40
MaxValue = 1.00
StepAmount = 0.01
DefaultValue = 0.99
DependentOption = C_GODRAYS
GUIDescription = Minimum brightness an object must have to cast godrays.

[OptionRangeInteger]
GUIName = Samples
OptionName = B_GODRAY_SAMPLES
MinValue = 32
MaxValue = 512
StepAmount = 32
DefaultValue = 192
DependentOption = C_GODRAYS
GUIDescription = 2^x format values ONLY, meaning 2, 4, 8, 16, etc. How many samples the godrays get.

[OptionRangeFloat]
GUIName = Decay
OptionName = C_GODRAY_DECAY
MinValue = 0.5049
MaxValue = 0.9999
StepAmount = 0.0099
DefaultValue = 0.9900
DependentOption = C_GODRAYS
GUIDescription = How fast they decay. It's logarithmic, 1.0 means infinite long rays which will cover whole screen.

[OptionRangeFloat]
GUIName = Density
OptionName = C_GODRAY_DENSITY
MinValue = 0.2
MaxValue = 2.0
StepAmount = 0.1
DefaultValue = 0.6
DependentOption = C_GODRAYS
GUIDescription = Density of rays, higher means more and brighter rays.

[OptionRangeFloat]
GUIName = Intensity
OptionName = C_GODRAY_INTENSITY
MinValue = 0.00
MaxValue = 3.00
StepAmount = 0.01
DefaultValue = 0.75
DependentOption = C_GODRAYS
GUIDescription = Intensity of God Rays. 0 = Fully transparent, 1 = Original Intensity, 2 = 2x the Intensity

[OptionRangeFloat]
GUIName = Weight
OptionName = C_GODRAY_WEIGHT
MinValue = 0.80
MaxValue = 1.70
StepAmount = 0.01
DefaultValue = 1.11
DependentOption = C_GODRAYS
GUIDescription = Weighting.

[OptionRangeFloat]
GUIName = Light Source Location
OptionName = D_GODRAY_LIGHTSOURCE_LOC
MinValue = 0.00, 0.00
MaxValue = 1.00, 1.00
StepAmount = 0.01, 0.01
DefaultValue = 0.50, 0.50
DependentOption = C_GODRAYS
GUIDescription = X and Y location of the where the light source should originate for the God Rays.

[OptionBool]
GUIName = Scene Tonemapping
OptionName = C_TONEMAP_PASS
DefaultValue = True

[OptionRangeInteger]
GUIName = TonemapType
OptionName = A_TONEMAP_TYPE
MinValue = 0
MaxValue = 3
StepAmount = 1
DefaultValue = 0
DependentOption = C_TONEMAP_PASS

[OptionRangeInteger]
GUIName = FilmOperator
OptionName = A_TONEMAP_FILM
MinValue = 0
MaxValue = 1
StepAmount = 1
DefaultValue = 1
DependentOption = C_TONEMAP_PASS

[OptionRangeFloat]
GUIName = ToneAmount
OptionName = B_TONE_AMOUNT
MinValue = 0.05
MaxValue = 2.00
StepAmount = 0.01
DefaultValue = 0.5
DependentOption = C_TONEMAP_PASS

[OptionRangeFloat]
GUIName = FilmStrength
OptionName = B_TONE_FAMOUNT
MinValue = 0.00
MaxValue = 1.00
StepAmount = 0.01
DefaultValue = 0.19
DependentOption = C_TONEMAP_PASS

[OptionRangeFloat]
GUIName = BlackLevels
OptionName = C_BLACK_LEVELS
MinValue = 0.00
MaxValue = 1.00
StepAmount = 0.01
DefaultValue = 0.06
DependentOption = C_TONEMAP_PASS

[OptionRangeFloat]
GUIName = Exposure
OptionName = D_EXPOSURE
MinValue = 0.50
MaxValue = 1.50
StepAmount = 0.01
DefaultValue = 1.02
DependentOption = C_TONEMAP_PASS

[OptionRangeFloat]
GUIName = Luminance
OptionName = E_LUMINANCE
MinValue = 0.50
MaxValue = 1.50
StepAmount = 0.01
DefaultValue = 1.00
DependentOption = C_TONEMAP_PASS

[OptionRangeFloat]
GUIName = WhitePoint
OptionName = F_WHITEPOINT
MinValue = 0.50
MaxValue = 1.50
StepAmount = 0.01
DefaultValue = 0.95
DependentOption = C_TONEMAP_PASS

[OptionBool]
GUIName = Colour Correction
OptionName = D_COLOR_CORRECTION
DefaultValue = true

[OptionBool]
GUIName = Apply After DOF Instead of Before
OptionName = A_APPLY_CC_AFTER
DefaultValue = false
DependentOption = D_COLOR_CORRECTION

[OptionRangeInteger]
GUIName = CorrectionPalette
OptionName = A_PALETTE
MinValue = 0
MaxValue = 4
StepAmount = 1
DefaultValue = 3
DependentOption = D_COLOR_CORRECTION

[OptionRangeFloat]
GUIName = Channels R|Y|X|H|Y
OptionName = B_RED_CORRECTION
MinValue = 0.10
MaxValue = 8.00
StepAmount = 0.10
DefaultValue = 2.1
DependentOption = D_COLOR_CORRECTION

[OptionRangeFloat]
GUIName = Channels G|X|Y|S|U
OptionName = C_GREEN_CORRECTION
MinValue = 0.10
MaxValue = 8.00
StepAmount = 0.10
DefaultValue = 1.4
DependentOption = D_COLOR_CORRECTION

[OptionRangeFloat]
GUIName = Channels B|Y|Z|V|V
OptionName = D_BLUE_CORRECTION
MinValue = 0.10
MaxValue = 8.00
StepAmount = 0.10
DefaultValue = 0.1
DependentOption = D_COLOR_CORRECTION

[OptionRangeFloat]
GUIName = PaletteStrength
OptionName = E_CORRECT_STR
MinValue = 0.00
MaxValue = 2.00
StepAmount = 0.01
DefaultValue = 0.2
DependentOption = D_COLOR_CORRECTION

[OptionBool]
GUIName = Gamma Correction
OptionName = E_GAMMA_CORRECTION
DefaultValue = True

[OptionRangeFloat]
GUIName = Gamma
OptionName = A_GAMMA
MinValue = 1.00
MaxValue = 4.00
StepAmount = 0.01
DefaultValue = 2.32
DependentOption = E_GAMMA_CORRECTION

[OptionBool]
GUIName = Pixel Vibrance
OptionName = F_PIXEL_VIBRANCE
DefaultValue = true

[OptionRangeFloat]
GUIName = Vibrance
OptionName = A_VIBRANCE
MinValue = -0.50
MaxValue = 1.00
StepAmount = 0.01
DefaultValue = 0.14
DependentOption = F_PIXEL_VIBRANCE

[OptionRangeFloat]
GUIName = RedVibrance
OptionName = B_R_VIBRANCE
MinValue = -1.00
MaxValue = 4.00
StepAmount = 0.01
DefaultValue = 1.00
DependentOption = F_PIXEL_VIBRANCE

[OptionRangeFloat]
GUIName = GreenVibrance
OptionName = C_G_VIBRANCE
MinValue = -1.00
MaxValue = 4.00
StepAmount = 0.01
DefaultValue = 1.00
DependentOption = F_PIXEL_VIBRANCE

[OptionRangeFloat]
GUIName = BlueVibrance
OptionName = D_B_VIBRANCE
MinValue = -1.00
MaxValue = 4.00
StepAmount = 0.01
DefaultValue = 1.00
DependentOption = F_PIXEL_VIBRANCE

[OptionBool]
GUIName = Vignette
OptionName = H_VIGNETTE_PASS
DefaultValue = True

[OptionRangeFloat]
GUIName = VignetteRatio
OptionName = A_VIG_RATIO
MinValue = 1.00
MaxValue = 2.00
StepAmount = 0.01
DefaultValue = 1.49
DependentOption = H_VIGNETTE_PASS

[OptionRangeFloat]
GUIName = VignetteRadius
OptionName = B_VIG_RADIUS
MinValue = 0.50
MaxValue = 2.00
StepAmount = 0.01
DefaultValue = 1.07
DependentOption = H_VIGNETTE_PASS

[OptionRangeFloat]
GUIName = VignetteAmount
OptionName = C_VIG_AMOUNT
MinValue = 0.10
MaxValue = 2.00
StepAmount = 0.01
DefaultValue = 0.1
DependentOption = H_VIGNETTE_PASS

[OptionRangeInteger]
GUIName = VignetteSlope
OptionName = D_VIG_SLOPE
MinValue = 2
MaxValue = 16
StepAmount = 2
DefaultValue = 14
DependentOption = H_VIGNETTE_PASS

[OptionBool]
GUIName = Film Grain
OptionName = J_FILM_GRAIN_PASS
DefaultValue = True

[OptionRangeFloat]
GUIName = GrainSize
OptionName = A_GRAIN_SIZE
MinValue = 1.50
MaxValue = 2.50
StepAmount = 0.10
DefaultValue = 1.5
DependentOption = J_FILM_GRAIN_PASS

[OptionRangeFloat]
GUIName = GrainAmount
OptionName = B_GRAIN_AMOUNT
MinValue = 0.01
MaxValue = 0.50
StepAmount = 0.01
DefaultValue = 0.04
DependentOption = J_FILM_GRAIN_PASS

[OptionRangeInteger]
GUIName = ColouredGrain
OptionName = C_COLORED
MinValue = 0
MaxValue = 1
StepAmount = 1
DefaultValue = 1
DependentOption = J_FILM_GRAIN_PASS

[OptionRangeFloat]
GUIName = ColourAmount
OptionName = D_COLOR_AMOUNT
MinValue = 0.10
MaxValue = 1.00
StepAmount = 0.10
DefaultValue = 0.4
DependentOption = J_FILM_GRAIN_PASS

[OptionRangeFloat]
GUIName = LumaFilter
OptionName = E_LUMA_AMOUNT
MinValue = 0.10
MaxValue = 1.00
StepAmount = 0.10
DefaultValue = 0.1
DependentOption = J_FILM_GRAIN_PASS

[OptionBool]
GUIName = FXAA
OptionName = I_FXAA_PASS
DefaultValue = True

[OptionRangeFloat]
GUIName = SubpixelMax
OptionName = A_FXAA_SUBPIX_MAX
MinValue = 0.00
MaxValue = 1.00
StepAmount = 0.01
DefaultValue = 1
DependentOption = I_FXAA_PASS

[OptionRangeFloat]
GUIName = EdgeThreshold
OptionName = B_FXAA_EDGE_THRESHOLD
MinValue = 0.010
MaxValue = 0.500
StepAmount = 0.001
DefaultValue = 0.157
DependentOption = I_FXAA_PASS

[OptionRangeInteger]
GUIName = ShowEdgeDetection
OptionName = C_FXAA_SHOW_EDGES
MinValue = 0
MaxValue = 1
StepAmount = 1
DefaultValue = 0
DependentOption = I_FXAA_PASS

[Pass]
EntryPoint = AmbientOcclusion_SSAO
DependantOption = A_SSAO_ENABLED
Input0=ColorBuffer
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = AOBlur_SSAO
DependantOption = A_SSAO_ENABLED
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = Merger_SSAO
DependantOption = A_SSAO_ENABLED
Input0=ColorBuffer
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
Input2=PreviousPass
Input2Filter=Linear
Input2Mode=Clamp
[Pass]
EntryPoint = AmbientOcclusion_SSGI
DependantOption = A_SSGI_ENABLED
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = AOBlur_SSGI
DependantOption = A_SSGI_ENABLED
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = Merger_SSGI
DependantOption = A_SSGI_ENABLED
Input0=Pass2
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
Input2=PreviousPass
Input2Filter=Linear
Input2Mode=Clamp
[Pass]
EntryPoint = PreApplyCC
DependantOption = D_COLOR_CORRECTION
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = PS_DOF_MatsoDOF1
DependantOption = B_MATSODOF
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = PS_DOF_MatsoDOF2
DependantOption = B_MATSODOF
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = PS_DOF_MatsoDOF3
DependantOption = B_MATSODOF
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = PS_DOF_MatsoDOF4
DependantOption = B_MATSODOF
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = PostApplyCC
DependantOption = A_APPLY_CC_AFTER
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = PostApplyGC
DependantOption = E_GAMMA_CORRECTION
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = A_ReduceSize
DependantOption = C_BLOOM
OutputScale = 0.5
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = BloomH
DependantOption = C_BLOOM
OutputScale = 0.25
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = BloomV
DependantOption = C_BLOOM
OutputScale = 0.25
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = BloomH
DependantOption = C_BLOOM
OutputScale = 0.125
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = BloomVwithAnamFlare
DependantOption = C_BLOOM
OutputScale = 0.125
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = BloomScatering
DependantOption = C_BLOOM
OutputScale = 0.03125
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = BloomMerger
DependantOption = C_BLOOM
Input0=Pass12
Input0Filter=Linear
Input0Mode=Clamp
Input1=Pass17
Input1Filter=Nearest
Input1Mode=Clamp
Input2=Pass18
Input2Filter=Linear
Input2Mode=Clamp
Input3=DepthBuffer
Input3Filter=Nearest
Input3Mode=Clamp
[Pass]
EntryPoint = LensPrePass
DependantOption = C_GODRAYS
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = LensV
DependantOption = C_GODRAYS
OutputScale = 0.5
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = LensH
DependantOption = C_GODRAYS
OutputScale = 0.5
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
Input1=DepthBuffer
Input1Filter=Nearest
Input1Mode=Clamp
[Pass]
EntryPoint = LensMerger
DependantOption = C_GODRAYS
Input0=Pass19
Input0Filter=Linear
Input0Mode=Clamp
Input1=PreviousPass
Input1Filter=Linear
Input1Mode=Clamp
[Pass]
EntryPoint = SceneTonemapping
DependantOption = C_TONEMAP_PASS
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = PixelVibrance
DependantOption = F_PIXEL_VIBRANCE
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = Vignette
DependantOption = H_VIGNETTE_PASS
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = Fxaa
DependantOption = I_FXAA_PASS
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[Pass]
EntryPoint = FilmGrain
DependantOption = J_FILM_GRAIN_PASS
Input0=PreviousPass
Input0Filter=Linear
Input0Mode=Clamp
[/configuration]
*/
float3 GetNormalFromDepth(float fDepth)
{
	float depth1 = SampleDepthOffset(int2(0, 1));
	float depth2 = SampleDepthOffset(int2(1, 0));
	float2 invres = GetInvResolution();
	float3 p1 = float3(0, invres.y, depth1 - fDepth);
	float3 p2 = float3(invres.x, 0, depth2 - fDepth);

	float3 normal = cross(p1, p2);
	normal.z = -normal.z;

	return normalize(normal);
}

float4 BilateralX(float depth)
{
	float limit = GetOption(D_FILTER_LIMIT);
	float count = 1.0;
	float4 value = SamplePrev();

	float Weight = min(sign(limit - abs(SampleDepthOffset(int2(-3, 0)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(-3, 0)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(-2, 0)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(-2, 0)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(-1, 0)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(-1, 0)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(1, 0)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(1, 0)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(2, 0)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(2, 0)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(3, 0)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(3, 0)) * Weight;
	count += Weight;
	return value / count;
}

float4 BilateralY(float depth)
{
	float limit = GetOption(D_FILTER_LIMIT);
	float count = 1.0;
	float4 value = SamplePrev();

	float Weight = min(sign(limit - abs(SampleDepthOffset(int2(0, -3)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(0, -3)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(0, -2)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(0, -2)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(0, -1)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(0, -1)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(0, 1)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(0, 1)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(0, 2)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(0, 2)) * Weight;
	count += Weight;
	Weight = min(sign(limit - abs(SampleDepthOffset(int2(0, 3)) - depth)) + 1.0, 1.0);
	value += SamplePrevOffset(int2(0, 3)) * Weight;
	count += Weight;
	return value / count;
}

float3 GetEyePosition(float2 uv, float eye_z, float2 InvFocalLen) {
	uv = (uv * float2(2.0, -2.0) - float2(1.0, -1.0));
	float3 pos = float3(uv * InvFocalLen * eye_z, eye_z);
	return pos;
}

float2 GetRandom2_10(float2 uv) {
	float noiseX = (frac(sin(dot(uv, float2(12.9898, 78.233) * 2.0)) * 43758.5453));
	float noiseY = sqrt(1 - noiseX * noiseX);
	return float2(noiseX, noiseY);
}

float4 PS_AO_Blur(float2 axis)
{
	float gaussweight[7] = { 0.111220, 0.107798, 0.098151, 0.083953, 0.067458, 0.050920, 0.036108 };
	float4 sum = float4(0.0, 0.0, 0.0, 0.0);
	float totalweight = 0.0;
	float4 base = SamplePrev();
	float4 temp = sum;

	float centerdepth = SampleDepth();
	float2 texcoord = GetCoordinates();
	axis *= GetInvResolution();
	for (int r = -6; r <= 6; ++r)
	{
		float2 coord = texcoord.xy + axis * r;
		temp = SamplePrevLocation(coord);
		float tempdepth = SampleDepthLocation(coord);
		float weight = 0.3 + gaussweight[abs(r)];
		weight *= max(0.0, 1.0 - (1000.0 * GetOption(AO_SHARPNESS)) * abs(tempdepth - centerdepth));
		sum += temp * weight;
		totalweight += weight;
	}

	return sum / (totalweight + 0.0001);
}

void AOBlur_SSAO()
{
	SetOutput(BilateralX(SampleDepth()));
}

void AOBlur_SSGI()
{
	SetOutput(PS_AO_Blur(float2(0, 1)));
}

float4 SSAO()
{
	float3 PoissonDisc[] = {
		float3(-0.367046f, 0.692618f, 0.0136723f),
		float3(0.262978f, -0.363506f, 0.231819f),
		float3(-0.734306f, -0.451643f, 0.264779f),
		float3(-0.532456f, 0.683096f, 0.552049f),
		float3(0.672536f, 0.283731f, 0.0694296f),
		float3(-0.194678f, 0.548204f, 0.56859f),
		float3(-0.87347f, -0.572741f, 0.923795f),
		float3(0.548936f, -0.717277f, 0.0201727f),
		float3(0.48381f, 0.691397f, 0.699088f),
		float3(-0.592273f, 0.41966f, 0.413953f),
		float3(-0.448042f, -0.957396f, 0.123234f),
		float3(-0.618458f, 0.112949f, 0.412946f),
		float3(-0.412763f, 0.122227f, 0.732078f),
		float3(0.816462f, -0.900815f, 0.741417f),
		float3(-0.0381787f, 0.511521f, 0.799768f),
		float3(-0.688284f, 0.310099f, 0.472732f),
		float3(-0.368023f, 0.720572f, 0.544206f),
		float3(-0.379192f, -0.55504f, 0.035371f),
		float3(0.15482f, 0.0353709f, 0.543779f),
		float3(0.153417f, -0.521409f, 0.943724f),
		float3(-0.168371f, -0.702933f, 0.145665f),
		float3(-0.673391f, -0.925657f, 0.61391f),
		float3(-0.479171f, -0.131993f, 0.659932f),
		float3(0.0549638f, -0.470809f, 0.420759f),
		float3(0.899594f, 0.955077f, 0.54857f),
		float3(-0.230689f, 0.660573f, 0.548112f),
		float3(0.0421461f, -0.19895f, 0.121799f),
		float3(-0.229774f, -0.30137f, 0.507492f),
		float3(-0.983642f, 0.468551f, 0.0393994f),
		float3(-0.00857568f, 0.440657f, 0.337046f),
		float3(0.730461f, -0.283914f, 0.789941f),
		float3(0.271828f, -0.226356f, 0.317026f),
		float3(-0.178869f, -0.946837f, 0.073336f),
		float3(0.389813f, -0.110508f, 0.0549944f),
		float3(0.0242622f, 0.893613f, 0.26957f),
		float3(-0.857601f, 0.0219429f, 0.45146f),
		float3(-0.15659f, 0.550401f, 3.05185e-005f),
		float3(0.0555742f, -0.354656f, 0.573412f),
		float3(-0.267373f, 0.117466f, 0.488571f),
		float3(-0.533799f, -0.431928f, 0.226661f),
		float3(0.49852f, -0.750908f, 0.412427f),
		float3(-0.300882f, 0.366314f, 0.558245f),
		float3(-0.176f, 0.511521f, 0.722465f),
		float3(-0.0514847f, -0.703543f, 0.180273f),
		float3(-0.429914f, 0.0774255f, 0.161534f),
		float3(-0.416791f, -0.788385f, 0.328135f),
		float3(0.127293f, -0.115146f, 0.958586f),
		float3(-0.34959f, -0.278481f, 0.168706f),
		float3(-0.645192f, 0.168798f, 0.577105f),
		float3(-0.190771f, -0.622669f, 0.257851f),
		float3(0.718986f, -0.275369f, 0.602039f),
		float3(-0.444258f, -0.872982f, 0.0275582f),
		float3(0.793512f, 0.0511185f, 0.33964f),
		float3(-0.143651f, 0.155614f, 0.368877f),
		float3(-0.777093f, 0.246864f, 0.290628f),
		float3(0.202979f, -0.61742f, 0.233802f),
		float3(0.198523f, 0.425153f, 0.409162f),
		float3(-0.629688f, 0.597461f, 0.120212f),
		float3(0.0448316f, -0.689566f, 0.0241707f),
		float3(-0.190039f, 0.426496f, 0.254463f),
		float3(-0.255776f, 0.722831f, 0.527451f),
		float3(-0.821528f, 0.303751f, 0.140172f),
		float3(0.696646f, 0.168981f, 0.404492f),
		float3(-0.240211f, -0.109653f, 0.463301f),
	};

	const float2 rndNorm[] =
	{
		float2(0.505277f, 0.862957f),
		float2(-0.554562f, 0.832142f),
		float2(0.663051f, 0.748574f),
		float2(-0.584629f, -0.811301f),
		float2(-0.702343f, 0.711838f),
		float2(0.843108f, -0.537744f),
		float2(0.85856f, 0.512713f),
		float2(0.506966f, -0.861966f),
		float2(0.614758f, -0.788716f),
		float2(0.993426f, -0.114472f),
		float2(-0.676375f, 0.736558f),
		float2(-0.891668f, 0.45269f),
		float2(0.226367f, 0.974042f),
		float2(-0.853615f, -0.520904f),
		float2(0.467359f, 0.884067f),
		float2(-0.997111f, 0.0759529f),
	};

	float2 coords = GetCoordinates();
	float fCurrDepth = SampleDepth();
	float4 Occlusion = float4(0.0, 0.0, 0.0, 1.0);
	if (fCurrDepth < 0.9999)
	{
		float sample_range = GetOption(C_SAMPLE_RANGE) * fCurrDepth;
		float3 vViewNormal = GetNormalFromDepth(fCurrDepth);
		uint2 fragcoord = uint2(GetFragmentCoord()) & 3;
		uint rndidx = fragcoord.y * 4 + fragcoord.x;
		float3 vRandom = float3(rndNorm[rndidx], 0);
		float fAO = 0;
		const int NUMSAMPLES = B_SSAO_SAMPLES;
		for (int s = 0; s < NUMSAMPLES; s++)
		{
			float3 offset = PoissonDisc[s];
			float3 vReflRay = reflect(offset, vRandom);

			float fFlip = sign(dot(vViewNormal, vReflRay));
			vReflRay *= fFlip;

			float sD = fCurrDepth - (vReflRay.z * sample_range);
			float2 location = saturate(coords + (sample_range * vReflRay.xy / fCurrDepth));
			float fSampleDepth = SampleDepthLocation(location);
			float fDepthDelta = saturate(sD - fSampleDepth);

			fDepthDelta *= 1 - smoothstep(0, GetOption(E_MAX_DEPTH), fDepthDelta);

			if (fDepthDelta > GetOption(F_MIN_DEPTH) && fDepthDelta < GetOption(E_MAX_DEPTH))
			{
#if A_SSAO_SSGI_ENABLED == 1
				Occlusion.rgb += SampleLocation(location).rgb;
#endif
				fAO += pow(1 - fDepthDelta, 2.5);
			}
		}
		Occlusion.a = 1.0 - (fAO / float(NUMSAMPLES));
#if A_SSAO_SSGI_ENABLED == 1
		Occlusion.rgb = Occlusion.rgb / float(NUMSAMPLES);
#endif
		Occlusion = saturate(Occlusion);
	}
	return Occlusion;
}

float4 PS_AO_SSGI()
{
	float depth = SampleDepth();
	float2 texcoord = GetCoordinates();
	float4 Occlusion1R = float4(0.0, 0.0, 0.0, 1.0);
	if (depth < 0.9999)
	{
		float2 sample_offset[24] =
		{
			float2(-0.1376476f,  0.2842022f),float2(-0.626618f ,  0.4594115f),
			float2(-0.8903138f, -0.05865424f),float2(0.2871419f,  0.8511679f),
			float2(-0.1525251f, -0.3870117f),float2(0.6978705f, -0.2176773f),
			float2(0.7343006f,  0.3774331f),float2(0.1408805f, -0.88915f),
			float2(-0.6642616f, -0.543601f),float2(-0.324815f, -0.093939f),
			float2(-0.1208579f , 0.9152063f),float2(-0.4528152f, -0.9659424f),
			float2(-0.6059740f,  0.7719080f),float2(-0.6886246f, -0.5380305f),
			float2(0.5380307f, -0.2176773f),float2(0.7343006f,  0.9999345f),
			float2(-0.9976073f, -0.7969264f),float2(-0.5775355f,  0.2842022f),
			float2(-0.626618f ,  0.9115176f),float2(-0.29818942f, -0.0865424f),
			float2(0.9161239f,  0.8511679f),float2(-0.1525251f, -0.07103951f),
			float2(0.7022788f, -0.823825f),float2(0.60250657f,  0.64525909f)
		};

		float sample_radius[24] =
		{
			0.5162497,0.2443335,
			0.1014819,0.1574599,
			0.6538922,0.5637644,
			0.6347278,0.2467654,
			0.5642318,0.0035689,
			0.6384532,0.3956547,
			0.7049623,0.3482861,
			0.7484038,0.2304858,
			0.0043161,0.5423726,
			0.5025704,0.4066662,
			0.2654198,0.8865175,
			0.9505567,0.9936577
		};

		float2 InvFocalLen = float2(1.0, tan(0.5235987756));
		float aspect = GetInvResolution().y * GetResolution().x;
		InvFocalLen.x = InvFocalLen.y * aspect;
		float3 pos = GetEyePosition(texcoord.xy, depth, InvFocalLen);
		float3 dx = ddx(pos);
		float3 dy = ddy(pos);
		float3 norm = normalize(cross(dx, dy));
		norm.y *= -1;

		float4 gi = float4(0.0, 0.0, 0.0, 0.0);
		float is = 0.0, as = 0.0;

		float rangeZ = 5000.0;




		float2 rand_vec = GetRandom2_10(texcoord.xy);
		float2 rand_vec2 = GetRandom2_10(-texcoord.xy);
		float2 sample_vec_divisor = InvFocalLen * depth / (GetOption(fSSGISamplingRange) * GetInvResolution().xy);
		float2 sample_center = texcoord.xy + norm.xy / sample_vec_divisor * float2(1, aspect);
		float ii_sample_center_depth = depth * rangeZ + norm.z * GetOption(fSSGISamplingRange) * 30;
		float ao_sample_center_depth = depth * rangeZ + norm.z * GetOption(fSSGISamplingRange) * 5;



		for (int i = 0; i < iSSGISamples; i++)
		{
			float2 sample_vec = reflect(sample_offset[i], rand_vec) / sample_vec_divisor;
			float2 sample_coords = sample_center + sample_vec *  float2(1, aspect);
			float  sample_depth = rangeZ * SampleDepthLocation(sample_coords);

			float ii_curr_sample_radius = sample_radius[i] * GetOption(fSSGISamplingRange) * 30;
			float ao_curr_sample_radius = sample_radius[i] * GetOption(fSSGISamplingRange) * 5;

			gi.a += clamp(0, ao_sample_center_depth + ao_curr_sample_radius - sample_depth, 2 * ao_curr_sample_radius);
			gi.a -= clamp(0, ao_sample_center_depth + ao_curr_sample_radius - sample_depth - GetOption(fSSGIModelThickness), 2 * ao_curr_sample_radius);

			if ((sample_depth < ii_sample_center_depth + ii_curr_sample_radius) &&
				(sample_depth > ii_sample_center_depth - ii_curr_sample_radius)) {
				gi.rgb += SampleLocation(sample_coords).rgb;
			}

			is += 1.0f;
			as += 2.0f * ao_curr_sample_radius;
		}

		gi.rgb /= is * 5.0f;
		gi.a /= as;

		gi.rgb = 0.0 + gi.rgb * GetOption(fSSGIIlluminationMult);
		gi.a = 1.0 - gi.a   * GetOption(fSSGIOcclusionMult);

		gi.rgb = lerp(dot(gi.rgb, float3(0.333, 0.333, 0.333)) * float3(1.0, 1.0, 1.0), gi.rgb, GetOption(fSSGISaturation));

		Occlusion1R = gi;
	}
	return Occlusion1R;
}

void AmbientOcclusion_SSAO()
{
	float4 value = float4(1.0, 1.0, 1.0, 1.0);
	value = SSAO();
	SetOutput(value);
}

void AmbientOcclusion_SSGI()
{
	float4 value = float4(1.0, 1.0, 1.0, 1.0);
	value = PS_AO_SSGI();
	SetOutput(value);
}

#define PI 		3.1415972
#define PIOVER180 	0.017453292


float4 GetMatsoDOFCA(float2 tex, float CoC)
{
	float3 ChromaPOW = float3(1, 1, 1) * GetOption(fMatsoDOFChromaPow) * CoC;
	float3 chroma = pow(float3(0.5, 1.0, 1.5), ChromaPOW) * 0.5;
	tex = (2.0 * tex - 1.0);
	float2 tr = (tex * chroma.r) + 0.5;
	float2 tg = (tex * chroma.g) + 0.5;
	float2 tb = (tex * chroma.b) + 0.5;

	float3 color = float3(SamplePrevLocation(tr).r, SamplePrevLocation(tg).g, SamplePrevLocation(tb).b) * (1.0 - CoC);

	return float4(color, 1.0);
}

float4 GetMatsoDOFBlur(int axis, float2 coord)
{
	float4 tcol = SamplePrevLocation(coord);
	float scenedepth = SampleDepth();
	float scenefocus = 0.0f;
	if (OptionEnabled(DOF_A_FOCUSPOINT_RANGE))
	{
		scenefocus = GetOption(DOF_B_FOCUSPOINT).x;
	}
	else
	{
		scenefocus = SampleDepthLocation(GetOption(DOF_B_FOCUSPOINT));
	}
	float depthdiff = abs(scenedepth - scenefocus);
	if (OptionEnabled(DOF_A_FOCUSPOINT_RANGE))
	{
		if (abs(depthdiff) < GetOption(DOF_B_FOCUSPOINT).y)
		{
			depthdiff *= 0.5f * depthdiff * depthdiff;
		}
	}
	depthdiff = (scenedepth < scenefocus) ? pow(depthdiff, GetOption(DOF_NEARBLURCURVE))*(1.0f + pow(abs(0.5f - coord.x)*depthdiff + 0.1f, 2.0)*GetOption(DOF_VIGNETTE)) : depthdiff;
	depthdiff = (scenedepth > scenefocus) ? pow(depthdiff, GetOption(DOF_FARBLURCURVE)) : depthdiff;

	float2 discRadius = depthdiff * GetOption(DOF_BLURRADIUS)*GetInvResolution()*0.5 / float(iMatsoDOFBokehQuality);

	int passnumber = 1;

	float sf = 0;

	float2 tdirs[4] = { float2(-0.306, 0.739), float2(0.306, 0.739), float2(-0.739, 0.306), float2(-0.739, -0.306) };
	float wValue = (1.0 + pow(length(tcol.rgb) + 0.1, GetOption(fMatsoDOFBokehCurve))) * (1.0 - GetOption(fMatsoDOFBokehLight));	// special recipe from papa Matso ;)

	for (int i = -iMatsoDOFBokehQuality; i < iMatsoDOFBokehQuality; i++)
	{
		float2 taxis = tdirs[axis];

		taxis.x = cos(GetOption(fMatsoDOFBokehAngle)*PIOVER180)*taxis.x - sin(GetOption(fMatsoDOFBokehAngle)*PIOVER180)*taxis.y;
		taxis.y = sin(GetOption(fMatsoDOFBokehAngle)*PIOVER180)*taxis.x + cos(GetOption(fMatsoDOFBokehAngle)*PIOVER180)*taxis.y;

		float2 tdir = float(i) * taxis * discRadius;
		float2 tcoord = coord.xy + tdir.xy;
		float4 ct;
		if (OptionEnabled(bMatsoDOFChromaEnable))
		{
			ct = GetMatsoDOFCA(tcoord.xy, discRadius.x);
		}
		else
		{
			ct = SamplePrevLocation(tcoord.xy);
		}
		float w = 0.0;
		float b = dot(ct.rgb, float3(0.333, 0.333, 0.333)) + length(ct.rgb) + 0.1;
		w = pow(b, GetOption(fMatsoDOFBokehCurve)) + abs(float(i));
		tcol += ct * w;
		wValue += w;
	}

	tcol /= wValue;

	return float4(tcol.xyz, 1.0);
}

void PS_DOF_MatsoDOF1()
{
	SetOutput(GetMatsoDOFBlur(2, GetCoordinates()));
}

void PS_DOF_MatsoDOF2()
{
	SetOutput(GetMatsoDOFBlur(3, GetCoordinates()));
}

void PS_DOF_MatsoDOF3()
{
	SetOutput(GetMatsoDOFBlur(0, GetCoordinates()));
}

void PS_DOF_MatsoDOF4()
{
	SetOutput(GetMatsoDOFBlur(1, GetCoordinates()));
}


/*------------------------------------------------------------------------------
[GLOBALS|FUNCTIONS]
------------------------------------------------------------------------------*/

#define Epsilon (1e-10)
#define lumCoeff float3(0.299f, 0.587f, 0.114f)

//Average relative luminance
float AvgLuminance(float3 color)
{
	return sqrt(dot(color * color, lumCoeff));
}

//Conversion matrices
float3 RGBtoXYZ(float3 rgb)
{
	const float3x3 m = float3x3(
		0.4124564, 0.3575761, 0.1804375,
		0.2126729, 0.7151522, 0.0721750,
		0.0193339, 0.1191920, 0.9503041);

	return mul(rgb, m);
}

float3 XYZtoRGB(float3 xyz)
{
	const float3x3 m = float3x3(
		3.2404542, -1.5371385, -0.4985314,
		-0.9692660, 1.8760108, 0.0415560,
		0.0556434, -0.2040259, 1.0572252);

	return mul(xyz, m);
}

float3 RGBtoYUV(float3 RGB)
{
	const float3x3 m = float3x3(
		0.2126, 0.7152, 0.0722,
		-0.09991, -0.33609, 0.436,
		0.615, -0.55861, -0.05639);

	return mul(RGB, m);
}

float3 YUVtoRGB(float3 YUV)
{
	const float3x3 m = float3x3(
		1.000, 0.000, 1.28033,
		1.000, -0.21482, -0.38059,
		1.000, 2.12798, 0.000);

	return mul(YUV, m);
}

//Converting XYZ to Yxy
float3 XYZtoYxy(float3 xyz)
{
	float3 Yxy;
	float w = 1.0 / (xyz.r + xyz.g + xyz.b);

	Yxy.r = xyz.g;
	Yxy.g = xyz.r * w;
	Yxy.b = xyz.g * w;

	return Yxy;
}

//Converting Yxy to XYZ
float3 YxytoXYZ(float3 Yxy)
{
	float3 xyz;
	float w = 1.0 / Yxy.b;
	xyz.g = Yxy.r;
	xyz.r = Yxy.r * Yxy.g * w;
	xyz.b = Yxy.r * (1.0 - Yxy.g - Yxy.b) * w;
	return xyz;
}

/*------------------------------------------------------------------------------
[SCENE TONE MAPPING CODE SECTION]
------------------------------------------------------------------------------*/

float3 EncodeGamma(float3 color, float gamma)
{
	color = saturate(color);
	color.r = (color.r <= 0.0404482362771082) ?
		color.r / 12.92 : pow((color.r + 0.055) / 1.055, gamma);
	color.g = (color.g <= 0.0404482362771082) ?
		color.g / 12.92 : pow((color.g + 0.055) / 1.055, gamma);
	color.b = (color.b <= 0.0404482362771082) ?
		color.b / 12.92 : pow((color.b + 0.055) / 1.055, gamma);

	return color;
}

float3 FilmicCurve(float3 color)
{
	float3 T = color;
	float tnamn = GetOption(B_TONE_AMOUNT);

	float A = 0.100;
	float B = 0.300;
	float C = 0.100;
	float D = tnamn;
	float E = 0.020;
	float F = 0.300;
	float W = 1.012;

	T.r = ((T.r*(A*T.r + C*B) + D*E) / (T.r*(A*T.r + B) + D*F)) - E / F;
	T.g = ((T.g*(A*T.g + C*B) + D*E) / (T.g*(A*T.g + B) + D*F)) - E / F;
	T.b = ((T.b*(A*T.b + C*B) + D*E) / (T.b*(A*T.b + B) + D*F)) - E / F;

	float denom = ((W*(A*W + C*B) + D*E) / (W*(A*W + B) + D*F)) - E / F;
	float3 white = float3(denom, denom, denom);

	T = T / white;
	color = saturate(T);

	return color;
}

float3 FilmicTonemap(float3 color)
{
	float3 tone = color;

	float3 black = float3(0.0, 0.0, 0.0);
	tone = max(black, tone);

	tone.r = (tone.r * (6.2 * tone.r + 0.5)) / (tone.r * (6.2 * tone.r + 1.66) + 0.066);
	tone.g = (tone.g * (6.2 * tone.g + 0.5)) / (tone.g * (6.2 * tone.g + 1.66) + 0.066);
	tone.b = (tone.b * (6.2 * tone.b + 0.5)) / (tone.b * (6.2 * tone.b + 1.66) + 0.066);

	const float gamma = 2.42;
	tone = EncodeGamma(tone, gamma);

	color = lerp(color, tone, GetOption(B_TONE_FAMOUNT));

	return color;
}

float4 TonemapPass(float4 color)
{
	float luminanceAverage = GetOption(E_LUMINANCE);
	float bmax = max(color.r, max(color.g, color.b));

	float blevel = pow(saturate(bmax), GetOption(C_BLACK_LEVELS));
	color.rgb = color.rgb * blevel;

	if (GetOption(A_TONEMAP_FILM) == 1) { color.rgb = FilmicTonemap(color.rgb); }
	if (GetOption(A_TONEMAP_TYPE) == 1) { color.rgb = FilmicCurve(color.rgb); }

	float3 XYZ = RGBtoXYZ(color.rgb);

	// XYZ -> Yxy conversion
	float3 Yxy = XYZtoYxy(XYZ);

	// (Wt) Tone mapped scaling of the initial wp before input modifiers
	float Wt = saturate(Yxy.r / AvgLuminance(XYZ));

	if (GetOption(A_TONEMAP_TYPE) == 2) { Yxy.r = FilmicCurve(Yxy).r; }

	// (Lp) Map average luminance to the middlegrey zone by scaling pixel luminance
	float Lp = Yxy.r * GetOption(D_EXPOSURE) / (luminanceAverage + Epsilon);

	// (Wp) White point calculated, based on the toned white, and input modifier
	float Wp = abs(Wt) * GetOption(F_WHITEPOINT);

	// (Ld) Scale all luminance within a displayable range of 0 to 1
	Yxy.r = (Lp * (1.0 + Lp / (Wp * Wp))) / (1.0 + Lp);

	// Yxy -> XYZ conversion
	XYZ = YxytoXYZ(Yxy);

	color.rgb = XYZtoRGB(XYZ);
	color.a = AvgLuminance(color.rgb);

	return color;
}


/*------------------------------------------------------------------------------
[PIXEL VIBRANCE CODE SECTION]
------------------------------------------------------------------------------*/

float4 VibrancePass(float4 color)
{
	float vib = GetOption(A_VIBRANCE);
	float luma = AvgLuminance(color.rgb);

	float colorMax = max(color.r, max(color.g, color.b));
	float colorMin = min(color.r, min(color.g, color.b));

	float colorSaturation = colorMax - colorMin;
	float3 colorCoeff = float3(GetOption(B_R_VIBRANCE)*
		vib, GetOption(C_G_VIBRANCE) * vib, GetOption(D_B_VIBRANCE) * vib);

	color.rgb = lerp(float3(luma, luma, luma), color.rgb, (1.0 + (colorCoeff * (1.0 - (sign(colorCoeff) * colorSaturation)))));
	color.a = AvgLuminance(color.rgb);

	return saturate(color); //Debug: return colorSaturation.xxxx;
}

/*------------------------------------------------------------------------------
[FXAA CODE SECTION]
------------------------------------------------------------------------------*/

#define FXAA_QUALITY__PS 9
#define FXAA_QUALITY__P0 1.0
#define FXAA_QUALITY__P1 1.5
#define FXAA_QUALITY__P2 2.0
#define FXAA_QUALITY__P3 2.0
#define FXAA_QUALITY__P4 2.0
#define FXAA_QUALITY__P5 2.0
#define FXAA_QUALITY__P6 2.0
#define FXAA_QUALITY__P7 4.0
#define FXAA_QUALITY__P8 8.0

float FxaaLuma(float4 rgba) { return rgba.y; }

float4 FxaaPixelShader(float4 rgbyM, float2 RcpFrame, float Subpix, float EdgeThreshold, float EdgeThresholdMin)
{
	float2 posM = GetCoordinates();
	float lumaM = FxaaLuma(rgbyM);
	float lumaS = FxaaLuma(SampleOffset(int2(0, 1)));
	float lumaE = FxaaLuma(SampleOffset(int2(1, 0)));
	float lumaN = FxaaLuma(SampleOffset(int2(0, -1)));
	float lumaW = FxaaLuma(SampleOffset(int2(-1, 0)));

	float maxSM = max(lumaS, lumaM);
	float minSM = min(lumaS, lumaM);
	float maxESM = max(lumaE, maxSM);
	float minESM = min(lumaE, minSM);
	float maxWN = max(lumaN, lumaW);
	float minWN = min(lumaN, lumaW);
	float rangeMax = max(maxWN, maxESM);
	float rangeMin = min(minWN, minESM);
	float rangeMaxScaled = rangeMax * EdgeThreshold;
	float range = rangeMax - rangeMin;
	float rangeMaxClamped = max(EdgeThresholdMin, rangeMaxScaled);
	bool earlyExit = range < rangeMaxClamped;

	if (earlyExit)
		return rgbyM;

	float lumaNW = FxaaLuma(SampleOffset(int2(-1, -1)));
	float lumaSE = FxaaLuma(SampleOffset(int2(1, 1)));
	float lumaNE = FxaaLuma(SampleOffset(int2(1, -1)));
	float lumaSW = FxaaLuma(SampleOffset(int2(-1, 1)));

	float lumaNS = lumaN + lumaS;
	float lumaWE = lumaW + lumaE;
	float subpixRcpRange = 1.0 / range;
	float subpixNSWE = lumaNS + lumaWE;
	float edgeHorz1 = (-2.0 * lumaM) + lumaNS;
	float edgeVert1 = (-2.0 * lumaM) + lumaWE;

	float lumaNESE = lumaNE + lumaSE;
	float lumaNWNE = lumaNW + lumaNE;
	float edgeHorz2 = (-2.0 * lumaE) + lumaNESE;
	float edgeVert2 = (-2.0 * lumaN) + lumaNWNE;

	float lumaNWSW = lumaNW + lumaSW;
	float lumaSWSE = lumaSW + lumaSE;
	float edgeHorz4 = (abs(edgeHorz1) * 2.0) + abs(edgeHorz2);
	float edgeVert4 = (abs(edgeVert1) * 2.0) + abs(edgeVert2);
	float edgeHorz3 = (-2.0 * lumaW) + lumaNWSW;
	float edgeVert3 = (-2.0 * lumaS) + lumaSWSE;
	float edgeHorz = abs(edgeHorz3) + edgeHorz4;
	float edgeVert = abs(edgeVert3) + edgeVert4;

	float subpixNWSWNESE = lumaNWSW + lumaNESE;
	float lengthSign = RcpFrame.x;
	bool horzSpan = edgeHorz >= edgeVert;
	float subpixA = subpixNSWE * 2.0 + subpixNWSWNESE;

	if (!horzSpan) lumaN = lumaW;
	if (!horzSpan) lumaS = lumaE;
	if (horzSpan) lengthSign = RcpFrame.y;
	float subpixB = (subpixA * (1.0 / 12.0)) - lumaM;

	float gradientN = lumaN - lumaM;
	float gradientS = lumaS - lumaM;
	float lumaNN = lumaN + lumaM;
	float lumaSS = lumaS + lumaM;
	bool pairN = abs(gradientN) >= abs(gradientS);
	float gradient = max(abs(gradientN), abs(gradientS));
	if (pairN) lengthSign = -lengthSign;
	float subpixC = saturate(abs(subpixB) * subpixRcpRange);

	float2 posB;
	posB.x = posM.x;
	posB.y = posM.y;
	float2 offNP;
	offNP.x = (!horzSpan) ? 0.0 : RcpFrame.x;
	offNP.y = (horzSpan) ? 0.0 : RcpFrame.y;
	if (!horzSpan) posB.x += lengthSign * 0.5;
	if (horzSpan) posB.y += lengthSign * 0.5;

	float2 posN;
	posN.x = posB.x - offNP.x * FXAA_QUALITY__P0;
	posN.y = posB.y - offNP.y * FXAA_QUALITY__P0;
	float2 posP;
	posP.x = posB.x + offNP.x * FXAA_QUALITY__P0;
	posP.y = posB.y + offNP.y * FXAA_QUALITY__P0;
	float subpixD = ((-2.0)*subpixC) + 3.0;
	float lumaEndN = FxaaLuma(SampleLocation(posN));
	float subpixE = subpixC * subpixC;
	float lumaEndP = FxaaLuma(SampleLocation(posP));

	if (!pairN) lumaNN = lumaSS;
	float gradientScaled = gradient * 1.0 / 4.0;
	float lumaMM = lumaM - lumaNN * 0.5;
	float subpixF = subpixD * subpixE;
	bool lumaMLTZero = lumaMM < 0.0;

	lumaEndN -= lumaNN * 0.5;
	lumaEndP -= lumaNN * 0.5;
	bool doneN = abs(lumaEndN) >= gradientScaled;
	bool doneP = abs(lumaEndP) >= gradientScaled;
	if (!doneN) posN.x -= offNP.x * FXAA_QUALITY__P1;
	if (!doneN) posN.y -= offNP.y * FXAA_QUALITY__P1;
	bool doneNP = (!doneN) || (!doneP);
	if (!doneP) posP.x += offNP.x * FXAA_QUALITY__P1;
	if (!doneP) posP.y += offNP.y * FXAA_QUALITY__P1;

	if (doneNP) {
		if (!doneN) lumaEndN = FxaaLuma(SampleLocation(posN.xy));
		if (!doneP) lumaEndP = FxaaLuma(SampleLocation(posP.xy));
		if (!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
		if (!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
		doneN = abs(lumaEndN) >= gradientScaled;
		doneP = abs(lumaEndP) >= gradientScaled;
		if (!doneN) posN.x -= offNP.x * FXAA_QUALITY__P2;
		if (!doneN) posN.y -= offNP.y * FXAA_QUALITY__P2;
		doneNP = (!doneN) || (!doneP);
		if (!doneP) posP.x += offNP.x * FXAA_QUALITY__P2;
		if (!doneP) posP.y += offNP.y * FXAA_QUALITY__P2;

		if (doneNP) {
			if (!doneN) lumaEndN = FxaaLuma(SampleLocation(posN.xy));
			if (!doneP) lumaEndP = FxaaLuma(SampleLocation(posP.xy));
			if (!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
			if (!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
			doneN = abs(lumaEndN) >= gradientScaled;
			doneP = abs(lumaEndP) >= gradientScaled;
			if (!doneN) posN.x -= offNP.x * FXAA_QUALITY__P3;
			if (!doneN) posN.y -= offNP.y * FXAA_QUALITY__P3;
			doneNP = (!doneN) || (!doneP);
			if (!doneP) posP.x += offNP.x * FXAA_QUALITY__P3;
			if (!doneP) posP.y += offNP.y * FXAA_QUALITY__P3;

			if (doneNP) {
				if (!doneN) lumaEndN = FxaaLuma(SampleLocation(posN.xy));
				if (!doneP) lumaEndP = FxaaLuma(SampleLocation(posP.xy));
				if (!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
				if (!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
				doneN = abs(lumaEndN) >= gradientScaled;
				doneP = abs(lumaEndP) >= gradientScaled;
				if (!doneN) posN.x -= offNP.x * FXAA_QUALITY__P4;
				if (!doneN) posN.y -= offNP.y * FXAA_QUALITY__P4;
				doneNP = (!doneN) || (!doneP);
				if (!doneP) posP.x += offNP.x * FXAA_QUALITY__P4;
				if (!doneP) posP.y += offNP.y * FXAA_QUALITY__P4;

				if (doneNP) {
					if (!doneN) lumaEndN = FxaaLuma(SampleLocation(posN.xy));
					if (!doneP) lumaEndP = FxaaLuma(SampleLocation(posP.xy));
					if (!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
					if (!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
					doneN = abs(lumaEndN) >= gradientScaled;
					doneP = abs(lumaEndP) >= gradientScaled;
					if (!doneN) posN.x -= offNP.x * FXAA_QUALITY__P5;
					if (!doneN) posN.y -= offNP.y * FXAA_QUALITY__P5;
					doneNP = (!doneN) || (!doneP);
					if (!doneP) posP.x += offNP.x * FXAA_QUALITY__P5;
					if (!doneP) posP.y += offNP.y * FXAA_QUALITY__P5;

					if (doneNP) {
						if (!doneN) lumaEndN = FxaaLuma(SampleLocation(posN.xy));
						if (!doneP) lumaEndP = FxaaLuma(SampleLocation(posP.xy));
						if (!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
						if (!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
						doneN = abs(lumaEndN) >= gradientScaled;
						doneP = abs(lumaEndP) >= gradientScaled;
						if (!doneN) posN.x -= offNP.x * FXAA_QUALITY__P6;
						if (!doneN) posN.y -= offNP.y * FXAA_QUALITY__P6;
						doneNP = (!doneN) || (!doneP);
						if (!doneP) posP.x += offNP.x * FXAA_QUALITY__P6;
						if (!doneP) posP.y += offNP.y * FXAA_QUALITY__P6;

						if (doneNP) {
							if (!doneN) lumaEndN = FxaaLuma(SampleLocation(posN.xy));
							if (!doneP) lumaEndP = FxaaLuma(SampleLocation(posP.xy));
							if (!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
							if (!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
							doneN = abs(lumaEndN) >= gradientScaled;
							doneP = abs(lumaEndP) >= gradientScaled;
							if (!doneN) posN.x -= offNP.x * FXAA_QUALITY__P7;
							if (!doneN) posN.y -= offNP.y * FXAA_QUALITY__P7;
							doneNP = (!doneN) || (!doneP);
							if (!doneP) posP.x += offNP.x * FXAA_QUALITY__P7;
							if (!doneP) posP.y += offNP.y * FXAA_QUALITY__P7;

							if (doneNP) {
								if (!doneN) lumaEndN = FxaaLuma(SampleLocation(posN.xy));
								if (!doneP) lumaEndP = FxaaLuma(SampleLocation(posP.xy));
								if (!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
								if (!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
								doneN = abs(lumaEndN) >= gradientScaled;
								doneP = abs(lumaEndP) >= gradientScaled;
								if (!doneN) posN.x -= offNP.x * FXAA_QUALITY__P8;
								if (!doneN) posN.y -= offNP.y * FXAA_QUALITY__P8;
								doneNP = (!doneN) || (!doneP);
								if (!doneP) posP.x += offNP.x * FXAA_QUALITY__P8;
								if (!doneP) posP.y += offNP.y * FXAA_QUALITY__P8;
							}
						}
					}
				}
			}
		}
	}

	float dstN = posM.x - posN.x;
	float dstP = posP.x - posM.x;
	if (!horzSpan) dstN = posM.y - posN.y;
	if (!horzSpan) dstP = posP.y - posM.y;

	bool goodSpanN = (lumaEndN < 0.0) != lumaMLTZero;
	float spanLength = (dstP + dstN);
	bool goodSpanP = (lumaEndP < 0.0) != lumaMLTZero;
	float spanLengthRcp = 1.0 / spanLength;

	bool directionN = dstN < dstP;
	float dst = min(dstN, dstP);
	bool goodSpan = directionN ? goodSpanN : goodSpanP;
	float subpixG = subpixF * subpixF;
	float pixelOffset = (dst * (-spanLengthRcp)) + 0.5;
	float subpixH = subpixG * Subpix;

	float pixelOffsetGood = goodSpan ? pixelOffset : 0.0;
	float pixelOffsetSubpix = max(pixelOffsetGood, subpixH);
	if (!horzSpan) posM.x += pixelOffsetSubpix * lengthSign;
	if (horzSpan) posM.y += pixelOffsetSubpix * lengthSign;

	if (GetOption(C_FXAA_SHOW_EDGES) == 1)
	{
		return -rgbyM;
	}
	else
	{
		return float4(SampleLocation(posM).xyz, lumaM);
	}
}

float4 FxaaPass(float4 color)
{
	return FxaaPixelShader(color, GetInvResolution(), GetOption(A_FXAA_SUBPIX_MAX), GetOption(B_FXAA_EDGE_THRESHOLD), 0.000);
}

void Merger_SSAO()
{
	float4 value = float4(1.0, 1.0, 1.0, 1.0);
	if (!OptionEnabled(A_SSAO_ONLY))
	{
		value = Sample();
	}
#if A_SSAO_ENABLED != 0
	float3 AOCOmponent = float3(1.0, 1.0, 1.0);
	float4 blur = BilateralY(SampleDepth());
	AOCOmponent = (1.0 + blur.rgb) * blur.a;
	float depth = SampleDepth();
	float AOA = (GetOption(D_AOAEND) - depth) / (GetOption(D_AOAEND) - GetOption(C_AOASTART));
	value.xyz =lerp(value.xyz, value.xyz * AOCOmponent, AOA);
#endif
	SetOutput(value);
}

void Merger_SSGI()
{
	float4 value = float4(1.0, 1.0, 1.0, 1.0);
	if (!OptionEnabled(A_SSAO_ONLY))
	{
		value = Sample();
#if A_SSGI_ENABLED != 0
		float3 AOCOmponent = float3(1.0, 1.0, 1.0);
		float2 axis = float2(1.0, 0.0);
		float4 gi = PS_AO_Blur(axis);

		AOCOmponent = (gi.w + gi.xyz);
		if (OptionEnabled(A_AO_ONLY))
		{
			AOCOmponent = gi.www;
			value = float4(1.0, 1.0, 1.0, 1.0);
		}
		else if (OptionEnabled(A_ILUMINATION_ONLY))
		{
			AOCOmponent = gi.xyz;
			value = float4(1.0, 1.0, 1.0, 1.0);
		}
		float depth = SampleDepth();
		float AOA = (GetOption(F_AOAEND_SSGI) - depth) / (GetOption(F_AOAEND_SSGI) - GetOption(E_AOASTART_SSGI));
		value.xyz =lerp(value.xyz, value.xyz * AOCOmponent, AOA);
#endif
	}
	else
	{
		value = SamplePrev();
	}
	SetOutput(value);
}

//------------------------------------------------------------------------------
// BLOOM
//------------------------------------------------------------------------------

float4 Gauss1dPrev(float2 location, float2 baseoffset, float resolutionmultiplier)
{
	const float offset[] = { 0, 1.4, 4459.0 / 1365.0, 539.0 / 105.0 };
	const float weight[] = { 0.20947265625, 0.30548095703125, 0.08331298828125, 0.00640869140625 };
	float4 Color = SamplePrevLocation(location) * weight[0];
	baseoffset *= GetInvResolution() * resolutionmultiplier;
	for (int i = 1; i < 4; i++)
	{
		float4 color0 = SamplePrevLocation(location + offset[i] * baseoffset);
		float4 color1 = SamplePrevLocation(location - offset[i] * baseoffset);
		Color += (color0 + color1) * weight[i];
	}
	return Color;
}

void A_ReduceSize()
{
    float3 power = float3(1, 1, 1) * GetOption(B_BLOOMPOWER);
    float4 rawcolor = SamplePrev();
    float4 reducendcolor = float4(pow(rawcolor.rgb, power), 1.0);
    if(OptionEnabled(C_GAUSSIAN_ANAMFLARE))
    {
        reducendcolor.w = max(0,dot(rawcolor.xyz,float3(0.333,0.333,0.333))-GetOption(A_ANAMFLARE_THRESHOLD));
    }
    SetOutput(reducendcolor);
}

void BloomH()
{
	float2 texcoord = GetCoordinates();
	SetOutput(Gauss1dPrev(texcoord, float2(1.0, 0.0), GetOption(A_BLOOMWIDTH)));
}

void BloomV()
{
	float2 texcoord = GetCoordinates();
	SetOutput(Gauss1dPrev(texcoord, float2(0.0, 1.0), GetOption(A_BLOOMWIDTH)));
}

void BloomScatering()
{
	float2 SamplePos[20] = {
		float2(0.25, 0.125),
		float2(0.375, 0.125),
		float2(0.5, 0.125),
		float2(0.625, 0.125),
		float2(0.75, 0.125),

		float2(0.25, 0.25),
		float2(0.375, 0.25),
		float2(0.5, 0.25),
		float2(0.625, 0.25),
		float2(0.75, 0.25),

		float2(0.25, 0.75),
		float2(0.375, 0.75),
		float2(0.5, 0.75),
		float2(0.625, 0.75),
		float2(0.75, 0.75),

		float2(0.25, 0.875),
		float2(0.375, 0.875),
		float2(0.5, 0.875),
		float2(0.625, 0.875),
		float2(0.75, 0.875),
	};
	float3 lumColor = GetOption(H_SCOLOR) * 3.0;
	float samplecount = 3.0;
	for (int i = 0; i < 20; i++)
	{
		float3 color = SamplePrevLocation(SamplePos[i]).rgb;
		lumColor += color;
		samplecount += 1.0;
	}
	lumColor /= samplecount;
	float luma = dot(lumColor, lumCoeff);
	float maxval = max(max(lumColor.r, lumColor.g), lumColor.b);
	lumColor /= maxval;
	SetOutput(float4(lumColor, luma * luma));
}

void BloomMerger()
{
	float4 lumColor = SampleInputLocation(2, float2(0.5, 0.5));
	float3 blur = SampleInputBicubic(1).rgb * GetOption(C_BLOOMINTENSITY);
	blur.rgb = blur.rgb * (1.0 - saturate(lumColor.a * 2.0));
	float3 basecolor = float3(0.0,0.0,0.0);
	if (!OptionEnabled(A_BLOOMONLY))
	{
		basecolor = SampleInput(0).rgb;
	}

	if (OptionEnabled(D_SCATTERRING))
	{
		float depth = SampleDepth();
		float linearcomponent = (GetOption(G_SEND) - depth) / (GetOption(G_SEND) - GetOption(F_SSTART));
		depth = depth * GetOption(E_SDENSITY);
		lumColor.rgb = lerp(basecolor, lumColor.rgb, saturate(GetOption(I_SINTENSITY) + lumColor.a));
		basecolor = lerp(lumColor.rgb, basecolor, clamp(linearcomponent / exp(depth * depth), 0.0, 1.0));
	}
	float4 color;
	color.rgb = basecolor + blur.rgb;

	if (OptionEnabled(C_GAUSSIAN_ANAMFLARE))
	{
		float3 anamflare = SampleInputBicubic(1).w*2*GetOption(C_ANAMFLARE_COLOR);
		color.xyz += pow(anamflare.xyz,1/GetOption(B_ANAMFLARE_CURVE));
	}
	SetOutput(color);
}


/*------------------------------------------------------------------------------
[DolphinFX GLOBALS|FUNCTIONS]
------------------------------------------------------------------------------*/

#define FIX(c) max(abs(c), 1e-5)

#define Epsilon (1e-10)
#define lumCoeffDFX float3(0.2126729, 0.7151522, 0.0721750)

float ColorLuminance(float3 color)
{
	return dot(color, lumCoeffDFX);
}

//Average relative luminance
float AvgLuminanceDFX(float3 color)
{
	return sqrt(dot(color * color, lumCoeffDFX));
}

float smootherstep(float a, float b, float x)
{
	x = saturate((x - a) / (b - a));
	return x*x*x*(x*(x * 6.0 - 15.0) + 10.0);
}

/*
float4 DebugClipping(float4 color)
{
if (color.x >= 0.99999 && color.y >= 0.99999 &&
color.z >= 0.99999) color.xyz = float3(1.0f, 0.0f, 0.0f);

if (color.x <= 0.00001 && color.y <= 0.00001 &&
color.z <= 0.00001) color.xyz = float3(0.0f, 0.0f, 1.0f);

return color;
}
*/

//Conversion matrices
float3 RGBtoXYZDFX(float3 rgb)
{
	const float3x3 m = float3x3(
		0.4124564, 0.3575761, 0.1804375,
		0.2126729, 0.7151522, 0.0721750,
		0.0193339, 0.1191920, 0.9503041);

	return mul(rgb, m);
}

float3 XYZtoRGBDFX(float3 xyz)
{
	const float3x3 m = float3x3(
		3.2404542, -1.5371385, -0.4985314,
		-0.9692660, 1.8760108, 0.0415560,
		0.0556434, -0.2040259, 1.0572252);

	return mul(xyz, m);
}

float3 RGBtoYUVDFX(float3 RGB)
{
	const float3x3 m = float3x3(
		0.2126, 0.7152, 0.0722,
		-0.09991, -0.33609, 0.436,
		0.615, -0.55861, -0.05639);

	return mul(RGB, m);
}

float3 YUVtoRGBDFX(float3 YUV)
{
	const float3x3 m = float3x3(
		1.000, 0.000, 1.28033,
		1.000, -0.21482, -0.38059,
		1.000, 2.12798, 0.000);

	return mul(YUV, m);
}

//Converting XYZ to Yxy
float3 XYZtoYxyDFX(float3 xyz)
{
	float3 Yxy;
	float w = 1.0 / (xyz.r + xyz.g + xyz.b);

	Yxy.r = xyz.g;
	Yxy.g = xyz.r * w;
	Yxy.b = xyz.g * w;

	return Yxy;
}

//Converting Yxy to XYZ
float3 YxytoXYZDFX(float3 Yxy)
{
	float3 xyz;
	float w = 1.0 / Yxy.b;
	xyz.g = Yxy.r;
	xyz.r = Yxy.r * Yxy.g * w;
	xyz.b = Yxy.r * (1.0 - Yxy.g - Yxy.b) * w;
	return xyz;
}

float MidLuminance(float3 color)
{
	return sqrt(
		(color.x * color.x * 0.3333) +
		(color.y * color.y * 0.3333) +
		(color.z * color.z * 0.3333));
}


/*------------------------------------------------------------------------------
[COLOUR CORRECTION CODE SECTION]
------------------------------------------------------------------------------*/

// Converting pure hue to RGB
float3 HUEtoRGB(float H)
{
	float R = abs(H * 6.0 - 3.0) - 1.0;
	float G = 2.0 - abs(H * 6.0 - 2.0);
	float B = 2.0 - abs(H * 6.0 - 4.0);

	return saturate(float3(R, G, B));
}

// Converting RGB to hue/chroma/value
float3 RGBtoHCV(float3 RGB)
{
	float4 BG = float4(RGB.bg, -1.0, 2.0 / 3.0);
	float4 GB = float4(RGB.gb, 0.0, -1.0 / 3.0);

	float4 P = (RGB.g < RGB.b) ? BG : GB;

	float4 XY = float4(P.xyw, RGB.r);
	float4 YZ = float4(RGB.r, P.yzx);

	float4 Q = (RGB.r < P.x) ? XY : YZ;

	float C = Q.x - min(Q.w, Q.y);
	float H = abs((Q.w - Q.y) / (6.0 * C + Epsilon) + Q.z);

	return float3(H, C, Q.x);
}

// Converting RGB to HSV
float3 RGBtoHSV(float3 RGB)
{
	float3 HCV = RGBtoHCV(RGB);
	float S = HCV.y / (HCV.z + Epsilon);

	return float3(HCV.x, S, HCV.z);
}

// Converting HSV to RGB
float3 HSVtoRGB(float3 HSV)
{
	float3 RGB = HUEtoRGB(HSV.x);
	return ((RGB - 1.0) * HSV.y + 1.0) * HSV.z;
}

// Pre correction color mask
float3 PreCorrection(float3 color)
{
	float3 RGB = color;

	RGB.r = 2.0 / 3.0 * (1.0 - (RGB.r * RGB.r));
	RGB.g = 2.0 / 3.0 * (1.0 - (RGB.g * RGB.g));
	RGB.b = 2.0 / 3.0 * (1.0 - (RGB.b * RGB.b));

	RGB.r = saturate(color.r + (GetOption(B_RED_CORRECTION) / 200.0) * RGB.r);
	RGB.g = saturate(color.g + (GetOption(C_GREEN_CORRECTION) / 200.0) * RGB.g);
	RGB.b = saturate(color.b + (GetOption(D_BLUE_CORRECTION) / 200.0) * RGB.b);

	color = saturate(RGB);

	return color;
}

float3 ColorCorrection(float3 color)
{
	float X = 1.0 / (1.0 + exp(GetOption(B_RED_CORRECTION) / 2.0));
	float Y = 1.0 / (1.0 + exp(GetOption(C_GREEN_CORRECTION) / 2.0));
	float Z = 1.0 / (1.0 + exp(GetOption(D_BLUE_CORRECTION) / 2.0));

	color.r = (1.0 / (1.0 + exp(-GetOption(B_RED_CORRECTION) * (color.r - 0.5))) - X) / (1.0 - 2.0 * X);
	color.g = (1.0 / (1.0 + exp(-GetOption(C_GREEN_CORRECTION) * (color.g - 0.5))) - Y) / (1.0 - 2.0 * Y);
	color.b = (1.0 / (1.0 + exp(-GetOption(D_BLUE_CORRECTION) * (color.b - 0.5))) - Z) / (1.0 - 2.0 * Z);

	return saturate(color);
}

float4 CorrectionPass(float4 color)
{
	float3 colorspace = PreCorrection(color.rgb);

	if (GetOption(A_PALETTE) == 0) {
		colorspace = ColorCorrection(colorspace);
	}

	else if (GetOption(A_PALETTE) == 1) {
		float3 XYZ = RGBtoXYZDFX(colorspace);
		float3 Yxy = XYZtoYxyDFX(XYZ);

		Yxy = ColorCorrection(Yxy);
		XYZ = YxytoXYZDFX(Yxy);
		colorspace = XYZtoRGBDFX(XYZ);
	}

	else if (GetOption(A_PALETTE) == 2) {
		float3 XYZ = RGBtoXYZDFX(colorspace);
		float3 Yxy = XYZtoYxyDFX(XYZ);

		XYZ = YxytoXYZDFX(Yxy);
		XYZ = ColorCorrection(XYZ);
		colorspace = XYZtoRGBDFX(XYZ);
	}

	else if (GetOption(A_PALETTE) == 3) {
		float3 hsv = RGBtoHSV(colorspace);
		hsv = ColorCorrection(hsv);
		colorspace = HSVtoRGB(hsv);
	}

	else if (GetOption(A_PALETTE) == 4) {
		float3 yuv = RGBtoYUVDFX(colorspace);
		yuv = ColorCorrection(yuv);
		colorspace = YUVtoRGBDFX(yuv);
	}

	color.rgb = lerp(color.rgb, colorspace, GetOption(E_CORRECT_STR));
	color.a = AvgLuminanceDFX(color.rgb);

	return color;
}

/*------------------------------------------------------------------------------
[GAMMA CORRECTION CODE SECTION]
------------------------------------------------------------------------------*/

/*float3 EncodeGamma(float3 color, float gamma)
{
	color = saturate(color);
	color.r = (color.r <= 0.0404482362771082) ?
		color.r / 12.92 : pow((color.r + 0.055) / 1.055, gamma);
	color.g = (color.g <= 0.0404482362771082) ?
		color.g / 12.92 : pow((color.g + 0.055) / 1.055, gamma);
	color.b = (color.b <= 0.0404482362771082) ?
		color.b / 12.92 : pow((color.b + 0.055) / 1.055, gamma);

	return color;
}*/

float3 DecodeGamma(float3 color, float gamma)
{
	color = saturate(color);
	color.r = (color.r <= 0.00313066844250063) ?
		color.r * 12.92 : 1.055 * pow(color.r, 1.0 / gamma) - 0.055;
	color.g = (color.g <= 0.00313066844250063) ?
		color.g * 12.92 : 1.055 * pow(color.g, 1.0 / gamma) - 0.055;
	color.b = (color.b <= 0.00313066844250063) ?
		color.b * 12.92 : 1.055 * pow(color.b, 1.0 / gamma) - 0.055;

	return color;
}

float4 GammaPass(float4 color)
{
	const float GammaConst = 2.233333;
	color.rgb = EncodeGamma(color.rgb, GammaConst);
	color.rgb = DecodeGamma(color.rgb, GetOption(A_GAMMA));
	color.a = AvgLuminanceDFX(color.rgb);

	return color;
}

/*------------------------------------------------------------------------------
[VIGNETTE CODE SECTION]
------------------------------------------------------------------------------*/

float4 VignettePass(float4 color)
{
	const float2 VignetteCenter = float2(0.500, 0.500);
	float2 tc = GetCoordinates() - VignetteCenter;

	// hardcoded pre ratio calculations, for uniform output on arbitrary resolutions.
	tc *= float2((2560.0 / 1440.0), GetOption(A_VIG_RATIO));
	tc /= GetOption(B_VIG_RADIUS);

	float v = dot(tc, tc);

	color.rgb *= (1.0 + pow(v, GetOption(D_VIG_SLOPE) * 0.25) * -GetOption(C_VIG_AMOUNT));

	return color;
}

/*------------------------------------------------------------------------------
[FILM GRAIN CODE SECTION]
------------------------------------------------------------------------------*/

float Fade(float t)
{
	return t*t*t*(t*(t*6.0 - 15.0) + 10.0);
}

float2 CoordRot(float2 tc, float angle)
{
	float2 screenSize = GetResolution();
	float aspect = screenSize.x / screenSize.y;
	float rotX = ((tc.x * 2.0 - 1.0) * aspect * cos(angle)) - ((tc.y * 2.0 - 1.0) * sin(angle));
	float rotY = ((tc.y * 2.0 - 1.0) * cos(angle)) + ((tc.x * 2.0 - 1.0) * aspect * sin(angle));

	rotX = ((rotX / aspect) * 0.5 + 0.5);
	rotY = rotY * 0.5 + 0.5;

	return float2(rotX, rotY);
}

float4 Perm(float2 texcoord)
{
	float noise = RandomSeedfloat(texcoord);

	float noiseR = noise * 2.0 - 1.0;
	float noiseG = frac(noise * 1.2154) * 2.0 - 1.0;
	float noiseB = frac(noise * 1.3453) * 2.0 - 1.0;
	float noiseA = frac(noise * 1.3647) * 2.0 - 1.0;

	return float4(noiseR, noiseG, noiseB, noiseA);
}

float PerNoise(float3 p)
{
	const float permTexUnit = 1.0 / 256.0;
	const float permTexUnitHalf = 0.5 / 256.0;

	float3 pf = frac(p);
	float3 pi = permTexUnit * floor(p) + permTexUnitHalf;

	// Noise contributions from (x=0, y=0), z=0 and z=1
	float perm00 = Perm(pi.xy).a;
	float3  grad000 = Perm(float2(perm00, pi.z)).rgb * 4.0 - 1.0;
	float n000 = dot(grad000, pf);
	float3  grad001 = Perm(float2(perm00, pi.z + permTexUnit)).rgb * 4.0 - 1.0;
	float n001 = dot(grad001, pf - float3(0.0, 0.0, 1.0));

	// Noise contributions from (x=0, y=1), z=0 and z=1
	float perm01 = Perm(pi.xy + float2(0.0, permTexUnit)).a;
	float3  grad010 = Perm(float2(perm01, pi.z)).rgb * 4.0 - 1.0;
	float n010 = dot(grad010, pf - float3(0.0, 1.0, 0.0));
	float3  grad011 = Perm(float2(perm01, pi.z + permTexUnit)).rgb * 4.0 - 1.0;
	float n011 = dot(grad011, pf - float3(0.0, 1.0, 1.0));

	// Noise contributions from (x=1, y=0), z=0 and z=1
	float perm10 = Perm(pi.xy + float2(permTexUnit, 0.0)).a;
	float3  grad100 = Perm(float2(perm10, pi.z)).rgb * 4.0 - 1.0;
	float n100 = dot(grad100, pf - float3(1.0, 0.0, 0.0));
	float3  grad101 = Perm(float2(perm10, pi.z + permTexUnit)).rgb * 4.0 - 1.0;
	float n101 = dot(grad101, pf - float3(1.0, 0.0, 1.0));

	// Noise contributions from (x=1, y=1), z=0 and z=1
	float perm11 = Perm(pi.xy + float2(permTexUnit, permTexUnit)).a;
	float3  grad110 = Perm(float2(perm11, pi.z)).rgb * 4.0 - 1.0;
	float n110 = dot(grad110, pf - float3(1.0, 1.0, 0.0));
	float3  grad111 = Perm(float2(perm11, pi.z + permTexUnit)).rgb * 4.0 - 1.0;
	float n111 = dot(grad111, pf - float3(1.0, 1.0, 1.0));

	float4 n_x = lerp(float4(n000, n001, n010, n011), float4(n100, n101, n110, n111), Fade(pf.x));

	float2 n_xy = lerp(n_x.xy, n_x.zw, Fade(pf.y));
	float n_xyz = lerp(n_xy.x, n_xy.y, Fade(pf.z));

	return n_xyz;
}

float4 GrainPass(float4 color)
{
	float2 screenSize = GetResolution();
	float3 rotOffset = float3(1.425, 3.892, 5.835); //rotation offset values
	float2 rotCoordsR = CoordRot(GetCoordinates(), GetTime() + rotOffset.x);
	float noiseval = PerNoise(float3(rotCoordsR * (screenSize / GetOption(A_GRAIN_SIZE)), 0.0));
	float3 noise = float3(noiseval, noiseval, noiseval);

	if (GetOption(C_COLORED) == 1) {
		float2 rotCoordsG = CoordRot(GetCoordinates(), GetTime() + rotOffset.y);
		float2 rotCoordsB = CoordRot(GetCoordinates(), GetTime() + rotOffset.z);
		noise.g = lerp(noise.r, PerNoise(float3(rotCoordsG *
			float2(screenSize.x / GetOption(A_GRAIN_SIZE), screenSize.y / GetOption(A_GRAIN_SIZE)), 1.0)), GetOption(D_COLOR_AMOUNT));
		noise.b = lerp(noise.r, PerNoise(float3(rotCoordsB *
			float2(screenSize.x / GetOption(A_GRAIN_SIZE), screenSize.y / GetOption(A_GRAIN_SIZE)), 2.0)), GetOption(D_COLOR_AMOUNT));
	}

	//noisiness response curve based on scene luminance
	float lamount = GetOption(E_LUMA_AMOUNT);
	float luminance = ColorLuminance(color.rgb);
	luminance = lerp(0.0, luminance, lamount);
	float lum = smoothstep(0.2, 0.0, luminance);
	lum += luminance;
	lum = pow(lum, 4.0);
	noise = lerp(noise, float3(0.0, 0.0, 0.0), lum);
	color.rgb = color.rgb + noise * GetOption(B_GRAIN_AMOUNT);

	return color;
}

/*------------------------------------------------------------------------------
[DRAKONAS'S ADDITIONAL FUNCTIONS]
------------------------------------------------------------------------------*/

float4 Gauss1dPrev2(float2 coord, float2 axis, float mult)
{
    float4 sum = 0;
    float weight[11] = { 0.082607, 0.080977, 0.076276, 0.069041, 0.060049, 0.050187, 0.040306, 0.031105, 0.023066, 0.016436, 0.011254 };
    axis *= GetInvResolution() * mult;
    for (int i = -10; i < 11; i++)
    {
        float currweight = weight[abs(i)];
        sum += SamplePrevLocation(coord.xy + axis.xy * (float)i) * currweight;
    }
    return sum;
}

void BloomVwithAnamFlare()
{
	float2 texcoord = GetCoordinates();
	float4 bloom = Gauss1dPrev(texcoord, float2(0.0, 1.0), GetOption(A_BLOOMWIDTH));
	if(OptionEnabled(C_GAUSSIAN_ANAMFLARE))
	{
		bloom.a = Gauss1dPrev2(texcoord, float2(1.0, 0.0), 2*GetOption(A_ANAMFLARE_WIDENESS)).a*2.5;
		bloom.a *= GetOption(B_ANAMFLARE_AMOUNT);
	}
	SetOutput(bloom);
}

/*------------------------------------------------------------------------------
[GODRAY CODE SECTION]
------------------------------------------------------------------------------*/

void LensPrePass()
{
	float4 lens = float4(0.0,0.0,0.0,0.0);

	float2 texCoord = GetCoordinates().xy;
	float2 ScreenLightPos = float2(GetOption(D_GODRAY_LIGHTSOURCE_LOC));
	float2 deltaTexCoord = (texCoord.xy - ScreenLightPos.xy);
	deltaTexCoord *= 1.0 / float(GetOption(B_GODRAY_SAMPLES)) * GetOption(C_GODRAY_DENSITY);

	float illuminationDecay = 1.0;

	for (int g = 0; g < GetOption(B_GODRAY_SAMPLES); g++) {

		texCoord -= deltaTexCoord;
		float4 sample2 = SampleInputLocation(0, texCoord.xy);
		float sampledepth = SampleDepthLocation(texCoord.xy).x;
		sample2.a = saturate(dot(sample2.xyz, float3(0.333,0.333,0.333)) - GetOption(A_GODRAY_THRESHOLD));
		sample2.r *= 1.0;
		sample2.g *= 0.95;
		sample2.b *= 0.85;
		sample2 *= illuminationDecay * GetOption(C_GODRAY_WEIGHT);
		if(OptionEnabled(A_GODRAY_DEPTH_CHECK))
		{
			if (sampledepth>GetOption(A_GODRAY_DEPTH_CHECK_VALUE)) { lens.xyz += sample2.xyz*sample2.a; }
		}
		else
		{
			lens.xyz += sample2.rgb;
		}
		illuminationDecay *= GetOption(C_GODRAY_DECAY);
	}
	SetOutput(lens);
}

void LensV()
{
	float2 texcoord = GetCoordinates();
	float sampledepth = SampleDepthLocation(texcoord.xy).x;
	float4 lens = SamplePrevLocation(texcoord.xy);
	if(OptionEnabled(A_GODRAY_DEPTH_CHECK))
	{
		if (sampledepth>0.99999) { lens = Gauss1dPrev2(texcoord, float2(0.0, 1.0), 2); }
	}
	SetOutput(lens);
}

void LensH()
{
	float2 texcoord = GetCoordinates();
	float sampledepth = SampleDepthLocation(texcoord.xy).x;
	float4 lens = SamplePrevLocation(texcoord.xy);
	if(OptionEnabled(A_GODRAY_DEPTH_CHECK))
	{
		if (sampledepth>0.99999) { lens = Gauss1dPrev2(texcoord, float2(1.0, 0.0), 2); }
	}
	SetOutput(lens);
}

void LensMerger()
{
	float4 lens = SampleInputBicubic(1);
	lens.rgb *= float(GetOption(C_GODRAY_INTENSITY));
	float3 basecolor = float3(0.0,0.0,0.0);
	if (!OptionEnabled(A_GODRAYS_ONLY))
	{
		basecolor = SampleInput(0).rgb;
	}
	float4 color = float4(0.0,0.0,0.0,0.0);
	color.rgb = basecolor + lens.rgb;
	color.a = 1;

	SetOutput(color);
}

/*------------------------------------------------------------------------------
[DRAKONAS'S ADDITIONAL FUNCTIONS]
------------------------------------------------------------------------------*/

void PreApplyCC()
{
	if(!OptionEnabled(A_APPLY_CC_AFTER))
	{
		SetOutput(CorrectionPass(float4(SamplePrev())));
	}
	else
	{
		SetOutput(float4(SamplePrev()));
	}
}

void PostApplyCC()
{
	if(OptionEnabled(D_COLOR_CORRECTION))
	{
		SetOutput(CorrectionPass(float4(SamplePrev())));
	}
	else
	{
		SetOutput(float4(SamplePrev()));
	}
}

void PostApplyGC()
{
	SetOutput(GammaPass(float4(SamplePrev())));
}

void SceneTonemapping()
{
	SetOutput(TonemapPass(float4(SamplePrev())));
}

void PixelVibrance()
{
	SetOutput(VibrancePass(float4(SamplePrev())));
}

void Vignette()
{
	SetOutput(VignettePass(float4(SamplePrev())));
}

void FilmGrain()
{
	SetOutput(GrainPass(float4(SamplePrev())));
}

void Fxaa()
{
	SetOutput(FxaaPass(float4(SamplePrev())));
}
