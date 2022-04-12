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
               "Futura Tri\0" \
               "Futura Tri NGS\0" \
               "Futura Tri NGS HV\0" \
               "Sophia DF Tri\0" \
               "Helvetica Square\0" \
               "Handel Gothic\0" \
               "Handel Gothic NGS 5\0" \
               "Alfa Slab One\0" \
               "Handel Gothic 2\0" \
               "Handel Gothic NGS 4\0" \
               "Peignot NGS 2\0" \
               "Sophia DF NGS 5\0" \
               "Peignot NGS\0" \
               "Parisian NGS 3\0" \
               "Rockwell Nova NGS\0" \  
               "Parisian NGS 7\0" \
               "Futura NGS\0" \
               "Sophia DF NGS 6\0" \
               "Kilogram\0" \
               "Kilogram 2\0" \
               "Fifty Four DF NGS 2\0" \
               "Parisian NGS 4\0" \
               "Parisian NGS 5\0" \
               "Bernhard Fashion NGS 2\0" \
               "Park Avenue 2\0" \
               "Shelley Script\0" \
               "Tango NGS\0" \
               "Poppins\0" \
               "Bank Gothic\0" \
               "PSO2 Flat Logo\0" \
               "CollageAL NGS\0" \
               "-------------------------------------------------\0" \
               "Righteous\0" \
               "Tango NGS 2\0" \
               "Rock Salt Rectangle\0" \
               "Bernhard Fashion\0" \
               "Uzu Kaku\0" \
               "Erica One NGS A\0" \
               "Erica One NGS B\0" \
               "Sophia DF 11\0" \
               "Sophia DF 12\0" \
               "Sophia DF 13\0" \
               "Peignot Square\0" \
               "Fifty Four DF 3\0" \
               "Sophia DF 10\0" \
               "Sophia DF 9\0" \
               "Sophia DF 7\0" \
               "Lucida Console\0" \
               "Wire One\0" \
               "Wire One NGS\0" \
               "Maximus NGS\0" \
               "Sophia DF 14\0" \
               "Sophia DF 15\0" \
               "-------------------------------------------------\0" \
               "Yanone Kaffeesatz Square\0" \
               "Yanone Kaffeesatz Square 2\0" \
               "Frutiger Square NGS\0" \
               "Frutiger Square NGS 2\0" \
               "Gill Sans Ultra Bold Square NGS\0" \
               "Gill Sans Ultra Bold Square NGS 2\0" \
               "Megrim Square NGS\0" \
               "Blippo NGS Square\0" \
               "Blippo NGS Square 2\0" \
               ; \
    ui_bind = "_Copyright_TextureNGS_Source"; \
    ui_label = name_label; \
    ui_tooltip = description; \
    ui_spacing = 1; \
    ui_type = "combo"; \
> = 0;
/* Set default value(see above) by source code if the preset has not modified yet this variable/definition */
#ifndef cLayer_Texture_Source
#define cLayer_Texture_Source 0
#warning "Non-existing source reference numbers specified. Try selecting the logo texture at the top and then reload."
#endif

// -------------------------------------
// Texture Definition
// -------------------------------------

// (?<=Source == )[\d][\S+]{0,999} Regular expression for renumbering.

#if _Copyright_TextureNGS_Source == 0 // Futura Tri
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_tri.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 329.0, 432.0

#elif _Copyright_TextureNGS_Source == 1 // Futura Tri NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_tri_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 330.0, 430.0

#elif _Copyright_TextureNGS_Source == 2 // Futura Tri NGS HV
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_tri_ngs_hv.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 330.0, 460.0

#elif _Copyright_TextureNGS_Source == 3 // Sophia DF Tri
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_tri.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 330.0, 460.0

#elif _Copyright_TextureNGS_Source == 4 // Helvetica Square
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Helvetica(Swis721)_square.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 360.0, 400.0

#elif _Copyright_TextureNGS_Source == 5 // Handel Gothic
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handelgothic.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 350.0, 430.0

#elif _Copyright_TextureNGS_Source == 6 // Handel Gothic NGS 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handelgothic_ngs_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 800.0

#elif _Copyright_TextureNGS_Source == 7 // Alfa Slab One
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_alfa_slab_one.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 500.0

#elif _Copyright_TextureNGS_Source == 8 // Handel Gothic 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handelgothic_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 550.0

#elif _Copyright_TextureNGS_Source == 9 // Handel Gothic NGS 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handelgothic_ngs_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 550.0

#elif _Copyright_TextureNGS_Source == 10 // Peignot NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_peignot_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 700.0

#elif _Copyright_TextureNGS_Source == 11 // Sophia DF NGS 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 450.0

#elif _Copyright_TextureNGS_Source == 12 // Peignot NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_peignot_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 500.0

#elif _Copyright_TextureNGS_Source == 13 // Parisian NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 400.0

#elif _Copyright_TextureNGS_Source == 14 // Rockwell Nova NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rockwell_nova_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 550.0

#elif _Copyright_TextureNGS_Source == 15 // Parisian NGS 7
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs_7.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 400.0

#elif _Copyright_TextureNGS_Source == 16 // Futura NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 480.0

#elif _Copyright_TextureNGS_Source == 17 // Sophia DF NGS 6
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_6.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 450.0

#elif _Copyright_TextureNGS_Source == 18 // Kilogram
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_kilogram.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 400.0

#elif _Copyright_TextureNGS_Source == 19 // Kilogram 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_kilogram_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 400.0

#elif _Copyright_TextureNGS_Source == 20 // Fifty Four DF NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_df_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 400.0

#elif _Copyright_TextureNGS_Source == 21 // Parisian NGS 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 550.0

#elif _Copyright_TextureNGS_Source == 22 // Parisian NGS 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 400.0

#elif _Copyright_TextureNGS_Source == 23 // Bernhard Fashion NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bernhard_fashion_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 450.0

#elif _Copyright_TextureNGS_Source == 24 // Park Avenue 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parkavenue_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 530.0

#elif _Copyright_TextureNGS_Source == 25 // Shelley Script
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_shelley_script_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 400.0

#elif _Copyright_TextureNGS_Source == 26 // Tango NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_tango_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 200.0

#elif _Copyright_TextureNGS_Source == 27 // Poppins
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_poppins.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 200.0

#elif _Copyright_TextureNGS_Source == 28 // Bank Gothic
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bankgothic.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 300.0

#elif _Copyright_TextureNGS_Source == 29 // PSO2 Flat Logo
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_flat_logo.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 400.0

#elif _Copyright_TextureNGS_Source == 30 // CollageAL NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_collage_al_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 360.0, 250.0

#elif _Copyright_TextureNGS_Source == 31 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 32 // Righteous
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_righteous.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 550.0, 300.0

#elif _Copyright_TextureNGS_Source == 33 // Tango NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_tango_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 350.0

#elif _Copyright_TextureNGS_Source == 34 // Rock Salt Rectangle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rock_salt_rectangle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 300.0

#elif _Copyright_TextureNGS_Source == 35 // Bernhard Fashion
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bernhard_fashion.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 400.0

#elif _Copyright_TextureNGS_Source == 36 // Uzu Kaku NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_uzu_kaku_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 400.0

#elif _Copyright_TextureNGS_Source == 37 // Erica One NGS A
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_erica_one_ngs_a.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 450.0

#elif _Copyright_TextureNGS_Source == 38 // Erica One NGS B
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_erica_one_ngs_b.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 550.0

#elif _Copyright_TextureNGS_Source == 39 // Sophia DF 11
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_11.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 250.0

#elif _Copyright_TextureNGS_Source == 40 // Sophia DF 12
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_12.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 600.0

#elif _Copyright_TextureNGS_Source == 41 // Sophia DF 13
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_13.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 600.0

#elif _Copyright_TextureNGS_Source == 42 // Peignot Square
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_peignot_square.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 750.0

#elif _Copyright_TextureNGS_Source == 43 // Fifty Four DF 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_df_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 250.0

#elif _Copyright_TextureNGS_Source == 44 // Sophia DF 10
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_10.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 400.0

#elif _Copyright_TextureNGS_Source == 45 // Sophia DF 9
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_9.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 500.0

#elif _Copyright_TextureNGS_Source == 46 // Sophia DF NGS 7
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_7.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1200.0, 550.0

#elif _Copyright_TextureNGS_Source == 47 // Lucida Console
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_lucida_console.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 350.0

#elif _Copyright_TextureNGS_Source == 48 // Wire One
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_wire_one.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 500.0

#elif _Copyright_TextureNGS_Source == 49 // Wire One NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_wire_one_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 500.0

#elif _Copyright_TextureNGS_Source == 50 // Maximus NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_maximus_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 500.0

#elif _Copyright_TextureNGS_Source == 51 // Sophia DF 14
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_14.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 700.0

#elif _Copyright_TextureNGS_Source == 52 // Sophia DF 15
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_15.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 700.0

#elif _Copyright_TextureNGS_Source == 53 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 54 // Yanone Kaffeesatz Square
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_yanone_kaffeesatz_square.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 300.0, 300.0

#elif _Copyright_TextureNGS_Source == 55 // Yanone Kaffeesatz Square 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_yanone_kaffeesatz_square_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 300.0, 300.0

#elif _Copyright_TextureNGS_Source == 56 // Frutiger Square NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_frutiger_square_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 400.0

#elif _Copyright_TextureNGS_Source == 57 // Frutiger Square NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_frutiger_square_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 400.0

#elif _Copyright_TextureNGS_Source == 58 // Gill Sans Ultra Bold Square NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_gill_sans_ultra_bold_square_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 400.0

#elif _Copyright_TextureNGS_Source == 59 // Gill Sans Ultra Bold Square NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_gill_sans_ultra_bold_square_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 400.0

#elif _Copyright_TextureNGS_Source == 60 // Megrim Square NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_megrim_square_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 400.0

#elif _Copyright_TextureNGS_Source == 61 // Blippo NGS Square
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs_square.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 400.0

#elif _Copyright_TextureNGS_Source == 62 // Blippo NGS Square 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs_square_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 350.0, 350.0

#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 435.0, 31.0
#endif
