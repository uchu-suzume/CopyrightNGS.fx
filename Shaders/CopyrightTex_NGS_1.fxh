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
               "NGS\0" \
               "Gill Sans NGS\0" \
               "NGS(Legacy)\0" \
               "PSO2\0" \
               "Voltaire\0" \
               "Voltaire NGS\0" \
               "Euro Stile\0" \
               "Century\0" \
               "Schoolbell\0" \
               "Helvetica Condenced\0" \
               "Peignot\0" \
               "Six Caps\0" \
               "Parisian\0" \
               "Bubbler One\0" \
               "PSO2 with GShade Dark\0" \
               "PSO2 with GShade White\0" \
               "PSO2 NGS with GShade Dark\0" \
               "PSO2 NGS with GShade White\0" \
               "-------------------------------------------------\0" \
               "Montserrat\0" \
               "Montserrat Simple\0" \
               "Frutiger with Flat Logo\0" \
               "Eurostile 2\0" \
               "Poiret One Rectangle\0" \
               "Metro No.2 Cutout\0" \
               "Sigmar One\0" \
               "Fifty Four DF\0" \
               "Sophia DF\0" \
               "Kranky\0" \
               "GN-Fuyu-iro Script\0" \
               "Sophia DF 2\0" \
               "Sophia DF 12\0" \
               "Sacramento\0" \
               "Grandmaster\0" \
               ; \
    ui_bind = "_Copyright_TextureNGS_Source"; \
    ui_label = name_label; \
    ui_tooltip = description; \
    ui_spacing = 1; \
    ui_type = "combo"; \
> = 0;
/* Set default value(see above) by source code if the preset has not modified yet this variable/definition */
#ifndef Copyright_TextureNGS_Source
#define Copyright_TextureNGS_Source 0
#warning "Non-existing source reference numbers specified. Try selecting the logo texture at the top and then reload."
#endif

// -------------------------------------
// Texture Definition
// -------------------------------------

// (?<=Source == )[\d][\S+]{0,999} Regular expression for renumbering.

#if _Copyright_TextureNGS_Source == 0 // NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 260.0

#elif _Copyright_TextureNGS_Source == 1 // Gill Sans NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_gill_sans_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 70.0

#elif _Copyright_TextureNGS_Source == 2 // NGS(Legacy)
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_ngs_legacy.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 60.0

#elif _Copyright_TextureNGS_Source == 3 // PSO2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 60.0

#elif _Copyright_TextureNGS_Source == 4 // Voltaire
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_voltaire.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 60.0

#elif _Copyright_TextureNGS_Source == 5 // Voltaire NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_voltaire_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 60.0

#elif _Copyright_TextureNGS_Source == 6 // Euro Stile
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 60.0

#elif _Copyright_TextureNGS_Source == 7 // Century
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_century_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 60.0

#elif _Copyright_TextureNGS_Source == 8 // Schoolbell
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_schoolbell_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 60.0

#elif _Copyright_TextureNGS_Source == 9 // Helvetica Condenced
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_helvetica_condenced_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 60.0

#elif _Copyright_TextureNGS_Source == 10 // Peignot
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_peignot.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 120.0

#elif _Copyright_TextureNGS_Source == 11 // Six Caps
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_six_caps.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 160.0

#elif _Copyright_TextureNGS_Source == 12 // Parisian
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_parisian.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 75.0

#elif _Copyright_TextureNGS_Source == 13 // Bubbler One
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bubbler_one.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 60.0

#elif _Copyright_TextureNGS_Source == 14 // PSO2 with GShade Dark
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_by_gshade_dark_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 120.0

#elif _Copyright_TextureNGS_Source == 15 // PSO2 NGS with GShade White
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_by_gshade_white_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 120.0

#elif _Copyright_TextureNGS_Source == 16 // PSO2 BGS with GShade Dark
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_by_gshade_ngs_dark.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 130.0

#elif _Copyright_TextureNGS_Source == 17 // PSO2 with GShade White
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_by_gshade_ngs_white.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 130.0

#elif _Copyright_TextureNGS_Source == 18 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 19 // Montserrat
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Montserrat_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 120.0

#elif _Copyright_TextureNGS_Source == 20 //　Montserrat Simple
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_Montserrat_simple_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 120.0

#elif _Copyright_TextureNGS_Source == 21 // Frutiger with Flat Logo
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_frutiger_with_flat_logo_1550.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 120.0

#elif _Copyright_TextureNGS_Source == 22 // Eurostile 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_eurostile_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550,200.0

#elif _Copyright_TextureNGS_Source == 23 // Poiret One Rectangle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_poiret_one_rectangle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550, 250.0

#elif _Copyright_TextureNGS_Source == 24 // Metro No.2 Cutout
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_metro_no.2_cutout.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 850, 150.0

#elif _Copyright_TextureNGS_Source == 25 // Sigmar One
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sigmar_one.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 50.0

#elif _Copyright_TextureNGS_Source == 26 // Fifty Four DF
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_fifty_four_df.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 100.0

#elif _Copyright_TextureNGS_Source == 27 // Sophia DF
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1550.0, 100.0

#elif _Copyright_TextureNGS_Source == 28 // Kranky
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_kranky.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1280.0, 120.0

#elif _Copyright_TextureNGS_Source == 29 // GN Fuyu-iro Script
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_gn-fuyu-iro_script.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 820.0, 160.0

#elif _Copyright_TextureNGS_Source == 30 // Sophia DF 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1150.0, 150.0

#elif _Copyright_TextureNGS_Source == 31 // Sophia DF 12
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sophia_df_ngs_12.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 150.0

#elif _Copyright_TextureNGS_Source == 32 // Sacramento 
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_sacramento.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 150.0

#elif _Copyright_TextureNGS_Source == 33 // Grandmaster
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_grandmaster.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1200.0, 200.0

#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 435.0, 31.0
#endif
