/*------------------.
| :: Description :: |
'-------------------/

    Copyright (based on Layer) (version 0.7)

    Authors: CeeJay.dk, seri14, Marot Satil, uchu suzume, prod80, originalnicodr
    License: MIT

    About:
    Blends an image with the game.
    The idea is to give users with graphics skills the ability to create effects using a layer just like in an image editor.
    Maybe they could use this to create custom CRT effects, custom vignettes, logos, custom hud elements, toggable help screens and crafting tables or something I haven't thought of.

    History:
    (*) Feature (+) Improvement (x) Bugfix (-) Information (!) Compatibility
    
    Version 0.2 by seri14 & Marot Satil
    * Added the ability to scale and move the layer around on an x, y axis.

    Version 0.3 by seri14
    * Reduced the problem of layer color is blending with border color

    Version 0.4 by seri14 & Marot Satil
    * Added support for the additional seri14 DLL preprocessor options to minimize loaded textures.

    Version 0.5 by uchu suzume & Marot Satil
    * Rotation added.

    Version 0.6 by uchu suzume & Marot Satil
    * Added multiple blending modes thanks to the work of uchu suzume, prod80, and originalnicodr.

    Version 0.7 by uchu suzume & Marot Satil
    * Added Addition, Subtract, Divide blending modes.

    Version 0.8 by uchu suzume & Marot Satil
    * Sorted blending modes in a more logical fashion, grouping by type.

    Version 0.x by uchu suzume
    *Replaced textures for pso2 exclusive and added a lot.
    *Fixed blend option applying correctly to alpha pixels by changing the order of code blocks.
    *Add space of UI and collapsed some parameters for visibility.
    *Changed the order of parameter in snap rotate.
    *Experimental features added:
         *Coloring textures(invert, any color for white / black pixels).
         *Move texture to mouse position.
         *Merge and blend background pixels into logo texture(Not sure I said it correctly in English).
         *Added layer with Gaussian blur can be used for drop shadows or bloom.
         *Added chromatic aberration layer with gaussian blur.
*/

#include "ReShade.fxh"

#ifndef cLayerTex
#define cLayerTex "cLayerA.png" // Add your own image file to \reshade-shaders\Textures\ and provide the new file name in quotes to change the image displayed!
#endif
#ifndef cLayer_SIZE_X
#define cLayer_SIZE_X BUFFER_WIDTH
#endif
#ifndef cLayer_SIZE_Y
#define cLayer_SIZE_Y BUFFER_HEIGHT
#endif

#if cLayer_SINGLECHANNEL
#define TEXFORMAT R8
#else
#define TEXFORMAT RGBA8
#endif

uniform int cLayer_Select <
    ui_label = "Copyright Logo Selection";
    ui_tooltip = "The image/texture you'd like to use.　　";//Addeding spaces to inhibit unnatural line breaks of tooltip.
    ui_type = "combo";
    ui_items = 
               "NGS\0"
               "Gill Sans NGS\0"
               "NGS(Legacy)\0"
               "PSO2\0"
               "Voltaire\0"
               "Voltaire NGS\0"
               "Euro Style EX\0"
               "Century\0"
               "Schoolbell\0"
               "Helvetica Condenced\0"
               "Peignot\0"
               "Six Caps\0"
               "Bubbler One\0"
               "PSO2 with GShade Dark\0"
               "PSO2 with GShade White\0"
               "PSO2 NGS with GShade Dark\0"
               "PSO2 NGS with GShade White\0"
               "-------------------------------------------------\0"
               "Montserrat\0"
               "Montserrat Simple\0"
               "Frutiger with Flat Logo\0"
               "Eurostyle\0"
               "Eurostyle NGS\0"
               "Poiret One Rectangle\0"
               "Metro No.2 Cutout\0"
               "Sigmar One\0"
               "Kranky\0"
               "GN-Fuyu-iro Script\0"
               "Sacramento\0"
               "-------------------------------------------------\0"
               "Eurostyle Left\0"
               "Eurostyle Right\0"
               "Eurostyle Center\0"
               "Eurostyle Left NGS\0"
               "Eurostyle Right NGS\0"
               "Eurostyle Center NGS\0"
               "Frutiger XCN\0"
               "Futura Center\0"
               "Futura Center NGS\0"
               "Neuzeit Grotesk\0"
               "Neuzeit Grotesk NGS\0"
               "Mont Serrat Rectangle NGS A\0"
               "Mont Serrat Rectangle NGS B\0"
               "Helvetica NGS\0"
               "Voltaire NGS Rectangle\0"
               "Century Rectangle\0"
               "Poster Bodoni NGS\0"
               "Krona One\0"
               "Krona One NGS\0"
               "Mouse Memories\0"
               "Swanky and Moo Moo\0"
               "Architects Daughter NGS\0"
               "Staccato555 A\0"
               "Staccato555 B\0"
               "Tango NGS\0"
               "Lato Cutout\0"
               "Lato Cutout NGS\0"
               "-------------------------------------------------\0"
               "Six Caps Rectangle\0"
               "Rockwell Nova\0"
               "Kabel Heavy\0"
               "Poiret One\0"
               "Poiret One Huge\0"
               "Supermercado\0"
               "Bauer Bodni\0"
               "Baumans\0"
               "Bilbo Swash Caps\0"
               "Kranky Large\0"
               "Monoton NGS\0"
               "Meddon NGS\0"
               "-------------------------------------------------\0"
               "Futura Tri\0"
               "Futura Tri NGS\0"
               "Futura Tri NGS HV\0"
               "Helvetica Square\0"
               "Peignot NGS 2\0"
               "Futura NGS\0"
               "Peignot NGS\0"
               "Rockwell Nova NGS\0"
               "Righteous\0"
               "Bubbler One Rectangle\0"
               "Poppins\0"
               "Bank Gothic\0"
               "PSO2 Flat Logo\0"
               "CollageAL NGS\0"
               "Lucida Console\0"
               "Wire One\0"
               "Wire One NGS\0"
               "Maximus NGS\0"
               "Tango NGS 2\0"
               "Rock Salt Rectangle\0"
               "Bernhard Fashion\0"
               "Uzu Kaku\0"
               "Peignot Square\0"
               "Yanone Kaffeesatz Square\0"
               "Yanone Kaffeesatz Square 2\0"
               "Frutiger Square NGS\0"
               "Frutiger Square NGS 2\0"
               "Gill Sans Ultra Bold Square NGS\0"
               "Gill Sans Ultra Bold Square NGS 2\0"
               "Megrim Square NGS\0"
               "-------------------------------------------------\0"
               "Vapor Pixel\0"
               "Mechanical Sans Serif\0"
               "Mechanical Sans Serif 2\0"
               "Toy Writer Marker NGS\0"
               "Toy Writer Marker NGS 2\0"
               "Toy Writer Marker NGS 3\0"
               "Flamingo Serif\0"
               "Flamingo Serif 2\0"
               "Ligaturerian\0"
               "Ligaturerian 2\0"
               "Ligaturerian 3\0"
               ;
    ui_bind = "CopyrightTexturePSO2_Source";
> = 0;

// Set default value(see above) by source code if the preset has not modified yet this variable/definition
#ifndef cLayerPSO2Texture_Source
#define cLayerPSO2Texture_Source 0
#endif

uniform float cLayer_Scale <
    ui_label = "Scale";
    ui_tooltip = "If you need to increase more scale value,    \nyou can use Scale X&Y combined below.   \nExcessive scaling might degrade the texture   \nhowever.";
    ui_type = "slider";
    ui_min = 0.500; ui_max = 1.0;
    ui_step = 0.001;
> = 0.780;

 uniform float cLayer_ScaleX <
    ui_label = "Scale X";    
    ui_category = "ScaleXY";
    ui_category_closed = true;
    ui_type = "slider";
    ui_min = 0.001; ui_max = 5.0;
    ui_step = 0.001;
> = 1.0;

 uniform float cLayer_ScaleY <
    ui_label = "Scale Y";
    ui_category = "ScaleXY";
    ui_type = "slider";
    ui_min = 0.001; ui_max = 5.0;
    ui_step = 0.001;
> = 1.0;


uniform bool  cLayer_Mouse <
    ui_label = "Mouse Following Mode";
    ui_tooltip = "Press right click to logo texture follow the mouse cursor. Right click again to back to Position X and Y coord.";
    ui_spacing = 2;
> = false;

uniform float cLayer_PosX <
    ui_label = "Position X";
    ui_tooltip = "X & Y coordinates of the textures.\nAxes start upper left screen corner.   ";
    ui_type = "slider";
    ui_min = 0.0; ui_max = 1.0;
    ui_step = 0.001;
> = 0.680;

uniform float cLayer_PosY <
    ui_label = "Position Y";
    ui_tooltip = "X & Y coordinates of the textures.\nAxes start upper left screen corner.   ";
    ui_type = "slider";
    ui_min = 0.0; ui_max = 1.0;
    ui_step = 0.001;
> = 0.970;


uniform int cLayer_SnapRotate <
    ui_label = "Snap Rotation";
    ui_tooltip = "Snap rotation to a specific angle.\nPress arrow button to rotate 90° each direction.   ";
    ui_type = "combo";
    ui_spacing = 2;
    ui_items = 
               "-90 Degrees\0"
               "0 Degrees\0"
               "90 Degrees\0"
               "180 Degrees\0"
               ;
> = 1;

uniform float cLayer_Rotate <
    ui_label = "Rotate";
    ui_tooltip = "Rotate the texture to desired angle.   ";
    ui_type = "slider";
    ui_min = -180.0;
    ui_max = 180.0;
    ui_step = 0.01;
> = 0;


uniform int cLayer_Color_Override <
    ui_label = "Recolor";
    ui_tooltip = "Can be invert the color (and) colorize   \nto any color to black/white areas.";
    ui_type = "combo";
    ui_spacing = 2;
    ui_items = "None\0"
               "Invert Color\0"
               "Recolor White Part\0"
               "Recolor Black Part\0"
               "Invert --> Recolor White Part\0"
               "Invert --> Recolor Black Part\0"
               ;
> = false;

uniform float3 ColorOverride <
    ui_label = "Color";
    ui_tooltip = "Color applied to recolor.   ";
    ui_type = "color";
> = float3(0.0, 1.0, 1.0);


uniform int cLayer_BlendMode <
    ui_label = "Blending Mode";
    ui_tooltip = "Select the blending mode applied to the texture.   ";
    ui_type = "combo";
    ui_spacing = 2;
    ui_items =
               "Normal\0"
 // Darken
               "Darken\0"
               "  Multiply\0"
               "  Color Burn\0"
               "  Linear Burn\0"
// Lighten
               "Lighten\0"
               "  Screen\0"
               "  Color Dodge\0"
               "  Linear Dodge\0"
               "  Addition\0"
               "  Glow\0"
// Contrast
               "Overlay\0"
               "  Soft Light\0"
               "  Hard Light\0"
               "  Vivid Light\0"
               "  Linear Light\0"
               "  Pin Light\0"
               "  Hard Mix\0"
 // Inversion
               "Difference\0"
               "  Exclusion\0"
// Cancelation
               "Subtract\0"
               "  Divide\0"
               "  Reflect\0"
               "  Grain Extract\0"
               "  Grain Merge\0"
// Component
               "Hue\0"
               "  Saturation\0"
               "  Color\0"
               "  Luminosity\0"
               ;
> = 0;

uniform float cLayer_Blend <
    ui_label = "Blending Amount";
    ui_tooltip = "The amount of blending applied to the texture.   ";
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 1.0;
    ui_step = 0.001;
> = 1.0;


uniform float Gauss_Blend <
    ui_label = "Blending Amount Gaussian Layer";
    ui_tooltip = "The amount of blending applied to the   \nGaussian Layer.";
    ui_category = "Gaussian Layer";
    ui_category_closed = true;
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 1.0;
    ui_step = 0.001;
> = 0.0;

uniform int GaussianBlurRadius <
    ui_label = "Gaussian Blur Radius";
    ui_tooltip = "[0|1|2] Adjusts the blur radius.\nHigher the values make thin and wide blur. \nLower values will more precise blur.\nAssumed to use for better results accord to   \ndifferent sizes of logos.";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_spacing = 2;
    ui_min = 0;
    ui_max = 2;
    ui_step = 1;
> = 1;

uniform float cLayer_PosX_Gauss <
    ui_label = "Gaussian Layer Offset X";
    ui_tooltip = "Offset of the Gaussian layer based on texture's    \ncoordinates.";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_min = -0.3; ui_max = 0.3;
    ui_step = 0.001;
> = -0.030;

uniform float cLayer_PosY_Gauss <
    ui_label = "Gaussian Layer Offset Y";
    ui_tooltip = "Offset of the Gaussian layer based on texture's    \ncoordinates.";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_min = -0.3; ui_max = 0.3;
    ui_step = 0.001;
> = -0.040;

uniform float GaussWeight <
    ui_label = "Gaussian Weight";
    ui_tooltip = "Weight based on Gaussian Radius.   \nIncreasing value makes more blur.   ";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_spacing = 2;
    ui_min = 0.001;
    ui_max = 10.0;
    ui_step = 0.001;
> = 0.600;

uniform float GaussWeightH <
    ui_label = "Gaussian Weight X";
    ui_tooltip = "Weight based on Gaussian Radius.   \nIncreasing value makes more blur.   ";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_min = 0.001;
    ui_max = 10.0;
    ui_step = 0.001;
> = 0.001;

uniform float GaussWeightV <
    ui_label = "Gaussian Weight Y";
    ui_tooltip = "Weight based on Gaussian Radius.   \nIncreasing value makes more blur.   ";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_min = 0.001;
    ui_max = 10.0;
    ui_step = 0.001;
> = 0.001;

uniform float3 GaussColor <
    ui_label = "Gaussian Layer Color";
    ui_tooltip = "Color applied to the Gaussian Layer.   ";
    ui_category = "Gaussian Layer";
    ui_type = "color";
    ui_spacing = 2;
    ui_tooltip = "Color of the shadow layer";
> = float3(0.0, 0.0, 0.0);

uniform int cLayer_BlendMode_Gauss <
    ui_label = "Gaussian Layer Blending Mode";
    ui_tooltip = "Select the blending mode applied to the Gaussian Layer.   ";
    ui_category = "Gaussian Layer";
    ui_type = "combo";
    ui_items =
               "Normal\0"
 // Darken
               "Darken\0"
               "  Multiply\0"
               "  Color Burn\0"
               "  Linear Burn\0"
// Lighten
               "Lighten\0"
               "  Screen\0"
               "  Color Dodge\0"
               "  Linear Dodge\0"
               "  Addition\0"
               "  Glow\0"
// Contrast
               "Overlay\0"
               "  Soft Light\0"
               "  Hard Light\0"
               "  Vivid Light\0"
               "  Linear Light\0"
               "  Pin Light\0"
               "  Hard Mix\0"
 // Inversion
               "Difference\0"
               "  Exclusion\0"
// Cancelation
               "Subtract\0"
               "  Divide\0"
               "  Reflect\0"
               "  Grain Extract\0"
               "  Grain Merge\0"
// Component
               "Hue\0"
               "  Saturation\0"
               "  Color\0"
               "  Luminosity\0"
               ;
> = 0;


uniform int cLayer_BlendMode_BG <
    ui_label = "BG Blending Mode";
    ui_tooltip = "Select the blending mode applied to the bg-texture.   \n- note -\nWhen using this mode, it requires reducing   \nblending amout of logo texture.   \nThe priority of this mode is to be set to later.   ";
    ui_category = "BG Blending Mode";
    ui_category_closed = true;
    ui_type = "combo";
    ui_items =
               "Normal\0"
 // Darken
               "Darken\0"
               "  Multiply\0"
               "  Color Burn\0"
               "  Linear Burn\0"
// Lighten
               "Lighten\0"
               "  Screen\0"
               "  Color Dodge\0"
               "  Linear Dodge\0"
               "  Addition\0"
               "  Glow\0"
// Contrast
               "Overlay\0"
               "  Soft Light\0"
               "  Hard Light\0"
               "  Vivid Light\0"
               "  Linear Light\0"
               "  Pin Light\0"
               "  Hard Mix\0"
 // Inversion
               "Difference\0"
               "  Exclusion\0"
// Cancelation
               "Subtract\0"
               "  Divide\0"
               "  Reflect\0"
               "  Grain Extract\0"
               "  Grain Merge\0"
// Component
               "Hue\0"
               "  Saturation\0"
               "  Color\0"
               "  Luminosity\0"
               ;
> = 0;

uniform float cLayer_Blend_BG <
    ui_label = "BG Blending Amount";
    ui_tooltip = "The amount of blending applied to the bg-texture.   ";
    ui_category = "BG Blending Mode";
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 1.0;
    ui_step = 0.001;
> = 0.0;


uniform float4 cLayer_CAb_Color_A <
    ui_label = "CAb Color A";
    ui_tooltip = "A Color appling to Chromatic Aberration layer.   ";
    ui_category = "Chromatic Aberration";
    ui_category_closed = true;
    ui_type = "color";
> = float4(1.0, 0.0, 0.0, 1.0);

uniform float4 cLayer_CAb_Color_B <
    ui_label = "CAb Color B";
    ui_tooltip = "A Color appling to Chromatic Aberration layer.   ";
    ui_category = "Chromatic Aberration";
    ui_category_closed = true;
    ui_type = "color";
> = float4(0.0, 0.0, 1.0, 1.0);

uniform float2 cLayer_CAb_Shift <
    ui_label = "CAb Shift";
    ui_tooltip = "Degree of Chromatic Aberration.   ";
    ui_category = "Chromatic Aberration";
    ui_type = "slider";
    ui_min = -0.3;
    ui_max = 0.3;
> = float2(0.02, -0.02);

uniform float cLayer_CAb_Strength <
    ui_label = "CAb Strength";
    ui_tooltip = "Blending Amount of Chromatic Aberration layer.   ";
    ui_category = "Chromatic Aberration";
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

uniform float cLayer_CAb_Blur <
    ui_label = "CAb Blur";
    ui_tooltip = "A Simplistic blur for Chromatic Aberration Layer .   ";
    ui_category = "Chromatic Aberration";
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 5.0;
> = 0.250;

uniform int cLayer_BlendMode_CAb <
    ui_label = "CAb Blending Mode";
    ui_tooltip = "Select the blending mode applied to the CAb layer.\nDifferent look according to the brightness of background.   ";
    ui_category = "Chromatic Aberration";
    ui_type = "combo";
    ui_items = "Screen\0"
               "Color\0"
               "Grain Merge\0"
               "Normal\0"
               ;
> = 0;


uniform float cLayer_Depth <
    ui_label = "Depth Position";
    ui_type = "slider";
    ui_tooltip = "Place the texture behind characters,   \nterrains, etc.";
    ui_spacing = 2;
    ui_min = 0.0;
    ui_max = 1.0;
    ui_step = 0.001;
> = 1.0;

uniform float2 MouseCoords < source = "mousepoint"; >;
uniform bool LeftMouseDown < source = "mousebutton"; keycode = 0; toggle = true; >;
uniform bool RightMouseDown < source = "mousebutton"; keycode = 1; toggle = true; >;


// (?<=Source == )[\d]{0,999} Regular expression for renumbering. Make sure this line doesn't hit.

#if CopyrightTexturePSO2_Source == 0 // NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 260.0

#elif CopyrightTexturePSO2_Source == 1 // Gill Sans NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_gill_sans_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 70.0

#elif CopyrightTexturePSO2_Source == 2 // NGS(Legacy)
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_ngs_legacy.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 60.0

#elif CopyrightTexturePSO2_Source == 3 // PSO2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_1550.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 60.0

#elif CopyrightTexturePSO2_Source == 4 // Voltaire
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_voltaire.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 60.0

#elif CopyrightTexturePSO2_Source == 5 // Voltaire NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_voltaire_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 60.0

#elif CopyrightTexturePSO2_Source == 6 // Euro Style EX
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_eurostyle_ex.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 60.0

#elif CopyrightTexturePSO2_Source == 7 // Century
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_century_1550.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 60.0

#elif CopyrightTexturePSO2_Source == 8 // Schoolbell
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_schoolbell_1550.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 60.0

#elif CopyrightTexturePSO2_Source == 9 // Helvetica Condenced
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_helvetica_condenced(Swiss911)_1550.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 60.0

#elif CopyrightTexturePSO2_Source == 10 // Peignot
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_peignot.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 120.0

#elif CopyrightTexturePSO2_Source == 11 // Six Caps
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_six_caps.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 160.0

#elif CopyrightTexturePSO2_Source == 12 // Bubbler One
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_bubbler_one.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 60.0

#elif CopyrightTexturePSO2_Source == 13 // PSO2 with GShade Dark
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_by_gshade_dark_1550.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 120.0

#elif CopyrightTexturePSO2_Source == 14 // PSO2 NGS with GShade White
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_by_gshade_white_1550.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 120.0

#elif CopyrightTexturePSO2_Source == 15 // PSO2 BGS with GShade Dark
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_by_gshade_ngs_dark.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 130.0

#elif CopyrightTexturePSO2_Source == 16 // PSO2 with GShade White
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_by_gshade_ngs_white.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 130.0

#elif CopyrightTexturePSO2_Source == 17 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_PSO2_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 60.0f

#elif CopyrightTexturePSO2_Source == 18 // Montserrat
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Montserrat_1550.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 120.0

#elif CopyrightTexturePSO2_Source == 19 //　Montserrat Simple
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Montserrat_simple_1550.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 120.0

#elif CopyrightTexturePSO2_Source == 20 // Frutiger with Flat Logo
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_frutiger_with_flat_logo.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 120.0

#elif CopyrightTexturePSO2_Source == 21 // Eurostyle
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_eurostyle(square721).png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550,200.0

#elif CopyrightTexturePSO2_Source == 22 // Eurostyle NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Eurostyle(Square721)_center_ngs_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1100,220.0

#elif CopyrightTexturePSO2_Source == 23 // Poiret One Rectangle
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_poiret_one_rectangle.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550, 250.0

#elif CopyrightTexturePSO2_Source == 24 // Metro No.2 Cutout
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_metro_no.2_cutout.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800, 100.0

#elif CopyrightTexturePSO2_Source == 25 // Sigmar One
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_sigmar_one.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 50.0

#elif CopyrightTexturePSO2_Source == 26 // Kranky
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_kranky.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1280.0, 120.0

#elif CopyrightTexturePSO2_Source == 27 // GN Fuyu-iro Script
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_gn-fuyu-iro_script.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 820.0, 160.0

#elif CopyrightTexturePSO2_Source == 28 // Sacramento 
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_sacramento.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 150.0

#elif CopyrightTexturePSO2_Source == 29 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_PSO2_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 60.0

#elif CopyrightTexturePSO2_Source == 30 // Eurostyle Left
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Eurostyle(Square721)_left.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 183.0

#elif CopyrightTexturePSO2_Source == 31 // Eurostyle Right
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Eurostyle(Square721)_right.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 183.0

#elif CopyrightTexturePSO2_Source == 32 // Eurostyle Center
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Eurostyle(Square721)_center.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 183.0

#elif CopyrightTexturePSO2_Source == 33 // Eurostyle Left  NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Eurostyle(Square721)_left_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1100.0, 220.0

#elif CopyrightTexturePSO2_Source == 34 // Eurostyle Right  NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Eurostyle(Square721)_right_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1100.0, 220.0

#elif CopyrightTexturePSO2_Source == 35 // Eurostyle Center  NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Eurostyle(Square721)_center_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1100.0, 220.0

#elif CopyrightTexturePSO2_Source == 36 // Futura Center
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_futura_center_large.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 190.0

#elif CopyrightTexturePSO2_Source == 37 // Futura Center NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_futura_center_large_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 190.0

#elif CopyrightTexturePSO2_Source == 38 // Frutiger XCN
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_frutiger_xcn_rectangle_a.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600, 250.0

#elif CopyrightTexturePSO2_Source == 39 // Neuzeit Grotesk
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_neuzeit_grotesk.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 780.0, 350.0

#elif CopyrightTexturePSO2_Source == 40 // Neuzeit Grotesk NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_neuzeit_grotesk_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 250.0

#elif CopyrightTexturePSO2_Source == 41 // Montserrat Rectangle NGS A
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_montserrat_rectangle_ngs_a.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 180.0

#elif CopyrightTexturePSO2_Source == 42 // Montserrat Rectangle NGS B
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_montserrat_rectangle_ngs_b.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 240.0

#elif CopyrightTexturePSO2_Source == 43 // Helvetica NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_helvetica_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 850.0, 340.0

#elif CopyrightTexturePSO2_Source == 44 // Voltaire NGS Rectangle
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_voltaire_ngs_rectangle.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1000.0, 300.0

#elif CopyrightTexturePSO2_Source == 45 // Century Rectangle
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_century_rectangle.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 580.0, 150.0

#elif CopyrightTexturePSO2_Source == 46 // Poster Bodoni NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_poster_bodoni_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 900.0, 160.0

#elif CopyrightTexturePSO2_Source == 47 // Krona One
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_krona_one.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 900.0, 300.0

#elif CopyrightTexturePSO2_Source == 48 // Krona One NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_krona_one_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 900.0, 340.0

#elif CopyrightTexturePSO2_Source == 49 // Mouse Memories
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_mouse_memories.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 660.0, 240.0

#elif CopyrightTexturePSO2_Source == 50 // Swanky and Moo Moo
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_swanky_and_moo_moo.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 150.0

#elif CopyrightTexturePSO2_Source == 51 // Architects Daughter NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_architects_daughter_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 850.0, 250.0

#elif CopyrightTexturePSO2_Source == 52 // Staccato555 A
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_staccato555_a.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 820.0, 350.0

#elif CopyrightTexturePSO2_Source == 53 // Staccato555 B
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_staccato555_b.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 870.0, 320.0

#elif CopyrightTexturePSO2_Source == 54 // Tango NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_tango_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 500.0, 200.0

#elif CopyrightTexturePSO2_Source == 55 // Lato Cutout
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_lato_cutout.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 180.0

#elif CopyrightTexturePSO2_Source == 56 // Lato Cutout NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_lato_cutout_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 620.0, 200.0

#elif CopyrightTexturePSO2_Source == 57 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_PSO2_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 60.0

#elif CopyrightTexturePSO2_Source == 58 // Six Caps Rectangle
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_six_caps_rectangle.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 400.0, 260.0

#elif CopyrightTexturePSO2_Source == 59 // Rockwell Nova
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Rockwell_nova_large.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 400.0, 130.0

#elif CopyrightTexturePSO2_Source == 60 // Kabel Heavy
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_kabel(Geometric231)_heavy.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 240.0

#elif CopyrightTexturePSO2_Source == 61 // Poiret One
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Poiret_one.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 210.0

#elif CopyrightTexturePSO2_Source == 62 // Poiret One Huge
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Poiret_one_huge.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1440.0, 500.0

#elif CopyrightTexturePSO2_Source == 63 // Supermercado
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_supermercado.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 430.0, 200.0

#elif CopyrightTexturePSO2_Source == 64 // Bauer Bodni
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_bauer_bodoni.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 650.0, 250.0

#elif CopyrightTexturePSO2_Source == 65 // Baumans
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_baumans.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 480.0

#elif CopyrightTexturePSO2_Source == 66 // Bilbo Swash Caps
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_bilbo_swash_caps.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 200.0

#elif CopyrightTexturePSO2_Source == 67 // Kranky Large
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Kranky_large.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 830.0, 340.0

#elif CopyrightTexturePSO2_Source == 68 // Monoton NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_monoton_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 370.0

#elif CopyrightTexturePSO2_Source == 69 // Meddon NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_meddon_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 200.0

#elif CopyrightTexturePSO2_Source == 70 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_PSO2_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 60.0

#elif CopyrightTexturePSO2_Source == 71 // Futura Tri
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_futura_tri.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 329.0, 432.0

#elif CopyrightTexturePSO2_Source == 72 // Futura Tri NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_futura_tri_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 330.0, 430.0

#elif CopyrightTexturePSO2_Source == 73 // Futura Tri NGS HV
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_futura_tri_ngs_hv.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 330.0, 460.0

#elif CopyrightTexturePSO2_Source == 74 // Helvetica Square
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_Helvetica(Swis721)_square.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 360.0, 400.0

#elif CopyrightTexturePSO2_Source == 75 // Peignot NGS 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_peignot_ngs_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 500.0, 700.0

#elif CopyrightTexturePSO2_Source == 76 // Futura NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_futura_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 480.0

#elif CopyrightTexturePSO2_Source == 77 // Peignot NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_peignot_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 700.0, 500.0

#elif CopyrightTexturePSO2_Source == 78 // Rockwell Nova NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_rockwell_nova_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 750.0, 550.0

#elif CopyrightTexturePSO2_Source == 79 // Righteous
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_righteous.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 550.0, 300.0

#elif CopyrightTexturePSO2_Source == 80 // Bubbler One Rectangle
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_bubbler_one_rectangle.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 450

#elif CopyrightTexturePSO2_Source == 81 // Poppins
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_poppins.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 200.0

#elif CopyrightTexturePSO2_Source == 82 // Bank Gothic
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_bankgothic.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 650.0, 300.0

#elif CopyrightTexturePSO2_Source == 83 // PSO2 Flat Logo
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_flat_logo.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 700.0, 400.0

#elif CopyrightTexturePSO2_Source == 84 // CollageAL NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_collage_al_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 360.0, 250.0

#elif CopyrightTexturePSO2_Source == 85 // Lucida Console
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_lucida_console.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1100.0, 350.0

#elif CopyrightTexturePSO2_Source == 86 // Wire One
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_wire_one.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1000.0, 500.0

#elif CopyrightTexturePSO2_Source == 87 // Wire One NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_wire_one_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1000.0, 500.0

#elif CopyrightTexturePSO2_Source == 88 // Maximus NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_maximus_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1100.0, 500.0

#elif CopyrightTexturePSO2_Source == 89 // Tango NGS 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_tango_ngs_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 850.0, 340.0

#elif CopyrightTexturePSO2_Source == 90 // Rock Salt Rectangle
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_rock_salt_rectangle.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 700.0, 300.0

#elif CopyrightTexturePSO2_Source == 91 // Bernhard Fashion
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_bernhard_fashion.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 500.0, 400.0

#elif CopyrightTexturePSO2_Source == 92 // Uzu Kaku NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_uzu_kaku_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 500.0, 400.0

#elif CopyrightTexturePSO2_Source == 93 // Peignot Square
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_peignot_square.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 750.0, 750.0

#elif CopyrightTexturePSO2_Source == 94 // Yanone Kaffeesatz Square
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_yanone_kaffeesatz_square.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 300.0, 300.0

#elif CopyrightTexturePSO2_Source == 95 // Yanone Kaffeesatz Square 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_yanone_kaffeesatz_square_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 300.0, 300.0

#elif CopyrightTexturePSO2_Source == 96 // Frutiger Square NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_frutiger_square_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 300.0, 300.0

#elif CopyrightTexturePSO2_Source == 97 // Frutiger Square NGS 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_frutiger_square_ngs_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 300.0, 300.0

#elif CopyrightTexturePSO2_Source == 98 // Gill Sans Ultra Bold Square NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_gill_sans_ultra_bold_square_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 300.0, 300.0

#elif CopyrightTexturePSO2_Source == 99 // Gill Sans Ultra Bold Square NGS 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_gill_sans_ultra_bold_square_ngs_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 300.0, 300.0

#elif CopyrightTexturePSO2_Source == 100 // Megrim Square NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_megrim_square_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 300.0, 300.0

#elif CopyrightTexturePSO2_Source == 101 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_PSO2_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1550.0, 60.0

#elif CopyrightTexturePSO2_Source == 102 // Vapor Pixel
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_vapor_pixel_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 850.0, 400.0

#elif CopyrightTexturePSO2_Source == 103 // Mechanical Sans Serif
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_mechanicalsansserif.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 800.0, 150.0

#elif CopyrightTexturePSO2_Source == 104 // Mechanical Sans Serif 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_mechanicalsansserif_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 950.0, 300.0

#elif CopyrightTexturePSO2_Source == 105 // Toy Writer Marker NGS
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_toywritermarker_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 850.0, 560.0

#elif CopyrightTexturePSO2_Source == 106 // Toy Writer Marker NGS 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_toywritermarker_ngs_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 850.0, 350.0

#elif CopyrightTexturePSO2_Source == 107 // Toy Writer Marker NGS 3
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_toywritermarker_ngs_3.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 1000.0, 750.0

#elif CopyrightTexturePSO2_Source == 108 // Flamingo Serif
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_flamingoserif_ngs.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 700.0, 300.0

#elif CopyrightTexturePSO2_Source == 109 // Flamingo Serif 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_flamingoserif_ngs_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 600.0

#elif CopyrightTexturePSO2_Source == 110 // Ligaturerian
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_ligaturerian.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 650.0, 300.0

#elif CopyrightTexturePSO2_Source == 111 // Ligaturerian 2
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_ligaturerian_2.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 650.0, 420.0

#elif CopyrightTexturePSO2_Source == 112 // Ligaturerian 3
#define _SOURCE_COPYRIGHT_PSO2_FILE "copyright_pso2_ligaturerian_3.png"
#define _SOURCE_COPYRIGHT_PSO2_SIZE 600.0, 500.0

#endif


texture Copyright_PSO2_Texture <
    source = _SOURCE_COPYRIGHT_PSO2_FILE;
> {
    Width = BUFFER_WIDTH;
    Height = BUFFER_HEIGHT;
    Format = RGBA8;
};

texture texVoid <
    source = "UIMask.png";
> {
    Width = BUFFER_WIDTH;
    Height = BUFFER_HEIGHT;
    Format = RGBA8;
};

texture Copyright_Texture_Gauss_H
{
        Width = BUFFER_WIDTH;
        Height = BUFFER_HEIGHT;
        Format = RGBA8; 
};

texture Copyright_Texture_Gauss_V
{
        Width = BUFFER_WIDTH;
        Height = BUFFER_HEIGHT;
        Format = RGBA8; 
};

texture Copyright_Texture_Gauss_Out
{
        Width = BUFFER_WIDTH;
        Height = BUFFER_HEIGHT;
        Format = RGBA8; 
};

texture Copyright_Texture_CAb_Gauss_H
{
        Width = BUFFER_WIDTH;
        Height = BUFFER_HEIGHT;
        Format = RGBA8; 
};

texture Copyright_Texture_CAb_Gauss_Out
{
        Width = BUFFER_WIDTH;
        Height = BUFFER_HEIGHT;
        Format = RGBA8; 
};

texture Copyright_Texture_CAb_A
{
        Width = BUFFER_WIDTH;
        Height = BUFFER_HEIGHT;
        Format = RGBA8; 
};

texture Copyright_Texture_CAb_B
{
        Width = BUFFER_WIDTH;
        Height = BUFFER_HEIGHT;
        Format = RGBA8; 
};

sampler Copyright_Sampler
{ 
    Texture = Copyright_PSO2_Texture;
    AddressU = CLAMP;
    AddressV = CLAMP;
};

sampler samplerVoid
{
    Texture = texVoid;
};

sampler Copyright_Sampler_Gauss_H
{ 
    Texture = Copyright_Texture_Gauss_H;
};

sampler Copyright_Sampler_Gauss_V
{ 
    Texture = Copyright_Texture_Gauss_Out;
};

sampler Copyright_Sampler_CAb_Gauss_H
{ 
    Texture = Copyright_Texture_CAb_Gauss_H;
};

sampler Copyright_Sampler_CAb_Gauss_V
{ 
    Texture = Copyright_Texture_CAb_Gauss_Out;
};

sampler Copyright_Sampler_CAb_A
{ 
    Texture = Copyright_Texture_CAb_A;
};

sampler Copyright_Sampler_CAb_B
{ 
    Texture = Copyright_Texture_CAb_B;
};

// -------------------------------------
// Entrypoints
// -------------------------------------

#include "ReShade.fxh"
#include "Blending.fxh"
#define PIXEL_SIZE float2(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT)

#define pivot float3(0.5, 0.5, 0.0)
#define AspectX float(1.0 - (BUFFER_WIDTH) * (1.0 / BUFFER_HEIGHT))
#define AspectY float(1.0 - (BUFFER_HEIGHT) * (1.0 / BUFFER_WIDTH))
#define mulUV float3(texCoord.x, texCoord.y, 1)
#define ScaleSize float2(float2(_SOURCE_COPYRIGHT_PSO2_SIZE) * cLayer_Scale / BUFFER_SCREEN_SIZE)
#define ScaleX float(ScaleSize.x * AspectX * cLayer_ScaleX)
#define ScaleY float(ScaleSize.y * AspectY * cLayer_ScaleY)
#define PosX float(cLayer_Mouse && RightMouseDown? MouseCoords.x * BUFFER_PIXEL_SIZE.x : cLayer_PosX)
#define PosY float(cLayer_Mouse && RightMouseDown? MouseCoords.y * BUFFER_PIXEL_SIZE.y : cLayer_PosY)
#define PosX_Gauss float(cLayer_PosX_Gauss * 0.1)
#define PosY_Gauss float(cLayer_PosY_Gauss * 0.1)


float3x3 positionMatrix (in float coord_X, in float coord_Y) {
    return float3x3 (
    1, 0, 0,
    0, 1, 0,
    -coord_X, -coord_Y, 1
    );
}

float3x3 positionMatrix_Gauss (in float coord_X, in float coord_Y) {
    return float3x3 (
    1, 0, 0,
    0, 1, 0,
    -coord_X + PosX_Gauss, -coord_Y + PosY_Gauss, 1
    );
}

float3x3 scaleMatrix (in float width_X, in float width_Y) {
    return float3x3 (
        1/width_X, 0, 0,
        0,  1/width_Y, 0,
        0, 0, 1
    );
}

float3x3 rotateMatrix (in float angle) {
    float Rotate = angle * (3.1415926 / 180.0);
    switch(cLayer_SnapRotate)
    {
        case 0:
            Rotate = (angle * (3.1415926 / 180.0)) + (-90.0 * (3.1415926 / 180.0));
            break;
        case 1:
            break;
        case 2:
            Rotate = (angle * (3.1415926 / 180.0)) + (90.0 * (3.1415926 / 180.0));
            break;
        case 3:
            Rotate = (angle * (3.1415926 / 180.0)) + (180.0 * (3.1415926 / 180.0));
            break;
    }
    
    return float3x3 (
    (cos(Rotate) * AspectX), (sin(Rotate) * AspectX), 0,
    (-sin(Rotate) * AspectY), (cos(Rotate) * AspectY), 0,
    0, 0, 1
    );
}


float4 PS_cLayer_Gauss_H(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        float4 color = tex2D(Copyright_Sampler_Gauss_V, texCoord);
        switch(GaussianBlurRadius)
        {
             default:
                 const float sampleOffsets[4] = { 0.0, 1.1824255238, 3.0293122308, 5.0040701377 };
                 const float sampleWeights[4] = { 0.39894, 0.2959599993, 0.0045656525, 0.00000149278686458842 };
                 color *= sampleWeights[0];
                 for(int i = 1; i < 4; ++i)
                 {
                 color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH+ 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                 color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH+ 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                 }
                 break;
            case 1:
                 const float sampleOffsets[6] = { 0.0, 1.4584295168, 3.40398480678, 5.3518057801, 7.302940716, 9.2581597095 };
                 const float sampleWeights[6] = { 0.13298, 0.23227575, 0.1353261595, 0.0511557427, 0.01253922, 0.0019913644 };
                 color *= sampleWeights[0];
                 for(int i = 1; i < 6; ++i)
                 {
                 color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH+ 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                 color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH+ 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                 }
                 break;
             case 2:
                 const float sampleOffsets[11] = { 0.0, 1.4895848401, 3.4757135714, 5.4618796741, 7.4481042327, 9.4344079746, 11.420811147, 13.4073334, 15.3939936778, 17.3808101174, 19.3677999584 };
                 const float sampleWeights[11] = { 0.06649, 0.1284697563, 0.111918249, 0.0873132676, 0.0610011113, 0.0381655709, 0.0213835661, 0.0107290241, 0.0048206869, 0.0019396469, 0.0006988718 };
                 color *= sampleWeights[0];
                 for(int i = 1; i < 11; ++i)
                 {
                 color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH+ 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                 color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH+ 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                 }
                 break;
        }
        color.rgb = (GaussColor.rgb);
        return color;
}

float4 PS_cLayer_Gauss_V(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        const float3 SumUV = mul (mul (mul (mulUV, positionMatrix_Gauss(PosX, PosY)), rotateMatrix(cLayer_Rotate)), scaleMatrix(ScaleX, ScaleY));
        float4 color = tex2D(Copyright_Sampler, SumUV.rg + pivot.rg) * all(SumUV + pivot == saturate(SumUV + pivot));
        switch(GaussianBlurRadius)
        {
             default:
                 const float sampleOffsets[4] = { 0.0, 1.1824255238, 3.0293122308, 5.0040701377 };
                 const float sampleWeights[4] = { 0.39894, 0.2959599993, 0.0045656525, 0.00000149278686458842 };
                 color *= sampleWeights[0];
                 for(int i = 1; i < 4; ++i)
                 {
                 color += tex2Dlod(Copyright_Sampler_Gauss_H, float4(texCoord + float2(0.0, sampleOffsets[i] * (GaussWeight * (GaussWeightV + 0.5)) * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
                 color += tex2Dlod(Copyright_Sampler_Gauss_H, float4(texCoord - float2(0.0, sampleOffsets[i] * (GaussWeight * (GaussWeightV + 0.5)) * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
                 }
                 break;
            case 1:
                 const float sampleOffsets[6] = { 0.0, 1.4584295168, 3.40398480678, 5.3518057801, 7.302940716, 9.2581597095 };
                 const float sampleWeights[6] = { 0.13298, 0.23227575, 0.1353261595, 0.0511557427, 0.01253922, 0.0019913644 };
                 color *= sampleWeights[0];
                 for(int i = 1; i < 6; ++i)
                 {
                 color += tex2Dlod(Copyright_Sampler_Gauss_H, float4(texCoord + float2(0.0, sampleOffsets[i] * (GaussWeight * (GaussWeightV + 0.5)) * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
                 color += tex2Dlod(Copyright_Sampler_Gauss_H, float4(texCoord - float2(0.0, sampleOffsets[i] * (GaussWeight * (GaussWeightV + 0.5)) * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
                 }
                 break;
             case 2:
                 const float sampleOffsets[11] = { 0.0, 1.4895848401, 3.4757135714, 5.4618796741, 7.4481042327, 9.4344079746, 11.420811147, 13.4073334, 15.3939936778, 17.3808101174, 19.3677999584 };
                 const float sampleWeights[11] = { 0.06649, 0.1284697563, 0.111918249, 0.0873132676, 0.0610011113, 0.0381655709, 0.0213835661, 0.0107290241, 0.0048206869, 0.0019396469, 0.0006988718 };
                 color *= sampleWeights[0];
                 for(int i = 1; i < 11; ++i)
                 {
                 color += tex2Dlod(Copyright_Sampler_Gauss_H, float4(texCoord + float2(0.0, sampleOffsets[i] * (GaussWeight * (GaussWeightV + 0.5)) * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
                 color += tex2Dlod(Copyright_Sampler_Gauss_H, float4(texCoord - float2(0.0, sampleOffsets[i] * (GaussWeight * (GaussWeightV + 0.5)) * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
                 }
                 break;
        }
        color.rgb = (GaussColor.rgb);
        return color;
}

float4 PS_cLayer_CAb_Gauss_H(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        float4 color = tex2D(Copyright_Sampler_CAb_Gauss_V, texCoord);
        const float sampleOffsets[6] = { 0.0, 1.4584295168, 3.40398480678, 5.3518057801, 7.302940716, 9.2581597095 };
        const float sampleWeights[6] = { 0.13298, 0.23227575, 0.1353261595, 0.0511557427, 0.01253922, 0.0019913644 };
        color *= sampleWeights[0];
        for(int i = 1; i < 6; ++i)
        {
        color += tex2Dlod(Copyright_Sampler_CAb_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * cLayer_CAb_Blur * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
        color += tex2Dlod(Copyright_Sampler_CAb_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * cLayer_CAb_Blur * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
        }
        return color;
}

float4 PS_cLayer_CAb_Gauss_V(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        float4 color = tex2D(Copyright_Sampler, texCoord);
        const float sampleOffsets[6] = { 0.0, 1.4584295168, 3.40398480678, 5.3518057801, 7.302940716, 9.2581597095 };
        const float sampleWeights[6] = { 0.13298, 0.23227575, 0.1353261595, 0.0511557427, 0.01253922, 0.0019913644 };
        color *= sampleWeights[0];
        for(int i = 1; i < 6; ++i)
        {
        color += tex2Dlod(Copyright_Sampler_CAb_Gauss_H, float4(texCoord + float2(0.0, sampleOffsets[i] * cLayer_CAb_Blur * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
        color += tex2Dlod(Copyright_Sampler_CAb_Gauss_H, float4(texCoord - float2(0.0, sampleOffsets[i] * cLayer_CAb_Blur * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
        }
        return color;
}

float4 PS_cLayer_CAb_A(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        const float2 CAb_Shift = cLayer_CAb_Shift * 0.05;
        const float3 SumUV = mul (mul (mul (mulUV, positionMatrix(PosX + CAb_Shift.x, PosY + CAb_Shift.y)), rotateMatrix(cLayer_Rotate)), scaleMatrix(ScaleX, ScaleY));
        float4 color = tex2D(Copyright_Sampler_CAb_Gauss_H, SumUV.rg + pivot.rg) * all(SumUV + pivot == saturate(SumUV + pivot));
        color = float4(cLayer_CAb_Color_A.r, cLayer_CAb_Color_A.g, cLayer_CAb_Color_A.b, color.a * cLayer_CAb_Color_A.a);
        return color;
}

float4 PS_cLayer_CAb_B(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        const float2 CAb_Shift = cLayer_CAb_Shift * 0.05;
        const float3 SumUV = mul (mul (mul (mulUV, positionMatrix(PosX - CAb_Shift.x, PosY - CAb_Shift.y)), rotateMatrix(cLayer_Rotate)), scaleMatrix(ScaleX , ScaleY));
        float4 color = tex2D(Copyright_Sampler_CAb_Gauss_H, SumUV.rg + pivot.rg) * all(SumUV + pivot == saturate(SumUV + pivot));
        color = float4(cLayer_CAb_Color_B.r, cLayer_CAb_Color_B.g, cLayer_CAb_Color_B.b, color.a * cLayer_CAb_Color_B.a);
        return color;
}

void PS_cLayer_PSO2(in float4 pos : SV_Position, float2 texCoord : TEXCOORD, out float4 passColor : SV_Target) {


    const float Depth = 0.999 - ReShade::GetLinearizedDepth(texCoord).x;
    float4 backColorOrig = tex2D(ReShade::BackBuffer, texCoord);
    if (Depth < cLayer_Depth)
    {
        const float3 SumUV = mul (mul (mul (mulUV, positionMatrix(PosX, PosY)), rotateMatrix(cLayer_Rotate)), scaleMatrix(ScaleX, ScaleY));
        float4 GaussOut = tex2D(Copyright_Sampler_Gauss_H, texCoord);
        float4 CAb_A = tex2D(Copyright_Sampler_CAb_A, texCoord);
        float4 CAb_B = tex2D(Copyright_Sampler_CAb_B, texCoord);
        float4 Void = tex2D(samplerVoid, SumUV.rg + pivot.rg) * all(SumUV + pivot == saturate(SumUV + pivot));
        float4 DrawTex = tex2D(Copyright_Sampler, SumUV.rg + pivot.rg) * all(SumUV + pivot == saturate(SumUV + pivot));

        switch (cLayer_BlendMode_Gauss)
        {
            // Normal
            default:
                GaussOut = lerp(backColorOrig.rgb, GaussOut.rgb, GaussOut.a * Gauss_Blend);
                break;
            // Darken
            case 1:
                GaussOut = lerp(backColorOrig.rgb, Darken(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Multiply
            case 2:
                GaussOut = lerp(backColorOrig.rgb, Multiply(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Color Burn
            case 3:
                GaussOut = lerp(backColorOrig.rgb, ColorBurn(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Linear Burn
            case 4:
                GaussOut = lerp(backColorOrig.rgb, LinearBurn(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Lighten
            case 5:
                GaussOut = lerp(backColorOrig.rgb, Lighten(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Screen
            case 6:
                GaussOut = lerp(backColorOrig.rgb, Screen(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Color Dodge
            case 7:
                GaussOut = lerp(backColorOrig.rgb, ColorDodge(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Linear Dodge
            case 8:
                GaussOut = lerp(backColorOrig.rgb, LinearDodge(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Addition
            case 9:
                GaussOut = lerp(backColorOrig.rgb, Addition(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Glow
            case 10:
                GaussOut = lerp(backColorOrig.rgb, Glow(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Overlay
            case 11:
                GaussOut = lerp(backColorOrig.rgb, Overlay(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Soft Light
            case 12:
                GaussOut = lerp(backColorOrig.rgb, SoftLight(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Hard Light
            case 13:
                GaussOut = lerp(backColorOrig.rgb, HardLight(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Vivid Light
            case 14:
                GaussOut = lerp(backColorOrig.rgb, VividLight(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Linear Light
            case 15:
                GaussOut = lerp(backColorOrig.rgb, LinearLight(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Pin Light
            case 16:
                GaussOut = lerp(backColorOrig.rgb, PinLight(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Hard Mix
            case 17:
                GaussOut = lerp(backColorOrig.rgb, HardMix(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Difference
            case 18:
                GaussOut = lerp(backColorOrig.rgb, Difference(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Exclusion
            case 19:
                GaussOut = lerp(backColorOrig.rgb, Exclusion(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Subtract
            case 20:
                GaussOut = lerp(backColorOrig.rgb, Subtract(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Divide
            case 21:
                GaussOut = lerp(backColorOrig.rgb, Divide(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Reflect
            case 22:
                GaussOut = lerp(backColorOrig.rgb, Reflect(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Grain Extract
            case 23:
                GaussOut = lerp(backColorOrig.rgb, GrainExtract(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Grain Merge
            case 24:
                GaussOut = lerp(backColorOrig.rgb, GrainMerge(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Hue
            case 25:
                GaussOut = lerp(backColorOrig.rgb, Hue(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Saturation
            case 26:
                GaussOut = lerp(backColorOrig.rgb, Saturation(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Color
            case 27:
                GaussOut = lerp(backColorOrig.rgb, ColorB(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
            // Luminosity
            case 28:
                GaussOut = lerp(backColorOrig.rgb, Luminosity(backColorOrig.rgb, GaussOut.rgb), GaussOut.a * Gauss_Blend);
                break;
        }

        switch(cLayer_BlendMode_CAb)
        {
            case 0:
                GaussOut  = lerp(GaussOut.rgb, Screen(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayer_CAb_Strength);
                GaussOut  = lerp(GaussOut.rgb, Screen(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayer_CAb_Strength);
                break;
            case 1:
                GaussOut = lerp(GaussOut.rgb, ColorB(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayer_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ColorB(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayer_CAb_Strength);
                break;
            case 2:
                GaussOut = lerp(GaussOut.rgb, GrainMerge(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayer_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, GrainMerge(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayer_CAb_Strength);
                break;
            case 3:
                GaussOut = lerp(GaussOut.rgb, CAb_A.rgb, CAb_A.a * cLayer_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, CAb_B.rgb, CAb_B.a * cLayer_CAb_Strength);
                break;
        }


        float4 ColorFactor = DrawTex;
        switch(cLayer_Color_Override)
        {
            default:
                break;
            case 1:
                ColorFactor = float3(1, 1, 1) - DrawTex.rgb;
                break;
            case 2:
                ColorFactor =  saturate(DrawTex.rgb * ColorOverride.rgb); 
                break;
            case 3:
                ColorFactor =  DrawTex.rgb + ColorOverride.rgb;
                break;
            case 4:
                ColorFactor =  float4(-1, -1, -1, 1) * DrawTex;
                ColorFactor =  saturate(DrawTex.rgb * ColorOverride.rgb); 
                break;
            case 5:
                ColorFactor =  float4(-1, -1, -1, 1) * DrawTex;
                ColorFactor =  DrawTex.rgb + ColorOverride.rgb;
                break;
        }
        float4 backColor = GaussOut;
        passColor = lerp(backColorOrig, Void, DrawTex);
        passColor = lerp(ColorFactor, backColorOrig, DrawTex);


        switch (cLayer_BlendMode_BG)
        {
            // Normal
            default:
                passColor = lerp(backColor.rgb, passColor.rgb, DrawTex.a * cLayer_Blend_BG);
                break;
            // Darken
            case 1:
                passColor = lerp(backColor.rgb, Darken(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Multiply
            case 2:
                passColor = lerp(backColor.rgb, Multiply(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Color Burn
            case 3:
                passColor = lerp(backColor.rgb, ColorBurn(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Linear Burn
            case 4:
                passColor = lerp(backColor.rgb, LinearBurn(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Lighten
            case 5:
                passColor = lerp(backColor.rgb, Lighten(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Screen
            case 6:
                passColor = lerp(backColor.rgb, Screen(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Color Dodge
            case 7:
                passColor = lerp(backColor.rgb, ColorDodge(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Linear Dodge
            case 8:
                passColor = lerp(backColor.rgb, LinearDodge(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Addition
            case 9:
                passColor = lerp(backColor.rgb, Addition(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Glow
            case 10:
                passColor = lerp(backColor.rgb, Glow(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Overlay
            case 11:
                passColor = lerp(backColor.rgb, Overlay(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Soft Light
            case 12:
                passColor = lerp(backColor.rgb, SoftLight(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Hard Light
            case 13:
                passColor = lerp(backColor.rgb, HardLight(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Vivid Light
            case 14:
                passColor = lerp(backColor.rgb, VividLight(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Linear Light
            case 15:
                passColor = lerp(backColor.rgb, LinearLight(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Pin Light
            case 16:
                passColor = lerp(backColor.rgb, PinLight(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Hard Mix
            case 17:
                passColor = lerp(backColor.rgb, HardMix(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Difference
            case 18:
                passColor = lerp(backColor.rgb, Difference(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Exclusion
            case 19:
                passColor = lerp(backColor.rgb, Exclusion(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Subtract
            case 20:
                passColor = lerp(backColor.rgb, Subtract(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Divide
            case 21:
                passColor = lerp(backColor.rgb, Divide(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Reflect
            case 22:
                passColor = lerp(backColor.rgb, Reflect(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Grain Extract
            case 23:
                passColor = lerp(backColor.rgb, GrainExtract(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Grain Merge
            case 24:
                passColor = lerp(backColor.rgb, GrainMerge(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Hue
            case 25:
                passColor = lerp(backColor.rgb, Hue(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Saturation
            case 26:
                passColor = lerp(backColor.rgb, Saturation(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Color
            case 27:
                passColor = lerp(backColor.rgb, ColorB(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
            // Luminosity
            case 28:
                passColor = lerp(backColor.rgb, Luminosity(backColorOrig.rgb, passColor.rgb), DrawTex.a * cLayer_Blend_BG);
                break;
        }


            switch (cLayer_BlendMode)
            {
            // Normal
                      default:
                passColor = lerp(passColor.rgb, ColorFactor.rgb, DrawTex.a * cLayer_Blend);
                          break;
            // Darken
            case 1:
                passColor = lerp(passColor.rgb, Darken(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Multiply
            case 2:
                passColor = lerp(passColor.rgb, Multiply(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Color Burn
            case 3:
                passColor = lerp(passColor.rgb, ColorBurn(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Linear Burn
            case 4:
                passColor = lerp(passColor.rgb, LinearBurn(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Lighten
            case 5:
                passColor = lerp(passColor.rgb, Lighten(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Screen
            case 6:
                passColor = lerp(passColor.rgb, Screen(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Color Dodge
            case 7:
                passColor = lerp(passColor.rgb, ColorDodge(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Linear Dodge
            case 8:
                passColor = lerp(passColor.rgb, LinearDodge(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Addition
            case 9:
                passColor = lerp(passColor.rgb, Addition(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Glow
            case 10:
                passColor = lerp(passColor.rgb, Glow(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Overlay
            case 11:
                passColor = lerp(passColor.rgb, Overlay(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Soft Light
            case 12:
                passColor = lerp(passColor.rgb, SoftLight(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Hard Light
            case 13:
                passColor = lerp(passColor.rgb, HardLight(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Vivid Light
            case 14:
                passColor = lerp(passColor.rgb, VividLight(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Linear Light
            case 15:
                passColor = lerp(passColor.rgb, LinearLight(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Pin Light
            case 16:
                passColor = lerp(passColor.rgb, PinLight(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Hard Mix
            case 17:
                passColor = lerp(passColor.rgb, HardMix(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Difference
            case 18:
                passColor = lerp(passColor.rgb, Difference(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Exclusion
            case 19:
                passColor = lerp(passColor.rgb, Exclusion(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Subtract
            case 20:
                passColor = lerp(passColor.rgb, Subtract(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Divide
            case 21:
                passColor = lerp(passColor.rgb, Divide(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Reflect
            case 22:
                passColor = lerp(passColor.rgb, Reflect(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Grain Extract
            case 23:
                passColor = lerp(passColor.rgb, GrainExtract(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Grain Merge
            case 24:
                passColor = lerp(passColor.rgb, GrainMerge(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Hue
            case 25:
                passColor = lerp(passColor.rgb, Hue(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Saturation
            case 26:
                passColor = lerp(passColor.rgb, Saturation(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Color
            case 27:
                passColor = lerp(passColor.rgb, ColorB(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
            // Luminosity
            case 28:
                passColor = lerp(passColor.rgb, Luminosity(backColorOrig.rgb, ColorFactor.rgb), DrawTex.a * cLayer_Blend);
                break;
        }
        passColor.a = backColorOrig.a;
    }
   else
   passColor = backColorOrig;
}

// -------------------------------------
// Techniques
// -------------------------------------

technique Copyright_PSO2< ui_label = "Copyright PSO2"; >
{
    pass pass0
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayer_Gauss_H;
        RenderTarget = Copyright_Texture_Gauss_H;
    }
    pass pass1
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayer_Gauss_V;
        RenderTarget = Copyright_Texture_Gauss_Out;
    }
    pass pass2
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayer_CAb_Gauss_H;
        RenderTarget = Copyright_Texture_CAb_Gauss_H;
    }
    pass pass3
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayer_CAb_Gauss_V;
        RenderTarget = Copyright_Texture_CAb_Gauss_Out;
    }
    pass pass4
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayer_CAb_A;
        RenderTarget = Copyright_Texture_CAb_A;
    }
    pass pass5
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayer_CAb_B;
        RenderTarget = Copyright_Texture_CAb_B;
    }
    pass pass6
   {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayer_PSO2;
    }
}
