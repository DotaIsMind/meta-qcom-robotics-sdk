# pandoc is not available in this build environment. The autotools conditional
# HAVE_PANDOC=false correctly sets PANDOC="" but make still tries to build
# dist_man_MANS targets using the empty $(PANDOC) variable. Supply a no-op
# PANDOC so man page generation silently produces empty files instead of
# failing with exit 127.
EXTRA_OEMAKE:append = " PANDOC='true'"
