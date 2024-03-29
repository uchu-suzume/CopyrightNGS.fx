/*------------------.
| :: Description :: |
'-------------------/

    Copyright (based on Layer) (version 1.1)

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

    Version 0.9 by uchu suzume
    * Added some texures.
    * Fixed blend option applying correctly to alpha pixels by changing the order of code blocks.
    * Add space of UI and collapsed some parameters for visibility.
    * Changed the order of parameter in snap rotate.
    * Experimental features added:
        * Coloring textures(invert, any color for white / black pixels).
        * Move texture to mouse position.
        * Merge and blend background pixels into logo texture(Not sure I said it correctly in English).
        * Added layer with Gaussian blur can be used for drop shadows or bloom.
        * Added chromatic aberration layer with gaussian blur.

    Version 1.0 by Marot Satil & uchu suzume
    + Implemented Blending.fxh preprocessor macros.
    
    Version 1.1 by Marot Satil & uchu suzume
    * Added a gaussian blur radius option that allows you to adjust the applied area.
    * Improved the accuracy of the BG Blend mode option.

    Version 1.2 by uchu suzume
    + Implemented texture list to easier to find from tons of variations.
    * Added scale option to gaussian layer.
    * Added more blending option to CAb layer.
    + Adjusted default value of CAb to more natural look and usable.
    + Adjusted gaussian blur radius opiton #3 to reduce afterglow.
    + Expanded moving range of Gaussian layer.
    + Improved the formulas of Gaussian and CAb layers to keep the coordinate base even after rotation.

    Version 1.3 by uchu suzume
    + Improved formula for recolor.

    Version 1.4 by Marot Satil & uchu suzume
    + Implemented new recolor method of changing two colors individually.
    + Color pickers are switched for in/out as needed depending on the status of recolor option.
    + Moved inversion option in recolor from a drop-down box to a single check box.

    Version 1.41 by uchu suzume
    x Correspond to specification changes for GShade 4.02.
    
    Version 1.5 by Marot Satil & uchu suzume
    x Fixed incorrect declaration of arguments in Texture combo.
*/

#include "ReShade.fxh"
#include "Blending.fxh"


#ifndef cLayerNGSTex
#define cLayerNGSTex "cLayerNGSA.png" // Add your own image file to \reshade-shaders\Textures\ and provide the new file name in quotes to change the image displayed!
#endif
#ifndef cLayerNGS_SIZE_X
#define cLayerNGS_SIZE_X BUFFER_WIDTH
#endif
#ifndef cLayerNGS_SIZE_Y
#define cLayerNGS_SIZE_Y BUFFER_HEIGHT
#endif

#if cLayerNGS_SINGLECHANNEL
#define TEXFORMAT R8
#else
#define TEXFORMAT RGBA8
#endif

#if cLayerNGS_TEXTURE_SELECTION == 0
#undef cLayerNGS_TEXTURE_SELECTION
#define cLayerNGS_TEXTURE_SELECTION 0
#include "CopyrightTex_NGS_1.fxh"
#elif cLayerNGS_TEXTURE_SELECTION == 1
#undef cLayerNGS_TEXTURE_SELECTION
#define cLayerNGS_TEXTURE_SELECTION 1
#include "CopyrightTex_NGS_2.fxh"
#elif cLayerNGS_TEXTURE_SELECTION == 2
#undef cLayerNGS_TEXTURE_SELECTION
#define cLayerNGS_TEXTURE_SELECTION 2
#include "CopyrightTex_NGS_3.fxh"
#elif cLayerNGS_TEXTURE_SELECTION == 3
#undef cLayerNGS_TEXTURE_SELECTION
#define cLayerNGS_TEXTURE_SELECTION 3
#include "CopyrightTex_NGS_4.fxh"
#elif cLayerNGS_TEXTURE_SELECTION == 4
#undef cLayerNGS_TEXTURE_SELECTION
#define cLayerNGS_TEXTURE_SELECTION 4
#include "CopyrightTex_NGS_5.fxh"
#elif cLayerNGS_TEXTURE_SELECTION == 5
#undef cLayerNGS_TEXTURE_SELECTION
#define cLayerNGS_TEXTURE_SELECTION 5
#include "CopyrightTex_NGS_6.fxh"
#elif cLayerNGS_TEXTURE_SELECTION == 6
#undef cLayerNGS_TEXTURE_SELECTION
#define cLayerNGS_TEXTURE_SELECTION 6
#include "CopyrightTex_NGS_7.fxh"
#elif cLayerNGS_TEXTURE_SELECTION == 7
#undef cLayerNGS_TEXTURE_SELECTION
#define cLayerNGS_TEXTURE_SELECTION 7
#include "CopyrightTex_NGS_8.fxh"
//#elif cLayerNGS_TEXTURE_SELECTION == 9           /* Customリストを使用する場合は行頭の//を削除してください。 */
//#undef cLayerNGS_TEXTURE_SELECTION               /* Customリストを使用する場合は行頭の//を削除してください。 */
//#define cLayerNGS_TEXTURE_SELECTION 9            /* Customリストを使用する場合は行頭の//を削除してください。 */
//#include "CopyrightTex_NGS_Custom.fxh" /* Customリストを使用する場合は行頭の//を削除してください。 */
#endif

uniform int cLayerNGS_SelectList <
    ui_label = "List Select";
    ui_tooltip = "Select the list of logo textures.   ";
    ui_category = "List Selection";
    ui_category_closed = false;
    ui_type = "combo";
    ui_items = "List 1: Standard\0"
               "List 2: Simple & Large Size\0"
               "List 3: Essential & Compact\0"
               "List 4: Variety\0"
               "List 5: Art\0"
               "List 6: Rachel DF\0"
               "List 7: Super Bodoni DF\0"
               "List 8: Vertical\0"
               //"Custom\0" /* Customリストを使用する場合は行頭の//を削除してください。 */
               ;
    ui_bind = "cLayerNGS_TEXTURE_SELECTION";
> = cLayerNGS_TEXTURE_SELECTION;

TEXTURE_COMBO(
    cLayerNGS_Select,
    "Copyright Logo Selection",
    "The image/texture you'd like to use.   "
);

uniform float cLayerNGS_Scale <
    ui_label = "Scale";
    ui_tooltip = "If you need to increase more scale value,    \nyou can use Scale X&Y combined below.   \nExcessive scaling might degrade the texture   \nhowever.";
    ui_type = "slider";
    ui_min = 0.500; ui_max = 1.0;
    ui_step = 0.001;
> = 0.780;

uniform float cLayerNGS_ScaleX <
    ui_label = "Scale X";    
    ui_category = "ScaleXY";
    ui_category_closed = true;
    ui_type = "slider";
    ui_min = 0.001; ui_max = 5.0;
    ui_step = 0.001;
> = 1.0;

uniform float cLayerNGS_ScaleY <
    ui_label = "Scale Y";
    ui_category = "ScaleXY";
    ui_type = "slider";
    ui_min = 0.001; ui_max = 5.0;
    ui_step = 0.001;
> = 1.0;


uniform bool  cLayerNGS_Mouse <
    ui_label = "Mouse Following Mode";
    ui_tooltip = "Press right click to logo texture follow the mouse cursor.   \nRight click again to back to Position X and Y coord.";
    ui_spacing = 2;
> = false;

uniform float cLayerNGS_PosX <
    ui_label = "Position X";
    ui_tooltip = "X & Y coordinates of the textures.\nAxes start upper left screen corner.   ";
    ui_type = "slider";
    ui_min = 0.0; ui_max = 1.0;
    ui_step = 0.001;
> = 0.680;

uniform float cLayerNGS_PosY <
    ui_label = "Position Y";
    ui_tooltip = "X & Y coordinates of the textures.\nAxes start upper left screen corner.   ";
    ui_type = "slider";
    ui_min = 0.0; ui_max = 1.0;
    ui_step = 0.001;
> = 0.970;

uniform int cLayerNGS_SnapRotate <
    ui_label = "Snap Rotation";
    ui_tooltip = "Snap rotation to a specific angle.\nPress arrow button to rotate 90° each direction.   ";
    ui_type = "combo";
    ui_spacing = 2;
    ui_items = "-90 Degrees\0"
               "0 Degrees\0"
               "90 Degrees\0"
               "180 Degrees\0"
               ;
> = 1;

uniform float cLayerNGS_Rotate <
    ui_label = "Rotate";
    ui_tooltip = "Rotate the texture to desired angle.   ";
    ui_type = "slider";
    ui_min = -180.0;
    ui_max = 180.0;
    ui_step = 0.01;
> = 0;


uniform bool cLayerNGS_Color_Invert <
    ui_label = "Invert Colors";
    ui_tooltip = "Can invert all colors.";
    ui_spacing = 2;
> = 0;

#ifndef cLayerNGS_COLOR_OVERRIDE_COMBO
    #define cLayerNGS_COLOR_OVERRIDE_COMBO 0
#endif

uniform int cLayerNGS_Color_Override <
    ui_label = "Recolor";
    ui_tooltip = "Can colorize   \nto any color to black/white areas.";
    ui_type = "combo";
    ui_items = "None\0"
               "Recolor White Part\0"
               "Recolor Black Part\0"
               "Recolor Both Parts\0"
               "Recolor Both in One Color\0"
               ;
    ui_bind = "cLayerNGS_COLOR_OVERRIDE_COMBO";
> = 3;

#if cLayerNGS_COLOR_OVERRIDE_COMBO > 0
uniform float3 ColorOverrideA <
    ui_label = "Color A";
    ui_tooltip = "Color applied to recolor.   ";
    ui_type = "color";
> = float3(0.0, 1.0, 1.0);
#endif

#if cLayerNGS_COLOR_OVERRIDE_COMBO == 3
uniform float3 ColorOverrideB <
    ui_label = "Color B";
    ui_tooltip = "Color applied to recolor.   ";
    ui_type = "color";
> = float3(0.0, 1.0, 1.0);
#endif


BLENDING_COMBO(
    cLayerNGS_BlendMode,
    "Blending Mode",
    "Select the blending mode applied to the texture.   ",
    "",
    false,
    2,
    0
);

uniform float cLayerNGS_Blend <
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
    ui_max = 3.0;
    ui_step = 0.001;
> = 0.0;

uniform float cLayerNGS_PosX_Gauss <
    ui_label = "Gaussian Layer Offset X";
    ui_tooltip = "Offset of the Gaussian layer based on texture's    \ncoordinates.";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_spacing = 2;
    ui_min = -0.35; ui_max = 0.35;
    ui_step = 0.001;
> = 0.025;

uniform float cLayerNGS_PosY_Gauss <
    ui_label = "Gaussian Layer Offset Y";
    ui_tooltip = "Offset of the Gaussian layer based on texture's    \ncoordinates.";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_min = -0.35; ui_max = 0.35;
    ui_step = 0.001;
> = 0.050;

uniform float cLayerNGS_Scale_Gauss <
    ui_label = "Gaussian Layer Scale";
    ui_tooltip = "Scale of the Gaussian layer.   ";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_min = 0.75; ui_max = 1.5;
    ui_step = 0.001;
> = 1.000;

uniform int GaussianBlurRadius <
    ui_label = "Gaussian Blur Radius";
    ui_tooltip = "[0|1|2|3] Adjusts the blur radius.\nEach values Assumed to use for better results accord to   \ndifferent sizes of logos.   \nValue 3 is intended as some challenge.";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_spacing = 2;
    ui_min = 0;
    ui_max = 3;
    ui_step = 1;
> = 1;

uniform float GaussWeight <
    ui_label = "Gaussian Weight";
    ui_tooltip = "Weight based on Gaussian Radius.   \nIncreasing value makes more blur.   ";
    ui_category = "Gaussian Layer";
    ui_type = "slider";
    ui_min = 0.001;
    ui_max = 3.0;
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

BLENDING_COMBO(
    cLayerNGS_BlendMode_Gauss,
    "Gaussian Layer Blending Mode",
    "Select the blending mode applied to the Gaussian Layer.   ",
    "Gaussian Layer",
    false,
    2,
    0
);


BLENDING_COMBO(
    cLayerNGS_BlendMode_BG,
    "BG Blending Mode",
    "Select the blending mode applied to the bg-texture.   \n\
- note -   \nWhen using this mode, it requires reducing blending\namount of logo texture.   \nThe priority of this mode is to be set to later.   ",
    "BG Blending Mode",
    false,
    2,
    0
);

uniform float cLayerNGS_Blend_BG <
    ui_label = "BG Blending Amount";
    ui_tooltip = "The amount of blending applied to the bg-texture.   ";
    ui_category = "BG Blending Mode";
    ui_category_closed = true;
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 1.0;
    ui_step = 0.001;
> = 0.0;


uniform float4 cLayerNGS_CAb_Color_A <
    ui_label = "CAb Color A";
    ui_tooltip = "A Color appling to Chromatic Aberration layer.   ";
    ui_category = "Chromatic Aberration";
    ui_category_closed = true;
    ui_type = "color";
> = float4(1.0, 0.0, 0.0, 1.0);

uniform float4 cLayerNGS_CAb_Color_B <
    ui_label = "CAb Color B";
    ui_tooltip = "A Color appling to Chromatic Aberration layer.   ";
    ui_category = "Chromatic Aberration";
    ui_type = "color";
> = float4(0.0, 1.0, 1.0, 1.0);

uniform float2 cLayerNGS_CAb_Shift <
    ui_label = "CAb Shift";
    ui_tooltip = "Degree of Chromatic Aberration.   ";
    ui_category = "Chromatic Aberration";
    ui_type = "slider";
    ui_min = -0.2;
    ui_max = 0.2;
> = float2(0.015, -0.015);

uniform float cLayerNGS_CAb_Strength <
    ui_label = "CAb Strength";
    ui_tooltip = "Blending Amount of Chromatic Aberration layer.   ";
    ui_category = "Chromatic Aberration";
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

uniform float cLayerNGS_CAb_Blur <
    ui_label = "CAb Blur";
    ui_tooltip = "A Simplistic blur for Chromatic Aberration Layer .   ";
    ui_category = "Chromatic Aberration";
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 1.5;
> = 0.015;

uniform int cLayerNGS_BlendMode_CAb <
    ui_label = "CAb Blending Mode";
    ui_tooltip = "Select the blending mode applied to the CAb layer.\nDifferent look according to the brightness of background.   ";
    ui_category = "Chromatic Aberration";
    ui_type = "combo";
    ui_items = "Screen\0"
               "LinearDodge\0"
               "Glow\0"
               "LinearLight\0"
               "Color\0"
               "Grain Merge\0"
               "Divide\0"
               "Divide(Alternative)\0"
               "Normal\0"
               ;
> = 0;


uniform float cLayerNGS_Depth <
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


// If you get an error about _SOURCE_COPYRIGHT_NGS_FILE, check to make sure you're not missing a referenced *Tex.fxh game header.
texture Copyright_TextureNGS <
    source = _SOURCE_COPYRIGHT_NGS_FILE;
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
    Texture = Copyright_TextureNGS;
    AddressU = CLAMP;
    AddressV = CLAMP;
    AddressW = CLAMP;
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

#define PIXEL_SIZE float2(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT)

#define pivot float3(0.5, 0.5, 0.0)
#define AspectX float(1.0 - (BUFFER_WIDTH) * (1.0 / BUFFER_HEIGHT))
#define AspectY float(1.0 - (BUFFER_HEIGHT) * (1.0 / BUFFER_WIDTH))
#define mulUV float3(texCoord.x, texCoord.y, 1)
#define ScaleSize float2(float2(_SOURCE_COPYRIGHT_NGS_SIZE) * cLayerNGS_Scale / BUFFER_SCREEN_SIZE)
#define ScaleX float(ScaleSize.x * AspectX * cLayerNGS_ScaleX)
#define ScaleY float(ScaleSize.y * AspectY * cLayerNGS_ScaleY)
#define PosX float(cLayerNGS_Mouse && RightMouseDown? MouseCoords.x * BUFFER_PIXEL_SIZE.x : cLayerNGS_PosX)
#define PosY float(cLayerNGS_Mouse && RightMouseDown? MouseCoords.y * BUFFER_PIXEL_SIZE.y : cLayerNGS_PosY)
#define PosX_Gauss float(cLayerNGS_PosX_Gauss * 0.1)
#define PosY_Gauss float(cLayerNGS_PosY_Gauss * 0.1)
#define ScaleSize_Gauss float2(float2(_SOURCE_COPYRIGHT_NGS_SIZE) * ((cLayerNGS_Scale) + (-1 + cLayerNGS_Scale_Gauss)) / BUFFER_SCREEN_SIZE)
#define ScaleX_Gauss float(AspectX * ScaleSize_Gauss.x)
#define ScaleY_Gauss float(AspectY * ScaleSize_Gauss.y)


float3x3 positionMatrix (in float coord_X, in float coord_Y) {
    return float3x3 (
    1, 0, 0,
    0, 1, 0,
    -coord_X, -coord_Y, 1
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
    switch(cLayerNGS_SnapRotate)
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

float3x3 rotateMatrix_Alt (in float angle) {
    return float3x3 (
    (cos(angle) * AspectX), (sin(angle) * AspectX), 0,
    (-sin(angle) * AspectY), (cos(angle) * AspectY), 0,
    0, 0, 1
    );
}


float4 PS_cLayerNGS_Gauss_H(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        float4 color = tex2D(Copyright_Sampler_Gauss_V, texCoord);
        switch(GaussianBlurRadius)
        {
            default:
                const float sampleOffsets[4] = { 0.0, 1.1824255238, 3.0293122308, 5.0040701377 };
                const float sampleWeights[4] = { 0.39894, 0.2959599993, 0.0045656525, 0.00000149278686458842 };
                color *= sampleWeights[0];
                for(int i = 1; i < 4; ++i)
                {
                color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH + 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH + 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                }
                break;
            case 1:
                const float sampleOffsets[6] = { 0.0, 1.4584295168, 3.40398480678, 5.3518057801, 7.302940716, 9.2581597095 };
                const float sampleWeights[6] = { 0.13298, 0.23227575, 0.1353261595, 0.0511557427, 0.01253922, 0.0019913644 };
                color *= sampleWeights[0];
                for(int i = 1; i < 6; ++i)
                {
                color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH + 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH + 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                }
                break;
            case 2:
                const float sampleOffsets[11] = { 0.0, 1.4895848401, 3.4757135714, 5.4618796741, 7.4481042327, 9.4344079746, 11.420811147, 13.4073334, 15.3939936778, 17.3808101174, 19.3677999584 };
                const float sampleWeights[11] = { 0.06649, 0.1284697563, 0.111918249, 0.0873132676, 0.0610011113, 0.0381655709, 0.0213835661, 0.0107290241, 0.0048206869, 0.0019396469, 0.0006988718 };
                color *= sampleWeights[0];
                for(int i = 1; i < 11; ++i)
                {
                color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH + 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH + 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                }
                break;
            case 3:
                const float sampleOffsets[6] = { 0.0, 0.25, 0.50, 0.75, 1.00, 1.25 };
                const float sampleWeights[6] = { 0.15, 0.25, 0.135, 0.055, 0.0135, 0.0015 };
                color *= sampleWeights[0];
                for(int i = 1; i < 6; ++i)
                {
                color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH + 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                color += tex2Dlod(Copyright_Sampler_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * (GaussWeight * (GaussWeightH + 0.5)) * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
                }
                break;
        }
        color.rgb = (GaussColor.rgb);
        return color;
}

float4 PS_cLayerNGS_Gauss_V(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        const float3 SumUV = mul (mul (mul (mulUV, positionMatrix(0.5 + PosX_Gauss, 0.5 + PosY_Gauss)), rotateMatrix_Alt(0)), scaleMatrix(ScaleX_Gauss, ScaleY_Gauss));
        float4 color = tex2D(Copyright_Sampler, SumUV.rg + pivot.rg);
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
            case 3:
                const float sampleOffsets[6] = { 0.0, 0.25, 0.50, 0.75, 1.00, 1.25 };
                const float sampleWeights[6] = { 0.15, 0.25, 0.135, 0.055, 0.0135, 0.0015 };
                color *= sampleWeights[0];
                for(int i = 1; i < 6; ++i)
                {
                color += tex2Dlod(Copyright_Sampler_Gauss_H, float4(texCoord + float2(0.0, sampleOffsets[i] * (GaussWeight * (GaussWeightV + 0.5)) * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
                color += tex2Dlod(Copyright_Sampler_Gauss_H, float4(texCoord - float2(0.0, sampleOffsets[i] * (GaussWeight * (GaussWeightV + 0.5)) * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
                }
                break;
        }
        color.rgb = (GaussColor.rgb);
        return color;
}

float4 PS_cLayerNGS_CAb_Gauss_H(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        float4 color = tex2D(Copyright_Sampler_CAb_Gauss_V, texCoord);
        const float sampleOffsets[6] = { 0.0, 1.4584295168, 3.40398480678, 5.3518057801, 7.302940716, 9.2581597095 };
        const float sampleWeights[6] = { 0.13298, 0.23227575, 0.1353261595, 0.0511557427, 0.01253922, 0.0019913644 };
        color *= sampleWeights[0];
        for(int i = 1; i < 6; ++i)
        {
        color += tex2Dlod(Copyright_Sampler_CAb_Gauss_V, float4(texCoord + float2(sampleOffsets[i] * cLayerNGS_CAb_Blur * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
        color += tex2Dlod(Copyright_Sampler_CAb_Gauss_V, float4(texCoord - float2(sampleOffsets[i] * cLayerNGS_CAb_Blur * PIXEL_SIZE.x, 0.0), 0.0, 0.0)) * sampleWeights[i];
        }
        return color;
}

float4 PS_cLayerNGS_CAb_Gauss_V(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        const float3 SumUV = mul (mul (mul (mulUV, positionMatrix(0.5, 0.5)), rotateMatrix_Alt(0)), scaleMatrix(ScaleX, ScaleY));
        float4 color = tex2D(Copyright_Sampler, SumUV.rg + float2(0.5, 0.5));
        const float sampleOffsets[6] = { 0.0, 1.4584295168, 3.40398480678, 5.3518057801, 7.302940716, 9.2581597095 };
        const float sampleWeights[6] = { 0.13298, 0.23227575, 0.1353261595, 0.0511557427, 0.01253922, 0.0019913644 };
        color *= sampleWeights[0];
        for(int i = 1; i < 6; ++i)
        {
        color += tex2Dlod(Copyright_Sampler_CAb_Gauss_H, float4(texCoord + float2(0.0, sampleOffsets[i] * cLayerNGS_CAb_Blur * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
        color += tex2Dlod(Copyright_Sampler_CAb_Gauss_H, float4(texCoord - float2(0.0, sampleOffsets[i] * cLayerNGS_CAb_Blur * PIXEL_SIZE.y), 0.0, 0.0)) * sampleWeights[i];
        }
        return color;
}

float4 PS_cLayerNGS_CAb_A(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        const float2 CAb_Shift = cLayerNGS_CAb_Shift * 0.05;
        const float3 SumUV = mul (mul (mulUV, positionMatrix(0.5 + CAb_Shift.x, 0.5 + CAb_Shift.y)), scaleMatrix(1, 1));
        float4 color = tex2D(Copyright_Sampler_CAb_Gauss_H, SumUV.rg + pivot.rg) * all(SumUV.rg + pivot.rg == saturate(SumUV.rg + pivot.rg));
        color = float4(cLayerNGS_CAb_Color_A.r, cLayerNGS_CAb_Color_A.g, cLayerNGS_CAb_Color_A.b, color.a * cLayerNGS_CAb_Color_A.a);
        return color;
}

float4 PS_cLayerNGS_CAb_B(in float4 pos : SV_Position, in float2 texCoord : TEXCOORD) : COLOR  {

        const float2 CAb_Shift = cLayerNGS_CAb_Shift * 0.05;
        const float3 SumUV = mul (mul (mulUV, positionMatrix(0.5 - CAb_Shift.x, 0.5 - CAb_Shift.y)), scaleMatrix(1, 1));
        float4 color = tex2D(Copyright_Sampler_CAb_Gauss_H, SumUV.rg + pivot.rg) * all(SumUV.rg + pivot.rg == saturate(SumUV.rg + pivot.rg));
        color = float4(cLayerNGS_CAb_Color_B.r, cLayerNGS_CAb_Color_B.g, cLayerNGS_CAb_Color_B.b, color.a * cLayerNGS_CAb_Color_B.a);
        return color;
}

void PS_cLayerNGS(in float4 pos : SV_Position, float2 texCoord : TEXCOORD, out float4 passColor : SV_Target) {

    const float Depth = 0.999 - ReShade::GetLinearizedDepth(texCoord).x;
    float4 backColorOrig = tex2D(ReShade::BackBuffer, texCoord);
    if (Depth < cLayerNGS_Depth)
    {
        const float3 SumUV = mul (mul (mul (mulUV, positionMatrix(PosX, PosY)), rotateMatrix(cLayerNGS_Rotate)), scaleMatrix(ScaleX, ScaleY));
        const float3 SumUV_Gauss = mul (mul (mul (mulUV, positionMatrix(PosX, PosY)), rotateMatrix(cLayerNGS_Rotate)), scaleMatrix(AspectX, AspectY));
        float4 GaussOut = tex2D(Copyright_Sampler_Gauss_H, SumUV_Gauss.rg + pivot.rg);       
        const float3 SumUV_CAb = mul (mul (mul (mulUV, positionMatrix(PosX, PosY)), rotateMatrix(cLayerNGS_Rotate)), scaleMatrix(AspectX, AspectY));
        float4 CAb_A = tex2D(Copyright_Sampler_CAb_A, SumUV_CAb.rg + pivot.rg);
        float4 CAb_B = tex2D(Copyright_Sampler_CAb_B, SumUV_CAb.rg + pivot.rg);
        float4 DrawTex = tex2D(Copyright_Sampler, SumUV.rg + pivot.rg) * all(SumUV.rg + pivot.rg == saturate(SumUV.rg + pivot.rg));

        GaussOut.rgb = ComHeaders::Blending::Blend(cLayerNGS_BlendMode_Gauss, backColorOrig.rgb, GaussOut.rgb, GaussOut.a * Gauss_Blend);

        switch(cLayerNGS_BlendMode_CAb)
        {
            case 0:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Screen(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Screen(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 1:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::LinearDodge(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::LinearDodge(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 2:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Glow(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Glow(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 3:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::LinearLight(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::LinearLight(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 4:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::ColorB(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::ColorB(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 5:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::GrainMerge(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::GrainMerge(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 6:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Divide(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Divide(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 7:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::DivideAlt(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::DivideAlt(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 8:
                GaussOut = lerp(GaussOut.rgb, CAb_A.rgb, CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, CAb_B.rgb, CAb_B.a * cLayerNGS_CAb_Strength);
                break;
        }

        float4 ColorFactor = DrawTex;

        #if cLayerNGS_COLOR_OVERRIDE_COMBO == 1
            ColorFactor = saturate(DrawTex.rgb * ColorOverrideA.rgb);
        #elif cLayerNGS_COLOR_OVERRIDE_COMBO == 2
            ColorFactor = saturate(ColorFactor.rgb + ColorOverrideA.rgb);
        #elif cLayerNGS_COLOR_OVERRIDE_COMBO == 3
            ColorFactor = lerp(lerp(ColorOverrideB.rgb, ColorOverrideA.rgb, ColorFactor.rgb), ColorOverrideA.rgb, ColorFactor.rgb);
        #elif cLayerNGS_COLOR_OVERRIDE_COMBO == 4
            ColorFactor = ColorOverrideA.rgb;
        #endif

        float4 backColor = GaussOut;
        passColor = lerp(GaussOut, backColorOrig, DrawTex.a);

        passColor.rgb = ComHeaders::Blending::Blend(cLayerNGS_BlendMode_BG, backColor.rgb, passColor.rgb, DrawTex.a * cLayerNGS_Blend_BG);

        switch (cLayerNGS_BlendMode)
        {
            case 0:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Screen(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Screen(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 1:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::LinearDodge(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::LinearDodge(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 2:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Glow(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Glow(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 3:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::LinearLight(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::LinearLight(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 4:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::ColorB(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::ColorB(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 5:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::GrainMerge(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::GrainMerge(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 6:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Divide(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::Divide(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 7:
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::DivideAlt(GaussOut.rgb, CAb_A.rgb), CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, ComHeaders::Blending::DivideAlt(GaussOut.rgb, CAb_B.rgb), CAb_B.a * cLayerNGS_CAb_Strength);
                break;
            case 8:
                GaussOut = lerp(GaussOut.rgb, CAb_A.rgb, CAb_A.a * cLayerNGS_CAb_Strength);
                GaussOut = lerp(GaussOut.rgb, CAb_B.rgb, CAb_B.a * cLayerNGS_CAb_Strength);
                break;
        }

        float3 ColorFactorBlended;

        switch (cLayerNGS_BlendMode)
        {
            // Normal
            default:
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactor.rgb : ColorFactor.rgb, DrawTex.a * cLayerNGS_Blend);
                break;
            // Darken
            case 1:
                ColorFactorBlended = ComHeaders::Blending::Darken(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Multiply
            case 2:
                ColorFactorBlended = ComHeaders::Blending::Multiply(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Color Burn
            case 3:
                ColorFactorBlended = ComHeaders::Blending::ColorBurn(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Linear Burn
            case 4:
                ColorFactorBlended = ComHeaders::Blending::LinearBurn(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Lighten
            case 5:
                ColorFactorBlended = ComHeaders::Blending::Lighten(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Screen
            case 6:
                ColorFactorBlended = ComHeaders::Blending::Screen(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Color Dodge
            case 7:
                ColorFactorBlended = ComHeaders::Blending::ColorDodge(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Linear Dodge
            case 8:
                ColorFactorBlended = ComHeaders::Blending::LinearDodge(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Addition
            case 9:
                ColorFactorBlended = ComHeaders::Blending::Addition(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Glow
            case 10:
                ColorFactorBlended = ComHeaders::Blending::Glow(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Overlay
            case 11:
                ColorFactorBlended = ComHeaders::Blending::Overlay(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Soft Light
            case 12:
                ColorFactorBlended = ComHeaders::Blending::SoftLight(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Hard Light
            case 13:
                ColorFactorBlended = ComHeaders::Blending::HardLight(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Vivid Light
            case 14:
                ColorFactorBlended = ComHeaders::Blending::VividLight(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Linear Light
            case 15:
                ColorFactorBlended = ComHeaders::Blending::LinearLight(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Pin Light
            case 16:
                ColorFactorBlended = ComHeaders::Blending::PinLight(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Hard Mix
            case 17:
                ColorFactorBlended = ComHeaders::Blending::HardMix(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Difference
            case 18:
                ColorFactorBlended = ComHeaders::Blending::Difference(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Exclusion
            case 19:
                ColorFactorBlended = ComHeaders::Blending::Exclusion(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Subtract
            case 20:
                ColorFactorBlended = ComHeaders::Blending::Subtract(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Divide
            case 21:
                ColorFactorBlended = ComHeaders::Blending::Divide(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Divide (Alternative)
            case 22:
                ColorFactorBlended = ComHeaders::Blending::DivideAlt(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Divide (Photoshop)
            case 23:
                ColorFactorBlended = ComHeaders::Blending::DividePS(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Reflect
            case 24:
                ColorFactorBlended = ComHeaders::Blending::Reflect(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Grain Merge
            case 25:
                ColorFactorBlended = ComHeaders::Blending::GrainMerge(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Grain Extract
            case 26:
                ColorFactorBlended = ComHeaders::Blending::GrainExtract(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Hue
            case 27:
                ColorFactorBlended = ComHeaders::Blending::Hue(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Saturation
            case 28:
                ColorFactorBlended = ComHeaders::Blending::Saturation(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Color
            case 29:
                ColorFactorBlended = ComHeaders::Blending::ColorB(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
                break;
            // Luminosity
            case 30:
                ColorFactorBlended = ComHeaders::Blending::Luminosity(backColorOrig.rgb, ColorFactor.rgb);
                passColor = lerp(passColor.rgb, cLayerNGS_Color_Invert ? float3(1, 1, 1) - ColorFactorBlended : ColorFactorBlended, DrawTex.a * cLayerNGS_Blend);
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

technique Copyright_NGS< ui_label = "Copyright NGS"; >
{
    pass pass0
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayerNGS_Gauss_H;
        RenderTarget = Copyright_Texture_Gauss_H;
    }
    pass pass1
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayerNGS_Gauss_V;
        RenderTarget = Copyright_Texture_Gauss_Out;
    }

    pass pass2
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayerNGS_CAb_Gauss_H;
        RenderTarget = Copyright_Texture_CAb_Gauss_H;
    }
    pass pass3
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayerNGS_CAb_Gauss_V;
        RenderTarget = Copyright_Texture_CAb_Gauss_Out;
    }
    pass pass4
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayerNGS_CAb_A;
        RenderTarget = Copyright_Texture_CAb_A;
    }
    pass pass5
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayerNGS_CAb_B;
        RenderTarget = Copyright_Texture_CAb_B;
    }
    pass pass6
{
        VertexShader = PostProcessVS;
        PixelShader = PS_cLayerNGS;
    }
}
