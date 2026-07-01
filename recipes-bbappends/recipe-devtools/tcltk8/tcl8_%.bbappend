# Rename tcl8-specific config files in the native sysroot crossscripts to
# avoid conflicts with tcl-native (tcl 9.x) which installs the same filenames
# via binconfig_sysroot_preprocess and SYSROOT_DIRS. class-native only: the
# target tcl8 sysroot does not participate in the conflicting SDK assembly.
SYSROOT_PREPROCESS_FUNCS:append:class-native = " tcl8_sysroot_preprocess"
tcl8_sysroot_preprocess() {
    if [ -f ${SYSROOT_DESTDIR}${bindir_crossscripts}/tclConfig.sh ]; then
        mv ${SYSROOT_DESTDIR}${bindir_crossscripts}/tclConfig.sh \
           ${SYSROOT_DESTDIR}${bindir_crossscripts}/tcl8Config.sh
    fi
    if [ -f ${SYSROOT_DESTDIR}${bindir_crossscripts}/tclooConfig.sh ]; then
        mv ${SYSROOT_DESTDIR}${bindir_crossscripts}/tclooConfig.sh \
           ${SYSROOT_DESTDIR}${bindir_crossscripts}/tcl8ooConfig.sh
    fi
}
