package(default_visibility = ["//visibility:public"])

licenses(["notice"])

load(
    "@io_bazel_rules_go//go:def.bzl",
    "go_library",
)

go_library(
    name = "go_default_library",
    srcs = [
        "clientset.go",
        "doc.go",
        "import_known_versions.go",
    ],
    tags = ["automanaged"],
    deps = [
        "//federation/apis/federation/install:go_default_library",
        "//federation/client/clientset_generated/federation_internalclientset/typed/autoscaling/internalversion:go_default_library",
        "//federation/client/clientset_generated/federation_internalclientset/typed/batch/internalversion:go_default_library",
        "//federation/client/clientset_generated/federation_internalclientset/typed/core/internalversion:go_default_library",
        "//federation/client/clientset_generated/federation_internalclientset/typed/extensions/internalversion:go_default_library",
        "//federation/client/clientset_generated/federation_internalclientset/typed/federation/internalversion:go_default_library",
        "//pkg/client/typed/discovery:go_default_library",
        "//vendor:github.com/golang/glog",
        "//vendor:k8s.io/client-go/plugin/pkg/client/auth",
        "//vendor:k8s.io/client-go/rest",
        "//vendor:k8s.io/client-go/util/flowcontrol",
    ],
)

filegroup(
    name = "package-srcs",
    srcs = glob(["**"]),
    tags = ["automanaged"],
    visibility = ["//visibility:private"],
)

filegroup(
    name = "all-srcs",
    srcs = [
        ":package-srcs",
        "//federation/client/clientset_generated/federation_internalclientset/fake:all-srcs",
        "//federation/client/clientset_generated/federation_internalclientset/typed/autoscaling/internalversion:all-srcs",
        "//federation/client/clientset_generated/federation_internalclientset/typed/batch/internalversion:all-srcs",
        "//federation/client/clientset_generated/federation_internalclientset/typed/core/internalversion:all-srcs",
        "//federation/client/clientset_generated/federation_internalclientset/typed/extensions/internalversion:all-srcs",
        "//federation/client/clientset_generated/federation_internalclientset/typed/federation/internalversion:all-srcs",
    ],
    tags = ["automanaged"],
)
