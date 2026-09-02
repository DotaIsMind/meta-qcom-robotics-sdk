# redis 8.0.6 added fast_float as a new dep in DEPENDENCY_TARGETS but the
# meta-oe recipe's do_compile:prepend only builds the older set. Add fast_float.
do_compile:prepend() {
    oe_runmake -C deps fast_float
}
