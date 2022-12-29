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
               "Super Bodoni DF\0" \
               "Super Bodoni DF 2\0" \
               "Super Bodoni DF 3\0" \
               "Super Bodoni DF NGS\0" \
               "Super Bodoni DF NGS 2\0" \
               "Super Bodoni DF NGS 3\0" \
               "Super Bodoni DF NGS 4\0" \
               "Super Bodoni DF 4\0" \
               "Super Bodoni DF 5\0" \
               "Super Bodoni DF NGS 5\0" \
               "Super Bodoni DF NGS 6\0" \
               "Super Bodoni DF 6\0" \
               "Super Bodoni DF NGS 7\0" \
               "Super Bodoni DF NGS 8\0" \
               "Super Bodoni DF NGS 9\0" \
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

#if _Copyright_TextureNGS_Source == 0 // Super Bodoni DF
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1150.0, 200.0

#elif _Copyright_TextureNGS_Source == 1 // Super Bodoni DF 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 300.0

#elif _Copyright_TextureNGS_Source == 2 // Super Bodoni DF 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 300.0

#elif _Copyright_TextureNGS_Source == 3 // Super Bodoni DF NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 450.0

#elif _Copyright_TextureNGS_Source == 4 // Super Bodoni DF NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 500.0

#elif _Copyright_TextureNGS_Source == 5 // Super Bodoni DF NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 500.0

#elif _Copyright_TextureNGS_Source == 6 // Super Bodoni DF NGS 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 500.0

#elif _Copyright_TextureNGS_Source == 7 // Super Bodoni DF 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 500.0

#elif _Copyright_TextureNGS_Source == 8 // Super Bodoni DF 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 500.0

#elif _Copyright_TextureNGS_Source == 9 // Super Bodoni DF NGS 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 700.0

#elif _Copyright_TextureNGS_Source == 10 // Super Bodoni DF NGS 6
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs_6.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 500.0

#elif _Copyright_TextureNGS_Source == 11 // Super Bodoni DF 6
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_6.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 800.0

#elif _Copyright_TextureNGS_Source == 12 // Super Bodoni DF NGS 7
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs_7.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 850.0

#elif _Copyright_TextureNGS_Source == 13 // Super Bodoni DF NGS 8
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs_8.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 700.0

#elif _Copyright_TextureNGS_Source == 14 // Super Bodoni DF NGS 9
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_bodoni_df_ngs_9.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 800.0


#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bird_face_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 400.0
#endif
