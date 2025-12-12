package("tigr")
    set_kind("library")
    set_homepage("https://github.com/erkkah/tigr")
    set_description("TIGR - the TIny GRaphics library for Windows, macOS, Linux, iOS and Android.")
    set_license("UNLICENSE")

    add_urls("https://github.com/erkkah/tigr/archive/refs/tags/$(version).tar.gz")

    add_versions("v3.2.2", "7a76039bf2afa0637b6e7ee31f8d8050ca192a5104bc53e6d14927cc50f64c12")

    if is_plat("linux") then
        add_syslinks("X11", "GL")
    end

    on_install(function (package)
        io.writefile("xmake.lua", [[
            add_rules("mode.debug", "mode.release")
            target("tigr")
                set_kind("$(kind)")
                set_languages("c++11")
                add_files("tigr.c")
                add_headerfiles("tigr.h")
                if is_plat("windows", "mingw") then
                    set_basename(is_kind("shared") and "glew32" or "glew32s")
                    add_syslinks("opengl32", "gdi32")
                elseif is_plat("macosx") then
                    add_frameworks("OpenGL")
                elseif is_plat("linux") then
                    add_syslinks("GL", "X11")
                end
        ]])
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include "tigr.h"
            void test() {
                Tigr *screen = tigrWindow(320, 240, "Hello", 0);
                while (!tigrClosed(screen)) {
                    tigrClear(screen, tigrRGB(0x80, 0x90, 0xa0));
                    tigrPrint(screen, tfont, 120, 110, tigrRGB(0xff, 0xff, 0xff), "Hello, world.");
                    tigrUpdate(screen);
                }
                tigrFree(screen);
            }
        ]]}))
    end)
