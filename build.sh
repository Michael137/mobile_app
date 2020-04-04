#!/bin/bash

bazel build -c opt --cxxopt='--std=c++14' --fat_apk_cpu=x86,arm64-v8a,armeabi-v7a //java/org/mlperf/inference:mlperf_app &&\
	adb uninstall "org.mlperf.inference" &&\
	adb install bazel-bin/java/org/mlperf/inference/mlperf_app.apk
