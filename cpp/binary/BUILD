# Copyright 2019 The MLPerf Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
load("@org_tensorflow//tensorflow/lite:build_def.bzl", "tflite_copts", "tflite_linkopts")

package(
    default_visibility = ["//visibility:public"],
    licenses = ["notice"],  # Apache 2.0
)

common_linkopts = tflite_linkopts() + select({
    "//conditions:default": [],
    "@org_tensorflow//tensorflow:android": [
        "-pie",
    ],
})

cc_binary(
    name = "main",
    srcs = ["main.cc"],
    copts = tflite_copts(),
    linkopts = common_linkopts,
    deps = [
        "//cpp:mlperf_driver",
        "//cpp:utils",
        "//cpp/backends:tflite",
        "//cpp/datasets:coco",
        "//cpp/datasets:dummy_dataset",
        "//cpp/datasets:imagenet",
        "//cpp/datasets:squad",
        "//cpp/proto:mlperf_task_cc_proto",
        "@com_google_absl//absl/strings",
        "@org_tensorflow//tensorflow/lite/tools:command_line_flags",
    ],
)
