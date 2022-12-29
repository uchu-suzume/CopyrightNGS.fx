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
               "Pro Torca\0" \
               "Pro Torca Outlined\0" \
               "Geometry Addict\0" \
               "Geometry Addict NGS\0" \
               "Geometry Addict NGS 2\0" \
               "Geometry Addict NGS 3\0" \
               "Geometry Addict NGS Square\0" \
               "Geometry Addict NGS Square 2\0" \
               "Geometry Addict NGS Square 3\0" \
               "Geometry Addict NGS Square 4\0" \
               "Geometry Addict NGS Square 5\0" \
               "Toy Writer Mop\0" \
               "Toy Writer Mop 2\0" \
               "Cybanin 3000\0" \
               "Cybanin 3000 2\0" \
               "Cybanin 3000 3\0" \
               "Cybanin 3000 4\0" \
               "Trapezoid Demon\0" \
               "Trapezoid Demon NGS\0" \
               "Bad Cat Planet NGS\0" \
               "Smoke Knife NGS\0" \
               "Smoke Knife NGS 2\0" \
               "Smoke Knife NGS 3\0" \
               "Space Noodle\0" \
               "Space Noodle NGS\0" \
               "Space Noodle NGS 2\0" \
               "Space Noodle NGS 3\0" \
               "Snail Lagoon\0" \
               "Snail Lagoon NGS\0" \
               "Snail Lagoon NGS 2\0" \
               "-------------------------------------------------\0" \
               "Pyxis\0" \
               "Pyxis NGS\0" \
               "Shotgun\0" \
               "Shotgun 2\0" \
               "Shotgun 3\0" \
               "Shotgun 4\0" \
               "Super\0" \
               "Super NGS\0" \
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

#elif _Copyright_TextureNGS_Source == 29 // Pro Torca
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_protorca_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 300.0

#elif _Copyright_TextureNGS_Source == 30 // Pro Torca Outlined
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_protorca_outlined_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 300.0

#elif _Copyright_TextureNGS_Source == 31 // Geometry Addict
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 500.0

#elif _Copyright_TextureNGS_Source == 32 // Geometry Addict NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 650.0

#elif _Copyright_TextureNGS_Source == 33 // Geometry Addict NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 700.0, 350.0

#elif _Copyright_TextureNGS_Source == 34 // Geometry Addict NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 500.0

#elif _Copyright_TextureNGS_Source == 35 // Geometry Addict NGS Square
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict_ngs_square.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 600.0

#elif _Copyright_TextureNGS_Source == 36 // Geometry Addict NGS Square 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict_ngs_square_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 600.0

#elif _Copyright_TextureNGS_Source == 37 // Geometry Addict NGS Square 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict_ngs_square_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 600.0

#elif _Copyright_TextureNGS_Source == 38 // Geometry Addict NGS Square 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict_ngs_square_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 600.0

#elif _Copyright_TextureNGS_Source == 39 // Geometry Addict NGS Square 5
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_geometry_addict_ngs_square_5.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 650.0, 600.0

#elif _Copyright_TextureNGS_Source == 40 // Toy Writer Mop
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_toy_writer_mop.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 550.0

#elif _Copyright_TextureNGS_Source == 41 // Toy Writer Mop 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_toy_writer_mop_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 350.0

#elif _Copyright_TextureNGS_Source == 42 // Cybanin 3000
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_cybanin3000.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1200.0, 350.0

#elif _Copyright_TextureNGS_Source == 43 // Cybanin 3000 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_cybanin3000_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 300.0

#elif _Copyright_TextureNGS_Source == 44 // Cybanin 3000 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_cybanin3000_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 300.0

#elif _Copyright_TextureNGS_Source == 45 // Cybanin 3000 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_cybanin3000_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 400.0

#elif _Copyright_TextureNGS_Source == 46 // Trapezoid Demon
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_trapezoid_demon.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 1200.0

#elif _Copyright_TextureNGS_Source == 47 // Trapezoid Demon NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_trapezoid_demon_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 500.0

#elif _Copyright_TextureNGS_Source == 48 // Bad Cat Planet NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bad_cat_planet_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 550.0, 950.0

#elif _Copyright_TextureNGS_Source == 49 // Smoke Knife NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_smoke_knife_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 500.0

#elif _Copyright_TextureNGS_Source == 50 // Smoke Knife NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_smoke_knife_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 900.0

#elif _Copyright_TextureNGS_Source == 51 // Smoke Knife NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_smoke_knife_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 800.0, 400.0

#elif _Copyright_TextureNGS_Source == 52 // Space Noodle
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_space_noodle.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 200.0

#elif _Copyright_TextureNGS_Source == 53 // Space Noodle NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_space_noodle_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 200.0

#elif _Copyright_TextureNGS_Source == 54 // Space Noodle NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_space_noodle_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 300.0

#elif _Copyright_TextureNGS_Source == 55 // Space Noodle NGS 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_space_noodle_ngs_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 900.0

#elif _Copyright_TextureNGS_Source == 56 // Snail Lagoon
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_snail_lagoon.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 300.0

#elif _Copyright_TextureNGS_Source == 57 // Snail Lagoon NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_snail_lagoon_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 800.0

#elif _Copyright_TextureNGS_Source == 58 // Snail Lagoon NGS 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_snail_lagoon_ngs_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 950.0, 400.0

#elif _Copyright_TextureNGS_Source == 59 // -------------------------------------------border line---------------------------------------------
#define _SOURCE_COPYRIGHT_NGS_FILE "blanku.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 1000.0, 50.0

#elif _Copyright_TextureNGS_Source == 60 // Pyxis
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_pyxis.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 500.0

#elif _Copyright_TextureNGS_Source == 61 // Pyxis NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_pyxis_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 500.0

#elif _Copyright_TextureNGS_Source == 62 // Shotgun
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_shotgun.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 400.0, 500.0

#elif _Copyright_TextureNGS_Source == 63 // Shotgun 2
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_shotgun_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 650.0

#elif _Copyright_TextureNGS_Source == 64 // Shotgun 3
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_shotgun_3.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 500.0

#elif _Copyright_TextureNGS_Source == 65 // Shotgun 4
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_shotgun_4.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 500.0, 300.0

#elif _Copyright_TextureNGS_Source == 66 // Super
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 600.0, 700.0

#elif _Copyright_TextureNGS_Source == 67 // Super NGS
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_super_ngs.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 750.0, 1000.0

#else
#define _SOURCE_COPYRIGHT_NGS_FILE "copyright_pso2_bird_face_2.png"
#define _SOURCE_COPYRIGHT_NGS_SIZE 900.0, 400.0
#endif
