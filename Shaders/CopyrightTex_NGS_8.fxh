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
               "ARKS\0" \
               "Averta ARKS\0" \
               "Aurora\0" \
               "C.U.C.I.\0" \
               "Gatefold\0" \
               "Grandmaster\0" \
               "Grandmaster 2\0" \
               "Grandmaster 3\0" \
               "Grandmaster 4\0" \
               "Grandmaster 5\0" \
               "Grandmaster ARKS\0" \
               "Huxley\0" \
               "Huxley 2\0" \
               "Midnight Sun CUCI\0" \
               "Neue Droschke\0" \
               "Neue Droschke 2\0" \
               "Pyxis\0" \
               "Pyxis 2\0" \
               "Pyxis 3\0" \
               "Rachel DF\0" \
               "Rachel DF 2\0" \
               "Shotgun\0" \
               "Shotgun 2\0" \
               "Sophia DF\0" \
               "Sophia DF 2\0" \
               "Sophia DF 3\0" \
               "Super Bodoni\0" \
               "Super\0" \
               "Trapezoid Demon\0" \
               "Bad Cat Planet\0" \
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
//#warning "Non-existing source reference numbers specified. Try selecting the logo texture at the top and then reload."
#endif

// -------------------------------------
// Texture Definition
// -------------------------------------

// (?<=Source == )[\d][\S+]{0,999} Regular expression for renumbering.

#if _Copyright_TextureNGS_Source == 0 // ARKS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_arks_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1600.0, 800.0

#elif _Copyright_TextureNGS_Source == 1 // Averta ARKS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_averta_arks_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1700.0, 750.0

#elif _Copyright_TextureNGS_Source == 2 // Aurora
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_aurora_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 750.0

#elif _Copyright_TextureNGS_Source == 3 // C.U.C.I.
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_cuci_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 550.0

#elif _Copyright_TextureNGS_Source == 4 // Gatefold
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_gatefold_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 600.0

#elif _Copyright_TextureNGS_Source == 5 // Grandmaster
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_grandmaster_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1650.0, 600.0

#elif _Copyright_TextureNGS_Source == 6 // Grandmaster 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_grandmaster_vertical_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 500.0

#elif _Copyright_TextureNGS_Source == 7 // Grandmaster 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_grandmaster_vertical_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 450.0

#elif _Copyright_TextureNGS_Source == 8 // Grandmaster 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_grandmaster_vertical_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 2000.0, 500.0

#elif _Copyright_TextureNGS_Source == 9 // Grandmaster 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_grandmaster_vertical_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1600.0, 650.0

#elif _Copyright_TextureNGS_Source == 10 // Grandmaster ARKS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_grandmaster_arks_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1800.0, 600.0

#elif _Copyright_TextureNGS_Source == 11 // Huxley
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_huxley_vertical_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1700.0, 700.0

#elif _Copyright_TextureNGS_Source == 12 // Huxley 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_huxley_vertical_vertical_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1800.0, 700.0

#elif _Copyright_TextureNGS_Source == 13 // Midnight Sun CUCI
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_midnight_sun_df_cuci_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1600.0, 700.0

#elif _Copyright_TextureNGS_Source == 14 // Neue Droschke
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_neue_droschke_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1900.0, 700.0

#elif _Copyright_TextureNGS_Source == 15 // Neue Droschke 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_neue_droschke_vertical_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1750.0, 750.0

#elif _Copyright_TextureNGS_Source == 16 // Pyxis
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_pyxis_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 800.0

#elif _Copyright_TextureNGS_Source == 17 // Pyxis 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_pyxis_vertical_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 1000.0

#elif _Copyright_TextureNGS_Source == 18 // Pyxis 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_pyxis_vertical_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1600.0, 850.0

#elif _Copyright_TextureNGS_Source == 19 // Rachel DF
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1600.0, 850.0

#elif _Copyright_TextureNGS_Source == 20 // Rachel DF 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_vertical_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 800.0

#elif _Copyright_TextureNGS_Source == 21 // Shotgun
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_shotgun_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 950.0

#elif _Copyright_TextureNGS_Source == 22 // Shotgun 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_shotgun_vertical_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 1000.0

#elif _Copyright_TextureNGS_Source == 23 // Sophia DF
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 2100.0, 800.0

#elif _Copyright_TextureNGS_Source == 24 // Sophia DF 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_vertical_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 900.0

#elif _Copyright_TextureNGS_Source == 25 // Sophia DF 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_vertical_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1600.0, 750.0

#elif _Copyright_TextureNGS_Source == 26 // Super Bodoni
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 1050.0

#elif _Copyright_TextureNGS_Source == 27 // Super
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 950.0

#elif _Copyright_TextureNGS_Source == 28 // Trapezoid Demon
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_trapezoid_demon_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 750.0

#elif _Copyright_TextureNGS_Source == 29 // Bad Cat Planet
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bad_cat_planet_vertical.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1600.0, 600.0

#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bird_face_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 400.0
#endif
