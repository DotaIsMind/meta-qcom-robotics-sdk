# fmt is built with BUILD_SHARED_LIBS=ON so fmt-staticdev is an empty package.
# ALLOW_EMPTY ensures the RPM is still written so TOOLCHAIN_TARGET_TASK can
# reference fmt-staticdev without dnf failing to find it.
ALLOW_EMPTY:${PN}-staticdev = "1"
