licenses(["notice"])

package(default_visibility = ["//visibility:public"])

genrule(
    name = "src",
    srcs = [
        "configure.sh",
    ],
    outs = [
        "gtest_main.cc",
        "gtest-all.cc",
        "gtest.h",
    ],
    cmd = "$(locations :configure.sh) $(OUTS)",
)

cc_library(
    name = "gtest",
    srcs = ["gtest-all.cc"],
    hdrs = ["gtest.h"],
)

cc_library(
    name = "gtest_main",
    srcs = ["gtest_main.cc"],
    deps = [":gtest"],
    linkstatic = 1,
    alwayslink = 1,
)
