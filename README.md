Bazel version 0.10 only supports Android NDK version 14, which does not implement many C++11 features. This can be a problem when cross-compiling an existing library that relies on C++11.

This project provides a Bazel build rule to cross-compile using NDK 16. 

# Usage

1. Set the environment variable `ANDROID_NDK_HOME` to the path of the directory containing the NDK. For example, if the Android SDK is installation in `/usr/local/sdk/`, the Android NDK may be found in `/usr/local/sdk/ndk-bundle`.

2. Add the Bazel build rule to your workspace. For example, if the build rules are located in the `build_rules/` sub-directory,  you can add the following
```
load("//build_rules:android_ndk.bzl", "configure_local_ndk")
configure_local_ndk()
```
to your `WORKSPACE` file.

3. You can now call Bazel with the toolchain_libcpp CROSSTOOL to build using the local NDK:
```
bazel build --crosstool_top=@android_ndk//:toolchain-libcpp --cpu=armeabi-v7a --host_crosstool_top=@bazel_tools//tools/cpp:toolchain //...
```

# Limitations

I have only implemented the `toolchain-libcpp` rule, which provides the `libc++` C++ runtime library, and only the armeabi-v7a cpu. `gnustl`, `stlport` C++ runtime libraries are not implemented, and neither mips, mip64, armeabi or arm64-v8a CPUs.

