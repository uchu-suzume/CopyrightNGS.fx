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
               "Rachel DF\0" \
               "Rachel DF 2\0" \
               "Rachel DF 3\0" \
               "Rachel DF 4\0" \
               "Rachel DF 4 Large\0" \
               "Rachel DF 5\0" \
               "Rachel DF 5 Large\0" \
               "Rachel DF 6\0" \
               "Rachel DF 7\0" \
               "Rachel DF 8\0" \
               "Rachel DF 9\0" \
               "Rachel DF 10\0" \
               "Rachel DF 11\0" \
               "Rachel DF NGS\0" \
               "Rachel DF NGS 2\0" \
               "Rachel DF NGS 3\0" \
               "Rachel DF NGS 4\0" \
               "Rachel DF NGS 5\0" \
               "Rachel DF NGS 6\0" \
               "Rachel DF NGS 7\0" \
               "Rachel DF NGS 8\0" \
               "Rachel DF NGS 9\0" \
               "Rachel DF NGS 9 Large\0" \
               "Rachel DF NGS 10\0" \
               "Rachel DF NGS 10 Large\0" \
               "Rachel DF NGS 11\0" \
               "Rachel DF NGS 11 Large\0" \
               "Rachel DF NGS 12\0" \
               "Rachel DF NGS 12 Large\0" \
               ; \
    ui_bind = "_Copyright_TextureNGS_Source"; \
    ui_label = name_label; \
    ui_tooltip = description; \
    ui_spacing = 1; \
    ui_type = "combo"; \
> = 0;
/* Set default value(see above) by source code if the preset has not modified yet this variable/definition */
#ifndef cLayerNGS_TextureNGS_Source
#define cLayerNGS_TextureNGS_Source 0
//#warning "Non-existing source reference numbers specified. Try selecting the logo texture at the top and then reload."
#endif

// -------------------------------------
// Texture Definition
// -------------------------------------

// (?<=Source == )[\d][\S+]{0,999} Regular expression for renumbering.

#if _Copyright_TextureNGS_Source == 0 // Rachel DF
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 150.0

#elif _Copyright_TextureNGS_Source == 1 // Rachel DF 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1200.0, 150.0

#elif _Copyright_TextureNGS_Source == 2 // Rachel DF 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1300.0, 250.0

#elif _Copyright_TextureNGS_Source == 3 // Rachel DF 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 250.0

#elif _Copyright_TextureNGS_Source == 4 // Rachel DF 4 Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_4_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 500.0

#elif _Copyright_TextureNGS_Source == 5 // Rachel DF 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 200.0

#elif _Copyright_TextureNGS_Source == 6 // Rachel DF 5 Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_5_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 400.0

#elif _Copyright_TextureNGS_Source == 7 // Rachel DF 6
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_6.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 400.0

#elif _Copyright_TextureNGS_Source == 8 // Rachel DF 7
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_7.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 500.0

#elif _Copyright_TextureNGS_Source == 9 // Rachel DF 8
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_8.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 500.0

#elif _Copyright_TextureNGS_Source == 10 // Rachel DF 9
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_9.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 500.0

#elif _Copyright_TextureNGS_Source == 11 // Rachel DF 10
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_10.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 700.0

#elif _Copyright_TextureNGS_Source == 12 // Rachel DF 11
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_11.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 550.0, 700.0

#elif _Copyright_TextureNGS_Source == 13 // Rachel DF NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 300.0

#elif _Copyright_TextureNGS_Source == 14 // Rachel DF NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 300.0

#elif _Copyright_TextureNGS_Source == 15 // Rachel DF NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1500.0, 450.0

#elif _Copyright_TextureNGS_Source == 16 // Rachel DF NGS 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 500.0

#elif _Copyright_TextureNGS_Source == 17 // Rachel DF NGS 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 450.0

#elif _Copyright_TextureNGS_Source == 18 // Rachel DF NGS 6
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_6.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 400.0

#elif _Copyright_TextureNGS_Source == 19 // Rachel DF NGS 7
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_7.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 500.0

#elif _Copyright_TextureNGS_Source == 20 // Rachel DF NGS 8
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_8.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 350.0

#elif _Copyright_TextureNGS_Source == 21 // Rachel DF NGS 9
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_9.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 600.0

#elif _Copyright_TextureNGS_Source == 22 // Rachel DF NGS 9 Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_9_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 1200.0

#elif _Copyright_TextureNGS_Source == 23 // Rachel DF NGS 10
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_10.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 350.0, 300.0

#elif _Copyright_TextureNGS_Source == 24 // Rachel DF NGS 10 Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_10_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 550.0

#elif _Copyright_TextureNGS_Source == 25 // Rachel DF NGS 11
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_11.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 350.0, 300.0

#elif _Copyright_TextureNGS_Source == 26 // Rachel DF NGS 11 Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_11_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 550.0

#elif _Copyright_TextureNGS_Source == 27 // Rachel DF NGS 12
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_12.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 350.0, 400.0

#elif _Copyright_TextureNGS_Source == 28 // Rachel DF NGS 12 Large
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_rachel_df_ngs_12_large.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 800.0


#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bird_face_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 400.0
#endif
