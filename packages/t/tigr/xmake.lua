package("tigr")
    set_kind("library")
    set_homepage("https://github.com/erkkah/tigr")
    set_description("TIGR - the TIny GRaphics library for Windows, macOS, Linux, iOS and Android.")
    set_license("UNLICENSE")

    add_urls("https://github.com/erkkah/tigr/archive/refs/tags/$(version).tar.gz")

    add_versions("v3.2.2", "7a76039bf2afa0637b6e7ee31f8d8050ca192a5104bc53e6d14927cc50f64c12")

    on_install(function (package)
        os.cp("*.h", package:installdir("include"))
        os.cp("build/libtigr.a", package:installdir("lib"))
    end)
