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
               "Helvetica\0" \
               "Frutiger\0" \
               "Univers\0" \
               "Futura\0" \
               "Sophia DF 6\0" \
               "Sophia DF 6 Huge\0" \
               "Six Caps Rectangle\0" \ 
               "Futura 2\0" \
               "Kabel Heavy\0" \
               "Rockwell Nova\0" \
               "Poiret One\0" \
               "Poiret One Huge\0" \
               "Supermercado\0" \
               "Tango\0" \
               "Tango 2\0" \
               "Parisian 2\0" \
               "Broadway\0" \
               "Fifty Four DF 2\0" \
               "Kilogram 3\0" \
               "Kranky Large\0" \
               "Bauer Bodni\0" \
               "Bilbo Swash Caps\0" \
               "Bubbler One Rectangle\0" \
               "Baumans\0" \
               "Sophia DF 8\0" \
               "Stalin One\0" \
               "Imprompt Squad\0" \
               "-------------------------------------------------\0" \
               "Sophia DF 7\0" \
               "Futura NGS 2\0" \
               "Sophia DF NGS 9\0" \
               "Parisian NGS 6\0" \
               "Broadway NGS\0" \
               "Fifty Four DF NGS\0" \
               "Monoton NGS\0" \
               "Sophia DF NGS 4\0" \
               "Handel Gothic NGS 2\0" \
               "Meddon NGS\0" \
               "Mr De Haviland\0" \
               "Park Avenue\0" \
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

#if _Copyright_TextureNGS_Source == 0 // Helvetica
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_helvetica.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 430.0, 150.0

#elif _Copyright_TextureNGS_Source == 1 // Frutiger
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_frutiger.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 430.0, 150.0

#elif _Copyright_TextureNGS_Source == 2 // Univers
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_univers.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 430.0, 150.0

#elif _Copyright_TextureNGS_Source == 3 // Futura
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 430.0, 150.0

#elif _Copyright_TextureNGS_Source == 4 // Sophia DF 6
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_6.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 550.0, 250.0

#elif _Copyright_TextureNGS_Source == 5 // Sophia DF 6 Huge
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_6_huge.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1440.0, 600.0

#elif _Copyright_TextureNGS_Source == 6 // Six Caps Rectangle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_six_caps_rectangle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 260.0

#elif _Copyright_TextureNGS_Source == 7 // Futura 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 200.0

#elif _Copyright_TextureNGS_Source == 8 // Kabel Heavy
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_kabel(Geometric231)_heavy.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 240.0

#elif _Copyright_TextureNGS_Source == 9 // Rockwell Nova
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Rockwell_nova_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 130.0

#elif _Copyright_TextureNGS_Source == 10 // Poiret One
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Poiret_one.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 210.0

#elif _Copyright_TextureNGS_Source == 11 // Poiret One Huge
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Poiret_one_huge.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1440.0, 500.0

#elif _Copyright_TextureNGS_Source == 12 // Supermercado
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_supermercado.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 430.0, 200.0

#elif _Copyright_TextureNGS_Source == 13 // Tango
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_tango.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 200.0

#elif _Copyright_TextureNGS_Source == 14 // Tango 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_tango_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 300.0

#elif _Copyright_TextureNGS_Source == 15 // Parisian 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 200.0

#elif _Copyright_TextureNGS_Source == 16 // Broadway
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_broadway.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 350.0, 100.0

#elif _Copyright_TextureNGS_Source == 17 // Fifty Four DF 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_df_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 150.0

#elif _Copyright_TextureNGS_Source == 18 // Kilogram 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_kilogram_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 200.0

#elif _Copyright_TextureNGS_Source == 19 // Kranky Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Kranky_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 830.0, 340.0

#elif _Copyright_TextureNGS_Source == 20 // Bauer Bodni
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bauer_bodoni.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 250.0

#elif _Copyright_TextureNGS_Source == 21 // Bilbo Swash Caps
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bilbo_swash_caps.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 200.0

#elif _Copyright_TextureNGS_Source == 22 // Bubbler One Rectangle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bubbler_one_rectangle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 450

#elif _Copyright_TextureNGS_Source == 23 // Baumans
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_baumans.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 480.0

#elif _Copyright_TextureNGS_Source == 24 // Sophia DF 8
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_8.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 150.0

#elif _Copyright_TextureNGS_Source == 25 // Stalin One
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_stalin_one.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 200.0

#elif _Copyright_TextureNGS_Source == 26 // Imprompt Squad
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_impromptusquad.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 300.0

#elif _Copyright_TextureNGS_Source == 27 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 28 // Sophia DF 7
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_7.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 350.0

#elif _Copyright_TextureNGS_Source == 29 // Futura NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 400.0

#elif _Copyright_TextureNGS_Source == 30 // Sophia DF NGS 9
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_9.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 530.0

#elif _Copyright_TextureNGS_Source == 31 // Parisian NGS 6
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs_6.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 300.0

#elif _Copyright_TextureNGS_Source == 32 // Broadway NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_broadway_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 300.0

#elif _Copyright_TextureNGS_Source == 33 // Fifty Four DF NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_df_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 550.0, 300.0

#elif _Copyright_TextureNGS_Source == 34 // Monoton NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_monoton_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 370.0

#elif _Copyright_TextureNGS_Source == 35 // Sophia DF NGS 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 300.0

#elif _Copyright_TextureNGS_Source == 36 // Handel Gothic NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handelgothic_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900, 220.0

#elif _Copyright_TextureNGS_Source == 37 // Meddon NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_meddon_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 200.0

#elif _Copyright_TextureNGS_Source == 38 // Mr De Haviland
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_mr_de_haviland.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 250.0

#elif _Copyright_TextureNGS_Source == 39 // Park Avenue
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parkavenue.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 200.0

#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 435.0, 31.0
#endif
