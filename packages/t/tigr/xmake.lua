package("tigr")
    set_kind("library")
    set_homepage("https://github.com/erkkah/tigr")
    set_description("TIGR - the TIny GRaphics library for Windows, macOS, Linux, iOS and Android.")
    set_license("UNLICENSE")

    add_urls("https://github.com/erkkah/tigr/archive/refs/tags/$(version).tar.gz")

    add_versions("v3.2.2", "")

    on_install(function (package)
        os.cp("tigr.h", package:installdir("include/tigr.h"))
    end)
