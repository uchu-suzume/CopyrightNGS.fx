/*------------------.
| :: Description :: |
'-------------------/

    Texture Header (version 0.1)

    Authors: originalnicodr, prod80, uchu suzume, Marot Satil

    About:
    Provides a variety of blending methods for you to use as you wish. Just include this header.

    History:
    (*) Feature (+) Improvement (x) Bugfix (-) Information (!) Compatibility
    
    Version 0.1 by Marot Satil & uchu suzume
    + Divided into corresponding lists for each game.
    * Added warning message when specified Non-existing source reference numbers.
    x Fixed incorrect specification of PSO2 logo in ui_item and Texture Definition. 

    Version 0.2 by Marot Satil & uchu suzume
    + Added "else" in _Copyright_Texture_Source list to avoid errors when switching *Tex.fxh.    
*/

// -------------------------------------
// Texture Macros
// -------------------------------------

#define TEXTURE_COMBO(variable, name_label, description) \
uniform int variable \
< \
    ui_items = \
               "Vapor Pixel\0" \
               "Mechanical Sans Serif\0" \
               "Mechanical Sans Serif 2\0" \
               "Toy Writer Marker NGS\0" \
               "Toy Writer Marker NGS 2\0" \
               "Toy Writer Marker NGS 3\0" \
               "Toy Writer Marker NGS 4\0" \
               "Flamingo Serif\0" \
               "Flamingo Serif 2\0" \
               "Vapor Pixel 2\0" \
               "Ligaturerian\0" \
               "Ligaturerian 2\0" \
               "Ligaturerian 3\0" \
               "Ligaturerian 4\0" \
               "Atlantic Future\0" \
               "Atlantic Future 2\0" \
               "Square Stencil\0" \
               "Tactical Digit\0" \
               "Tactical Digit 2\0" \
               "Tactical Digit 3\0" \
               "Tactical Digit 4\0" \
               "Brick Text Logo\0" \
               "Brick Text Logo 2\0" \
               "Brick Text Logo 3\0" \
               "Brick Text Logo 4\0" \
               "Brick Text Logo 5\0" \
               "Brick Text Logo 6\0" \
               "Brick Text Logo 7\0" \               
               "Chocolate Note\0" \ 
               "Fifty Four 3\0" \
               "Fifty Four NGS 2\0" \              
               ; \
    ui_bind = "_Copyright_TextureNGS_Source"; \
    ui_label = name_label; \
    ui_tooltip = description; \
    ui_spacing = 1; \
    ui_type = "combo"; \
> = 0;
/* Set default value(see above) by source code if the preset has not modified yet this variable/definition */
#ifndef cLayer_TextureNGS_Source
#define cLayer_TextureNGS_Source 0
#warning "Non-existing source reference numbers specified. Try selecting the logo texture at the top and then reload."
#endif

// -------------------------------------
// Texture Definition
// -------------------------------------

// (?<=Source == )[\d][\S+]{0,999} Regular expression for renumbering.

#if _Copyright_TextureNGS_Source == 0 // Vapor Pixel
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_vapor_pixel_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 400.0

#elif _Copyright_TextureNGS_Source == 1 // Mechanical Sans Serif
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_mechanicalsansserif.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 150.0

#elif _Copyright_TextureNGS_Source == 2 // Mechanical Sans Serif 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_mechanicalsansserif_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 300.0

#elif _Copyright_TextureNGS_Source == 3 // Toy Writer Marker NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_toywritermarker_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 560.0

#elif _Copyright_TextureNGS_Source == 4 // Toy Writer Marker NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_toywritermarker_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 350.0

#elif _Copyright_TextureNGS_Source == 5 // Toy Writer Marker NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_toywritermarker_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 750.0

#elif _Copyright_TextureNGS_Source == 6 // Toy Writer Marker NGS 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_toywritermarker_ngs_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 750.0

#elif _Copyright_TextureNGS_Source == 7 // Flamingo Serif
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_flamingoserif_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 300.0

#elif _Copyright_TextureNGS_Source == 8 // Flamingo Serif 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_flamingoserif_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 600.0

#elif _Copyright_TextureNGS_Source == 9 // Vapor Pixel 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_vapor_pixel_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 500.0

#elif _Copyright_TextureNGS_Source == 10 // Ligaturerian
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_ligaturerian.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 300.0

#elif _Copyright_TextureNGS_Source == 11 // Ligaturerian 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_ligaturerian_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 420.0

#elif _Copyright_TextureNGS_Source == 12 // Ligaturerian 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_ligaturerian_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 500.0

#elif _Copyright_TextureNGS_Source == 13 // Ligaturerian 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_ligaturerian_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 450.0

#elif _Copyright_TextureNGS_Source == 14 // Atlantic Future
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_atlanticfuture.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 400.0

#elif _Copyright_TextureNGS_Source == 15 // Atlantic Future 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_atlanticfuture_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 500.0

#elif _Copyright_TextureNGS_Source == 16 // Square Stencil
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_squarestencil.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 600.0

#elif _Copyright_TextureNGS_Source == 17 // Tactical Digit
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_tacticaldigit.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 200.0

#elif _Copyright_TextureNGS_Source == 18 // Tactical Digit 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_tacticaldigit_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 150.0

#elif _Copyright_TextureNGS_Source == 19 // Tactical Digit 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_tacticaldigit_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 800.0

#elif _Copyright_TextureNGS_Source == 20 // Tactical Digit 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_tacticaldigit_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 600.0

#elif _Copyright_TextureNGS_Source == 21 // Brick Text Logo
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bricktextlogo.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 350.0

#elif _Copyright_TextureNGS_Source == 22 // Brick Text Logo 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bricktextlogo_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 350.0

#elif _Copyright_TextureNGS_Source == 23 // Brick Text Logo 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bricktextlogo_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 600.0

#elif _Copyright_TextureNGS_Source == 24 // Brick Text Logo 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bricktextlogo_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 600.0

#elif _Copyright_TextureNGS_Source == 25 // Brick Text Logo 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bricktextlogo_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 450.0

#elif _Copyright_TextureNGS_Source == 26 // Brick Text Logo 6
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bricktextlogo_6.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 300.0

#elif _Copyright_TextureNGS_Source == 27 // Brick Text Logo 7
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bricktextlogo_7.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 300.0

#elif _Copyright_TextureNGS_Source == 28 // Chocolate Note
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_chocolatenote.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 650.0

#elif _Copyright_TextureNGS_Source == 29 // Fifty Four 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 250.0

#elif _Copyright_TextureNGS_Source == 30 // Fifty Four NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 400.0

#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 435.0, 31.0
#endif
