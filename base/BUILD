package(default_visibility = ["//visibility:public"])

cc_library(
    name = "base",
    srcs = ["base.cc"],
    hdrs = ["base.h"],
    deps = [
        "//third_party/gflags",
        "//third_party/glog",
    ],
    linkstatic = 1,
)

cc_library(
    name = "test",
    srcs = ["test.cc"],
    hdrs = ["test.h"],
    deps = [
        ":base",
        "//third_party/gmock",
    ],
    testonly = 1,
    linkstatic = 1,
)

cc_library(
    name = "test_main",
    srcs = ["test_main.cc"],
    hdrs = ["test_main.h"],
    deps = [
        ":test",
        "//third_party/gmock:gmock_main",
    ],
    testonly = 1,
    linkstatic = 1,
)
