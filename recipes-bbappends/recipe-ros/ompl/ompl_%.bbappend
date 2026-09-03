FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-build-remove-boost-system.patch"
SRC_URI:remove = "file://0001-FindPython.cmake-install_python-Allow-to-set-differe.patch"

# Fix hosttools/python3 shebangs in demo scripts so the installed package does
# not carry a dependency on a build-time path that does not exist on target.
do_install:append() {
    find ${D}${ros_prefix}/share/ompl/demos -type f -name "*.py" | while read f; do
        sed -i "1s|#!.*python3|#!/usr/bin/env python3|" "$f"
    done
    find ${D}${ros_prefix}/bin -type f -name "*.py" | while read f; do
        sed -i "1s|#!.*python3|#!/usr/bin/env python3|" "$f"
    done
}

# .pc and .cmake in ompl-dev embed build-time TMPDIR paths; these are
# dev artefacts that do not affect runtime correctness.
INSANE_SKIP:${PN}     += "buildpaths file-rdeps"
INSANE_SKIP:${PN}-dev += "buildpaths"