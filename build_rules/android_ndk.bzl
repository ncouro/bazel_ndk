# This repository rule allows using the cross-compilation tools 
# from the local Android NDK installation.
# The environment variable ANDROID_NDK_HOME should contain the
# path to the root directory of the NDK installation (typically
# android-sdk/ndk-bundle/)
#
# Cross-compilation can be achieved by running:
# bazel build --crosstool_top=@android_ndk//:toolchain-libcpp --cpu=armeabi-v7a --host_crosstool_top=@bazel_tools//tools/cpp:toolchain
#
NDK_ENV_VAR = 'ANDROID_NDK_HOME'

def auto_configure_warning(msg):
    """Output warning message during auto configuration."""
    yellow = "\033[1;33m"
    no_color = "\033[0m"
    print("\n%sWarning:%s %s\n" % (yellow, no_color, msg))


def _impl(ctx):
    if NDK_ENV_VAR in ctx.os.environ:
        ndk_path = ctx.os.environ[NDK_ENV_VAR]
        # This name of the local directory must match the one in ndk16.BUILD
        ctx.symlink(ndk_path, 'local_ndk')
        ctx.symlink(Label('//build_rules:ndk16b.BUILD'), 'BUILD.bazel')
    else:
        auto_configure_warning('NDK not detected, will not be able to build Android targets.' +
                               'Please set the ' + NDK_ENV_VAR + ' environment variable to the NDK path')

ndk_ = repository_rule(
    implementation=_impl,
    local=True)

def configure_local_ndk():
   return ndk_(name="android_ndk")


