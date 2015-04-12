licenses(["notice"])

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "repository",
    srcs = glob(["repository/**"]),
)

sh_binary(
    name = "configure",
    srcs = ["configure.sh"],
    data = [":repository"],
)

genrule(
    name = "headers",
    srcs = [
        "configure.sh",
        "fake_compiler.sh",
    ],
    outs = [
        "base__commandlineflags.h",
        "base__googleinit.h",
        "base__mutex.h",
        "config.h",
        "config_for_unittests.h",
        "demangle.cc",
        "demangle.h",
        "demangle_unittest.cc",
        "glog__log_severity.h",
        "glog__logging.h",
        "glog__raw_logging.h",
        "glog__stl_logging.h",
        "glog__vlog_is_on.h",
        "googletest.h",
        "logging.cc",
        "logging_striptest10.cc",
        "logging_striptest2.cc",
        "logging_striptest_main.cc",
        "logging_unittest.cc",
        "mock-log.h",
        "mock-log_test.cc",
        "raw_logging.cc",
        "signalhandler.cc",
        "signalhandler_unittest.cc",
        "stacktrace.h",
        "stacktrace_generic-inl.h",
        "stacktrace_libunwind-inl.h",
        "stacktrace_powerpc-inl.h",
        "stacktrace_unittest.cc",
        "stacktrace_x86-inl.h",
        "stacktrace_x86_64-inl.h",
        "stl_logging_unittest.cc",
        "symbolize.cc",
        "symbolize.h",
        "symbolize_unittest.cc",
        "utilities.cc",
        "utilities.h",
        "utilities_unittest.cc",
        "vlog_is_on.cc",
    ],
    cmd = "CXX=g++ $(locations :configure.sh) $(OUTS)",
)

cc_library(
    name = "glog",
    srcs = [
        "base__commandlineflags.h",
        "base__googleinit.h",
        "base__mutex.h",
        "config.h",
        "config_for_unittests.h",
        "demangle.cc",
        "demangle.h",
        "glog__log_severity.h",
        "glog__logging.h",
        "glog__raw_logging.h",
        "glog__stl_logging.h",
        "glog__vlog_is_on.h",
        "googletest.h",
        "logging.cc",
        "mock-log.h",
        "raw_logging.cc",
        "signalhandler.cc",
        "stacktrace.h",
        "stacktrace_generic-inl.h",
        "stacktrace_libunwind-inl.h",
        "stacktrace_powerpc-inl.h",
        "stacktrace_x86-inl.h",
        "stacktrace_x86_64-inl.h",
        "symbolize.cc",
        "symbolize.h",
        "utilities.cc",
        "utilities.h",
        "vlog_is_on.cc",
    ],
    deps = [
        "//third_party/gflags",
    ],
    # TODO(imos): Bazel cannot handle dynamic link correctly.
    linkstatic = 1,
)

# TODO(imos): logging_striptest10 includes logging_striptest_main.cc, but .cc
# inclusion is not allowed in bazel.
# cc_test(
#     name = "logging_striptest10",
#     srcs = ["logging_striptest10.cc"],
#     deps = [":glog"],
# )

# TODO(imos): logging_striptest2 includes logging_striptest_main.cc, but .cc
# inclusion is not allowed in bazel.
# cc_test(
#     name = "logging_striptest2",
#     srcs = ["logging_striptest2.cc"],
#     deps = [":glog"],
# )

# TODO(imos): logging_unittest requires an external file, so code change is
# required.
# cc_test(
#     name = "logging_unittest",
#     srcs = ["logging_unittest.cc"],
#     deps = [":glog"],
# )

# TODO(imos): Support gmock.
# cc_test(
#     name = "mock-log_test",
#     srcs = ["mock-log_test.cc"],
#     deps = [":glog"],
# )

cc_test(
    name = "signalhandler_unittest",
    srcs = ["signalhandler_unittest.cc"],
    deps = [":glog"],
)

cc_test(
    name = "stacktrace_unittest",
    srcs = ["stacktrace_unittest.cc"],
    deps = [":glog"],
)

cc_test(
    name = "stl_logging_unittest",
    srcs = ["stl_logging_unittest.cc"],
    deps = [":glog"],
)

cc_test(
    name = "symbolize_unittest",
    srcs = ["symbolize_unittest.cc"],
    deps = [":glog"],
)

cc_test(
    name = "utilities_unittest",
    srcs = ["utilities_unittest.cc"],
    deps = [":glog"],
)
