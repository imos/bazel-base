licenses(["notice"])

package(default_visibility = ["//visibility:public"])

genrule(
    name = "src",
    srcs = ["configure.sh"],
    outs = [
        "config.h",
        "gflags_completions.h",
        "gflags_declare.h",
        "gflags_gflags.h",
        "gflags.h",
        "gflags_completions.cc",
        "gflags_reporting.cc",
        "gflags.cc",
        "mutex.h",
        "util.h",
        "windows_port.cc",
        "windows_port.h",
        "config_for_unittests.h",
        "gflags_declare_flags.cc",
        "gflags_declare_test.cc",
        "gflags_strip_flags_test.cc",
        "gflags_unittest_flagfile",
        "gflags_unittest.cc",
        "nc__gflags_nc.cc",
    ],
    cmd = "$(locations :configure.sh) $(OUTS)",
)

cc_library(
    name = "gflags",
    srcs = [
        "config.h",
        "gflags_completions.h",
        "gflags_declare.h",
        "gflags_gflags.h",
        "gflags.h",
        "gflags_completions.cc",
        "gflags_reporting.cc",
        "gflags.cc",
        "mutex.h",
        "util.h",
    ],
)

cc_test(
    name = "gflags_declare_test",
    srcs = [
        "config_for_unittests.h",
        "gflags_declare_flags.cc",
        "gflags_declare_test.cc",
    ],
    deps = [":gflags"],
)

cc_test(
    name = "gflags_strip_flags_test",
    srcs = [
        "config_for_unittests.h",
        "gflags_strip_flags_test.cc",
    ],
    deps = [":gflags"],
)

cc_test(
    name = "gflags_unittest",
    srcs = [
        "config_for_unittests.h",
        "gflags_unittest.cc",
    ],
    data = [
        ":gflags_unittest_flagfile",
    ],
    deps = [":gflags"],
    args = ["--srcdir=third_party/gflags"],
)
