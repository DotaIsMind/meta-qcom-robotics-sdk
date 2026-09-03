# oe-core ace4d721 python_pep517 uses pyproject-build --no-isolation,
# which checks pyproject.toml build-system.requires are installed in
# sysroot-native before compiling. python3-distlib declares
# wheel>=0.29.0 as a build requirement; add python3-wheel-native to
# DEPENDS so it lands in recipe-sysroot-native.
DEPENDS:append = " python3-wheel-native"
