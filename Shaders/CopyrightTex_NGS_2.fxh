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
               "Eurostyle Left\0" \
               "Eurostyle Right\0" \
               "Eurostyle Center\0" \
               "Eurostyle Left NGS\0" \
               "Eurostyle Right NGS\0" \
               "Eurostyle Center NGS\0" \
               "Futura Light NGS\0" \
               "Futura Light NGS 2\0" \
               "Mont Serrat Rectangle NGS A\0" \
               "Mont Serrat Rectangle NGS B\0" \
               "Sophia DF NGS\0" \
               "Sophia DF NGS 8\0" \
               "Sophia DF NGS 16\0" \
               "Sophia DF NGS 17\0" \
               "Fifty Four DF NGS 3\0" \
               "-------------------------------------------------\0" \
               "Sophia DF 2 Large\0" \
               "Handel Gothic NGS\0" \
               "Handel Gothic NGS 3\0" \
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

#if _Copyright_TextureNGS_Source == 0 // Eurostyle Left
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Eurostyle(Square721)_left.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 183.0

#elif _Copyright_TextureNGS_Source == 1 // Eurostyle Right
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Eurostyle(Square721)_right.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 183.0

#elif _Copyright_TextureNGS_Source == 2 // Eurostyle Center
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Eurostyle(Square721)_center.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 183.0

#elif _Copyright_TextureNGS_Source == 3 // Eurostyle Left  NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Eurostyle(Square721)_left_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 220.0

#elif _Copyright_TextureNGS_Source == 4 // Eurostyle Right  NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Eurostyle(Square721)_right_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 220.0

#elif _Copyright_TextureNGS_Source == 5 // Eurostyle Center  NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Eurostyle(Square721)_center_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 220.0

#elif _Copyright_TextureNGS_Source == 6 // Futura Light NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_light_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 220.0

#elif _Copyright_TextureNGS_Source == 7 // Futura Light NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_light_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 220.0

#elif _Copyright_TextureNGS_Source == 8 // Montserrat Rectangle NGS A
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_montserrat_rectangle_ngs_a.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 180.0

#elif _Copyright_TextureNGS_Source == 9 // Montserrat Rectangle NGS B
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_montserrat_rectangle_ngs_b.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 240.0

#elif _Copyright_TextureNGS_Source == 10 // Sophia DF NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 300.0

#elif _Copyright_TextureNGS_Source == 11 // Sophia DF NGS 8
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_8.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1100.0, 350.0

#elif _Copyright_TextureNGS_Source == 12 // Sophia DF NGS 16
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_16.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1800.0, 500.0

#elif _Copyright_TextureNGS_Source == 13 // Sophia DF NGS 17
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_17.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1800.0, 400.0

#elif _Copyright_TextureNGS_Source == 14 // Fifty Four DF NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_df_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1800.0, 450.0

#elif _Copyright_TextureNGS_Source == 15 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 16 // Sophia DF 2 Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_2_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 2000.0, 250.0

#elif _Copyright_TextureNGS_Source == 17 // Handel Gothic NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handelgothic_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900, 270.0

#elif _Copyright_TextureNGS_Source == 18 // Handel Gothic NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_handelgothic_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000, 220.0

#elif _Copyright_TextureNGS_Source == 19 // Helvetica NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_helvetica_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 340.0

#elif _Copyright_TextureNGS_Source == 20 // Sophia DF 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 350.0

#elif _Copyright_TextureNGS_Source == 21 // Sophia DF NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 400.0

#elif _Copyright_TextureNGS_Source == 22 // Blippo NGS 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 400.0

#elif _Copyright_TextureNGS_Source == 23 // Bernhard Fashion NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bernhard_fashion_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 450.0

#elif _Copyright_TextureNGS_Source == 24 // Neuzeit Grotesk
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_neuzeit_grotesk.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 780.0, 350.0

#elif _Copyright_TextureNGS_Source == 25 // Frutiger XCN
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_frutiger_xcn_rectangle_a.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600, 250.0

#elif _Copyright_TextureNGS_Source == 26 // Futura Center
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_center_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 190.0

#elif _Copyright_TextureNGS_Source == 27 // Futura Center NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_futura_center_large_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 190.0

#elif _Copyright_TextureNGS_Source == 28 // Sophia DF 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 300.0

#elif _Copyright_TextureNGS_Source == 29 // Parisian NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 250.0

#elif _Copyright_TextureNGS_Source == 30 // Neuzeit Grotesk NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_neuzeit_grotesk_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 250.0

#elif _Copyright_TextureNGS_Source == 31 // Sophia DF NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 300.0

#elif _Copyright_TextureNGS_Source == 32 // Parisian NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 200.0

#elif _Copyright_TextureNGS_Source == 33 // Blippo NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 250.0

#elif _Copyright_TextureNGS_Source == 34 // Blippo NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 200.0

#elif _Copyright_TextureNGS_Source == 35 // Blippo NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_blippo_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 150.0

#elif _Copyright_TextureNGS_Source == 36 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 37 // Century Rectangle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_century_rectangle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 250.0

#elif _Copyright_TextureNGS_Source == 38 // Sophia DF 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 400.0

#elif _Copyright_TextureNGS_Source == 39 // Krona One
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_krona_one.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 300.0

#elif _Copyright_TextureNGS_Source == 40 // Krona One NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_krona_one_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 340.0

#elif _Copyright_TextureNGS_Source == 41 // Voltaire NGS Rectangle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_voltaire_ngs_rectangle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 300.0

#elif _Copyright_TextureNGS_Source == 42 // Empire
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_empire.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 500.0

#elif _Copyright_TextureNGS_Source == 43 // Poster Bodoni NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_poster_bodoni_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 160.0

#elif _Copyright_TextureNGS_Source == 44 // Mouse Memories
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_mouse_memories.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 660.0, 240.0

#elif _Copyright_TextureNGS_Source == 45 // Swanky and Moo Moo
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_swanky_and_moo_moo.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 150.0

#elif _Copyright_TextureNGS_Source == 46 // Architects Daughter NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_architects_daughter_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850.0, 250.0

#elif _Copyright_TextureNGS_Source == 47 // Staccato555 A
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_staccato555_a.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 820.0, 350.0

#elif _Copyright_TextureNGS_Source == 48 // Staccato555 B
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_staccato555_b.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 870.0, 320.0

#elif _Copyright_TextureNGS_Source == 49 // Lato Cutout
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_lato_cutout.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 180.0

#elif _Copyright_TextureNGS_Source == 50 // Lato Cutout NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_lato_cutout_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 620.0, 200.0

#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 435.0, 31.0
#endif
