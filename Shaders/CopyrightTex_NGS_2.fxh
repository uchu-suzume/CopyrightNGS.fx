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
               "Eurostile Left\0" \
               "Eurostile Right\0" \
               "Eurostile Center\0" \
               "Eurostile Left NGS\0" \
               "Eurostile Right NGS\0" \
               "Eurostile Center NGS\0" \
               "Eurostile Center NGS 2\0" \
               "Futura Light NGS\0" \
               "Futura Light NGS 2\0" \
               "Mont Serrat Rectangle NGS A\0" \
               "Mont Serrat Rectangle NGS B\0" \
               "Sophia DF NGS\0" \
               "Sophia DF NGS 8\0" \
               "Sophia DF NGS 10\0" \
               "Sophia DF NGS 11\0" \
               "Fifty Four DF NGS 3\0" \
               "-------------------------------------------------\0" \
               "Sophia DF 2 Large\0" \
               "Handel Gothic 3\0" \
               "Handel Gothic NGS 2\0" \
               "Helvetica NGS\0" \
               "Sophia DF 3\0" \
               "Sophia DF NGS 2\0" \
               "Blippo NGS 4\0" \
               "Bernhard Fashion NGS\0" \
               "Neuzeit Grotesk\0" \
               "Frutiger XCN\0" \
               "Futura Center\0" \
               "Futura Center NGS\0" \
               "Sophia DF 4\0" \
               "Parisian NGS\0" \
               "Neuzeit Grotesk NGS\0" \
               "Sophia DF NGS 2\0" \
               "Parisian NGS 2\0" \
               "Blippo NGS\0" \
               "Blippo NGS 2\0" \
               "Blippo NGS 3\0" \
               "-------------------------------------------------\0" \
               "Century Rectangle\0" \
               "Sophia DF 5\0" \
               "Krona One\0" \
               "Krona One NGS\0" \
               "Voltaire NGS Rectangle\0" \
               "Empire\0" \
               "Poster Bodoni NGS\0" \
               "Mouse Memories\0" \
               "Swanky and Moo Moo\0" \
               "Architects Daughter NGS\0" \
               "Staccato555 A\0" \
               "Staccato555 B\0" \
               "Lato Cutout\0" \
               "Lato Cutout NGS\0" \
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

#if _Copyright_TextureNGS_Source == 0 // Eurostile Left
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_left.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 250.0

#elif _Copyright_TextureNGS_Source == 1 // Eurostile Right
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_right.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 250.0

#elif _Copyright_TextureNGS_Source == 2 // Eurostile Center
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_center.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 250.0

#elif _Copyright_TextureNGS_Source == 3 // Eurostile Left NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_left_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 220.0

#elif _Copyright_TextureNGS_Source == 4 // Eurostile Right NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_right_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 220.0

#elif _Copyright_TextureNGS_Source == 5 // Eurostile Center NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_center_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 220.0

#elif _Copyright_TextureNGS_Source == 6 // Eurostile Center NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_center_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 220.0

#elif _Copyright_TextureNGS_Source == 7 // Futura Light NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_light_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 220.0

#elif _Copyright_TextureNGS_Source == 8 // Futura Light NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_light_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 220.0

#elif _Copyright_TextureNGS_Source == 9 // Montserrat Rectangle NGS A
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_montserrat_rectangle_ngs_a.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 180.0

#elif _Copyright_TextureNGS_Source == 10 // Montserrat Rectangle NGS B
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_montserrat_rectangle_ngs_b.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 240.0

#elif _Copyright_TextureNGS_Source == 11 // Sophia DF NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 300.0

#elif _Copyright_TextureNGS_Source == 12 // Sophia DF NGS 8
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_8.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 350.0

#elif _Copyright_TextureNGS_Source == 13 // Sophia DF NGS 10
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_10.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1800.0, 500.0

#elif _Copyright_TextureNGS_Source == 14 // Sophia DF NGS 11
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_11.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1800.0, 400.0

#elif _Copyright_TextureNGS_Source == 15 // Fifty Four DF NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_df_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1800.0, 450.0

#elif _Copyright_TextureNGS_Source == 16 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 17 // Sophia DF 2 Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_2_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 2000.0, 250.0

#elif _Copyright_TextureNGS_Source == 18 // Handel Gothic 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handel_gothic_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000, 300.0

#elif _Copyright_TextureNGS_Source == 19 // Handel Gothic NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handel_gothic_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000, 220.0

#elif _Copyright_TextureNGS_Source == 20 // Helvetica NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_helvetica_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 340.0

#elif _Copyright_TextureNGS_Source == 21 // Sophia DF 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 350.0

#elif _Copyright_TextureNGS_Source == 22 // Sophia DF NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 400.0

#elif _Copyright_TextureNGS_Source == 23 // Blippo NGS 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 400.0

#elif _Copyright_TextureNGS_Source == 24 // Bernhard Fashion NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bernhard_fashion_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 450.0

#elif _Copyright_TextureNGS_Source == 25 // Neuzeit Grotesk
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_neuzeit_grotesk.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 780.0, 350.0

#elif _Copyright_TextureNGS_Source == 26 // Frutiger XCN
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_frutiger_xcn_rectangle_a.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600, 250.0

#elif _Copyright_TextureNGS_Source == 27 // Futura Center
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_center_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 200.0

#elif _Copyright_TextureNGS_Source == 28 // Futura Center NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_center_large_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 200.0

#elif _Copyright_TextureNGS_Source == 29 // Sophia DF 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 300.0

#elif _Copyright_TextureNGS_Source == 30 // Parisian NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 250.0

#elif _Copyright_TextureNGS_Source == 31 // Neuzeit Grotesk NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_neuzeit_grotesk_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 250.0

#elif _Copyright_TextureNGS_Source == 32 // Sophia DF NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 300.0

#elif _Copyright_TextureNGS_Source == 33 // Parisian NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 200.0

#elif _Copyright_TextureNGS_Source == 34 // Blippo NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 250.0

#elif _Copyright_TextureNGS_Source == 35 // Blippo NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 200.0

#elif _Copyright_TextureNGS_Source == 36 // Blippo NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 150.0

#elif _Copyright_TextureNGS_Source == 37 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 38 // Century Rectangle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_century_rectangle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 250.0

#elif _Copyright_TextureNGS_Source == 39 // Sophia DF 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 400.0

#elif _Copyright_TextureNGS_Source == 40 // Krona One
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_krona_one.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 300.0

#elif _Copyright_TextureNGS_Source == 41 // Krona One NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_krona_one_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 350.0

#elif _Copyright_TextureNGS_Source == 42 // Voltaire NGS Rectangle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_voltaire_ngs_rectangle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 300.0

#elif _Copyright_TextureNGS_Source == 43 // Empire
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_empire.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 500.0

#elif _Copyright_TextureNGS_Source == 44 // Poster Bodoni NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_poster_bodoni_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 160.0

#elif _Copyright_TextureNGS_Source == 45 // Mouse Memories
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_mouse_memories.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 300.0

#elif _Copyright_TextureNGS_Source == 46 // Swanky and Moo Moo
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_swanky_and_moo_moo.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 150.0

#elif _Copyright_TextureNGS_Source == 47 // Architects Daughter NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_architects_daughter_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 250.0

#elif _Copyright_TextureNGS_Source == 48 // Staccato555 A
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_staccato555_a.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 820.0, 350.0

#elif _Copyright_TextureNGS_Source == 49 // Staccato555 B
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_staccato555_b.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 870.0, 320.0

#elif _Copyright_TextureNGS_Source == 50 // Lato Cutout
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_lato_cutout.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 180.0

#elif _Copyright_TextureNGS_Source == 51 // Lato Cutout NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_lato_cutout_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 620.0, 200.0

#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 435.0, 31.0
#endif
