workspace(name = "mlperf_app")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "org_tensorflow",

    urls = [
        "https://mirror.bazel.build/github.com/tensorflow/tensorflow/archive/481366eab297011fed94ccc599e27825c905a18c.tar.gz",
        "https://github.com/tensorflow/tensorflow/archive/481366eab297011fed94ccc599e27825c905a18c.tar.gz",
    ],
    sha256 = "d72626a2e533b1a0eae4ca1c9d3b71ced986ba12ed3c55fd57a334271a0b34ee",
    strip_prefix = "tensorflow-481366eab297011fed94ccc599e27825c905a18c",
    patches = ["@//third_party:org_tensorflow/tf.patch"],
    patch_args = ["-p1"],
)

# TensorFlow build depends on following dependencies.
# Needs to be in-sync with TensorFlow sources.
http_archive(
    name = "io_bazel_rules_closure",
    sha256 = "7d206c2383811f378a5ef03f4aacbcf5f47fd8650f6abbc3fa89f3a27dd8b176",
    strip_prefix = "rules_closure-0.10.0",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_closure/archive/0.10.0.tar.gz",
        "https://github.com/bazelbuild/rules_closure/archive/0.10.0.tar.gz",
    ],
)
load("@io_bazel_rules_closure//closure:repositories.bzl", "rules_closure_dependencies", "rules_closure_toolchains")
rules_closure_dependencies()
rules_closure_toolchains()

http_archive(
    name = "bazel_skylib",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
    ],
    sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
)
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

# Initialize tensorflow workspace.
load("@org_tensorflow//tensorflow:workspace.bzl", "tf_workspace")
tf_workspace(path_prefix = "", tf_repo_name = "org_tensorflow")

# Android.
android_sdk_repository(
    name = "androidsdk",
    api_level = 28,
)

android_ndk_repository(
    name = "androidndk",
)

RULES_JVM_EXTERNAL_TAG = "2.10"
RULES_JVM_EXTERNAL_SHA = "1bbf2e48d07686707dd85357e9a94da775e1dbd7c464272b3664283c9c716d26"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "androidx.annotation:annotation:aar:1.1.0",
        "androidx.appcompat:appcompat:aar:1.1.0",
        "androidx.constraintlayout:constraintlayout:aar:2.0.0-beta3",
        "androidx.core:core:aar:1.1.0",
        "androidx.work:work-runtime:aar:2.2.0",
        "com.google.android.material:material:aar:1.1.0-beta02",
        "androidx.recyclerview:recyclerview:aar:1.1.0",
        "androidx.lifecycle:lifecycle-livedata:aar:2.1.0",
    ],
    repositories = [
        "https://dl.google.com/dl/android/maven2",
        "https://repo1.maven.org/maven2",
    ],
)

# Other dependencies.
http_archive(
    name = "org_mlperf_inference",
    build_file = "@//third_party/mlperf_loadgen:BUILD.bazel",
    urls = [
        "https://mirror.bazel.build/github.com/mlperf/inference/archive/876c6e2e390b188d69675a59a71360ab39007bde.tar.gz",
        "https://github.com/mlperf/inference/archive/876c6e2e390b188d69675a59a71360ab39007bde.tar.gz",
    ],
    sha256 = "dd5455d037da75be7b48f290cd9aaa6c9a510ecf09fa2ca5e8d28e3af6e30a44",
    strip_prefix = "inference-876c6e2e390b188d69675a59a71360ab39007bde/loadgen",
    patches = ["@//third_party:mlperf_loadgen/loadgen.patch"],
    patch_args = ["-p1"],
)

http_archive(
    name = "com_google_protobuf_javalite",
    urls = [
        "https://mirror.bazel.build/github.com/google/protobuf/archive/javalite.zip",
        "https://github.com/google/protobuf/archive/javalite.zip",
    ],
    sha256 = "757038e6363ec3ad9df4f9548105289767e03f8c1efb000181cafa16ccdf2e69",
    strip_prefix = "protobuf-javalite",
)

http_archive(
    name = "build_bazel_rules_android",
    urls = ["https://github.com/bazelbuild/rules_android/archive/v0.1.1.zip"],
    sha256 = "cd06d15dd8bb59926e4d65f9003bfc20f9da4b2519985c27e190cddc8b7a7806",
    strip_prefix = "rules_android-0.1.1",
)

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "7a7afdd4869bb201c9352eed2daf37294d42b093579b70423490c1b4d4f6ce42",
    urls = ["https://github.com/bazelbuild/rules_apple/releases/download/0.19.0/rules_apple.0.19.0.tar.gz"],
)
load("@build_bazel_rules_apple//apple:repositories.bzl", "apple_rules_dependencies")
apple_rules_dependencies()

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "18cd4df4e410b0439a4935f9ca035bd979993d42372ba79e7f2d4fafe9596ef0",
    urls = ["https://github.com/bazelbuild/rules_swift/releases/download/0.12.1/rules_swift.0.12.1.tar.gz"],
)
load("@build_bazel_rules_swift//swift:repositories.bzl", "swift_rules_dependencies")
swift_rules_dependencies()

http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.0.1/rules_python-0.0.1.tar.gz",
    sha256 = "aa96a691d3a8177f3215b14b0edc9641787abaaa30363a080165d06ab65e1161",
)
load("@rules_python//python:repositories.bzl", "py_repositories")
py_repositories()


# Specify the minimum required bazel version.
load("@org_tensorflow//tensorflow:version_check.bzl", "check_bazel_version_at_least")
check_bazel_version_at_least("0.24.1")
