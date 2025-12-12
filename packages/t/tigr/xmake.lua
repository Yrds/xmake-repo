package("tigr")
    set_kind("library")
    set_homepage("https://github.com/erkkah/tigr")
    set_description("TIGR - the TIny GRaphics library for Windows, macOS, Linux, iOS and Android.")
    set_license("UNLICENSE")

    add_urls("https://github.com/erkkah/tigr/archive/refs/tags/$(version).tar.gz")

    add_versions("v3.2.2", "7a76039bf2afa0637b6e7ee31f8d8050ca192a5104bc53e6d14927cc50f64c12")

    on_install(function (package)
        io.writefile("xmake.lua", [[
            add_rules("mode.debug", "mode.release")
            target("tigr")
                set_kind("$(kind)")
                set_languages("c++11")
                add_files("tigr.c")
                if is_plat("windows", "mingw") then
                    set_basename(is_kind("shared") and "glew32" or "glew32s")
                    add_syslinks("opengl32", "gdi32")
                elseif is_plat("macosx") then
                    add_frameworks("OpenGL")
                elseif is_plat("linux") then
                    add_syslinks("GL", "X11",)
                end
        ]])
        import("package.tools.xmake").install(package)
    end)
