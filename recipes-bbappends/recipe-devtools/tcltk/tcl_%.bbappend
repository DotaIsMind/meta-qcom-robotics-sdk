# Rename tcl 9.x config files in the native sysroot ${libdir} to avoid
# conflicts with tcl8-native, which consumers like expect-native depend on
# (via --with-tcl=${STAGING_LIBDIR}). class-native only: the target tcl
# sysroot must keep standard names so that tk and python3 _tkinter build.
SYSROOT_PREPROCESS_FUNCS:append:class-native = " tcl9_sysroot_preprocess"
tcl9_sysroot_preprocess() {
    if [ -f ${SYSROOT_DESTDIR}${libdir}/tclConfig.sh ]; then
        mv ${SYSROOT_DESTDIR}${libdir}/tclConfig.sh \
           ${SYSROOT_DESTDIR}${libdir}/tcl9Config.sh
    fi
    if [ -f ${SYSROOT_DESTDIR}${libdir}/tclooConfig.sh ]; then
        mv ${SYSROOT_DESTDIR}${libdir}/tclooConfig.sh \
           ${SYSROOT_DESTDIR}${libdir}/tcl9ooConfig.sh
    fi
    if [ -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/tcl.pc ]; then
        mv ${SYSROOT_DESTDIR}${libdir}/pkgconfig/tcl.pc \
           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/tcl9.pc
    fi
}
