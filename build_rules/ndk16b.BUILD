# Copyright 2015 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file was modified by Nicolas Couronneau to support NDK 16

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "files",
    srcs = ["ndk"],
)

cc_library(
    name = "malloc",
    srcs = [],
)

################################################################
# cc toolchain suite rules (one for each STL in the NDK)
################################################################

cc_toolchain_suite(
    name = "toolchain-libcpp",
    toolchains = {
      "armeabi-v7a|clang3.8": ":arm-linux-androideabi-clang3.8-v7a-libcpp",
    },
    proto = """
major_version: "android"
minor_version: ""
default_target_cpu: "armeabi"
default_toolchain {
  cpu: "armeabi-v7a"
  toolchain_identifier: "arm-linux-androideabi-clang3.8-v7a-libcpp"
}
toolchain {
  toolchain_identifier: "arm-linux-androideabi-clang3.8-v7a-libcpp"
  host_system_name: "darwin-x86_64"
  target_system_name: "arm-linux-androideabi"
  target_cpu: "armeabi-v7a"
  target_libc: "local"
  compiler: "clang3.8"
  abi_version: "armeabi-v7a"
  abi_libc_version: "local"
  tool_path {
    name: "ar"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-ar"
  }
  tool_path {
    name: "cpp"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-cpp"
  }
  tool_path {
    name: "gcov"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-gcov"
  }
  tool_path {
    name: "gcov-tool"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-gcov-tool"
  }
  tool_path {
    name: "ld"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-ld"
  }
  tool_path {
    name: "nm"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-nm"
  }
  tool_path {
    name: "objcopy"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-objcopy"
  }
  tool_path {
    name: "objdump"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-objdump"
  }
  tool_path {
    name: "strip"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-strip"
  }
  tool_path {
    name: "dwp"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-dwp"
  }
  tool_path {
    name: "llvm-profdata"
    path: "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-llvm-profdata"
  }
  tool_path {
    name: "gcc"
    path: "local_ndk/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang"
  }
  # From cmake
  compiler_flag: "-DANDROID"
  compiler_flag: "-D__ANDROID_API__=27"

  compiler_flag: "-gcc-toolchain"
  compiler_flag: "external/android_ndk/local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64"
  compiler_flag: "-fpic"
  compiler_flag: "-ffunction-sections"
  compiler_flag: "-funwind-tables"
  compiler_flag: "-fstack-protector-strong"
  compiler_flag: "-Wno-invalid-command-line-argument"
  compiler_flag: "-Wno-unused-command-line-argument"
  compiler_flag: "-no-canonical-prefixes"
  compiler_flag: "-fno-integrated-as"
  compiler_flag: "-target"
  compiler_flag: "armv7-none-linux-androideabi"
  compiler_flag: "-march=armv7-a"
  compiler_flag: "-mfloat-abi=softfp"
  compiler_flag: "-mfpu=neon"
# Position independent code
  compiler_flag: "-fPIE"
  compiler_flag: "-fvisibility=default"

  linker_flag: "-Lexternal/android_ndk/local_ndk/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/"
#  linker_flag: "-latomic -lm"
  linker_flag: "-ldl"
  linker_flag: "-gcc-toolchain"
  linker_flag: "external/android_ndk/local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64"
  linker_flag: "-no-canonical-prefixes"
  linker_flag: "-target"
  linker_flag: "armv7-none-linux-androideabi"
  linker_flag: "-Wl,--fix-cortex-a8"
  # From cmake
  linker_flag: "-Wl,--exclude-libs,libunwind.a"
# Position independent code
  linker_flag: "-fPIE"
  linker_flag: "-pie"
  linker_flag: "-rdynamic"

  compilation_mode_flags {
    mode: OPT
    compiler_flag: "-mthumb"
    compiler_flag: "-Os"
    compiler_flag: "-g"
    compiler_flag: "-DNDEBUG"
  }
  compilation_mode_flags {
    mode: DBG
    compiler_flag: "-g"
    compiler_flag: "-fno-strict-aliasing"
    compiler_flag: "-O0"
    compiler_flag: "-UNDEBUG"
  }
  cxx_builtin_include_directory: "external/android_ndk/local_ndk/toolchains/llvm/prebuilt/darwin-x86_64/lib64/clang/3.8.275480/include"
  cxx_builtin_include_directory: "%sysroot%/usr/include"

  builtin_sysroot: "external/android_ndk/local_ndk/platforms/android-27/arch-arm"

  unfiltered_cxx_flag: "-isystem"
  unfiltered_cxx_flag: "external/android_ndk/local_ndk/sources/cxx-stl/llvm-libc++/include"
  unfiltered_cxx_flag: "-isystem"
  unfiltered_cxx_flag: "external/android_ndk/local_ndk/sources/cxx-stl/llvm-libc++abi/include"
  unfiltered_cxx_flag: "-isystem"
  unfiltered_cxx_flag: "external/android_ndk/local_ndk/sources/android/support/include"
# from cmake
  unfiltered_cxx_flag: "-isystem"
  unfiltered_cxx_flag: "external/android_ndk/local_ndk/sysroot/usr/include/"
  unfiltered_cxx_flag: "-isystem"
  unfiltered_cxx_flag: "external/android_ndk/local_ndk/sysroot/usr/include/arm-linux-androideabi"

  supports_embedded_runtimes: true
  static_runtimes_filegroup: "libcpp-armeabi-v7a-static-runtime-libraries"
  dynamic_runtimes_filegroup: "libcpp-armeabi-v7a-dynamic-runtime-libraries"
}

""")



################################################################
# cc toolchain rules
################################################################


################################################################
# arm-linux-androideabi-clang3.8-v7a-libcpp
################################################################

cc_toolchain(
    name = "arm-linux-androideabi-clang3.8-v7a-libcpp",
    all_files = ":arm-linux-androideabi-clang3.8-v7a-libcpp-all_files",
    compiler_files = ":arm-linux-androideabi-clang3.8-v7a-libcpp-all_files",
    cpu = "armeabi-v7a",
    dwp_files = ":arm-linux-androideabi-clang3.8-v7a-libcpp-toolchain_files",
    dynamic_runtime_libs = [":libcpp-armeabi-v7a-dynamic-runtime-libraries"],
    linker_files = ":arm-linux-androideabi-clang3.8-v7a-libcpp-all_files",
    objcopy_files = ":arm-linux-androideabi-clang3.8-v7a-libcpp-toolchain_files",
    static_runtime_libs = [":libcpp-armeabi-v7a-static-runtime-libraries"],
    strip_files = ":arm-linux-androideabi-clang3.8-v7a-libcpp-toolchain_files",
    supports_param_files = 0,
)

filegroup(
    name = "arm-linux-androideabi-clang3.8-v7a-libcpp-toolchain_files",
    srcs = glob(["local_ndk/toolchains/llvm/**"]),
    output_licenses = ["unencumbered"],
)

filegroup(
    name = "arm-linux-androideabi-clang3.8-v7a-libcpp-all_files",
    srcs = [
        ":arm-linux-androideabi-clang3.8-v7a-libcpp-toolchain_files",
    ] + glob([
        "local_ndk/platforms/android-27/arch-arm/**/*",
        "local_ndk/sources/cxx-stl/llvm-libc++/include/**/*",
        "local_ndk/sources/cxx-stl/llvm-libc++/libs/**/*",
        "local_ndk/sources/cxx-stl/llvm-libc++abi/include/**/*",
        "local_ndk/sources/android/support/include/**/*",
        "local_ndk/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/**/*",
        "local_ndk/sysroot/usr/include/**/*",
    ]),
)


################################################################
# STL runtime library filegroups
################################################################

filegroup(
    name = "libcpp-armeabi-v7a-dynamic-runtime-libraries",
    srcs = glob(["local_ndk/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/*.so"]),
)

filegroup(
    name = "libcpp-armeabi-v7a-static-runtime-libraries",
    srcs = glob(["local_ndk/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/*.a"]),
)

################################################################
# Miscellaneous runtime libraries
################################################################

cc_library(
    name = 'cpufeatures',
    srcs = glob(['local_ndk/sources/android/cpufeatures/*.c']),
    hdrs = glob(['local_ndk/sources/android/cpufeatures/*.h']),
)

