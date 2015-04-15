licenses(["notice"])

package(default_visibility = ["//visibility:public"])

genrule(
    name = "src",
    srcs = [
        "configure.sh",
    ],
    outs = [
        "gmock__gmock.h",
        "gmock_main.cc",
        "gmock-gtest-all.cc",
        "gtest__gtest.h",
    ],
    cmd = "$(locations :configure.sh) $(OUTS)",
)

cc_library(
    name = "gmock",
    srcs = ["gmock-gtest-all.cc"],
    hdrs = [
        "gmock__gmock.h",
        "gmock.h",
        "gtest__gtest.h",
    ],
)

cc_library(
    name = "gmock_main",
    srcs = ["gmock_main.cc"],
    deps = [":gmock"],
    linkstatic = 1,
    alwayslink = 1,
)
