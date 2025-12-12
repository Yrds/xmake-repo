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
                add_headerfiles("tigr.h")
        ]])
        import("package.tools.xmake").install(package)
    end)
