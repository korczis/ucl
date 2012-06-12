## Process this file with automake to create Makefile.in
#
# Copyright (C) 1996-2002 Markus F.X.J. Oberhumer
#

AUTOMAKE_OPTIONS = 1.4 foreign

SUBDIRS = include src examples

ACLOCAL_AMFLAGS = -I acconfig/m4

EXTRA_DIST = acconfig/ asm/ B/ upx/

dist-hook:
	-rm -f `find ./$(distdir)/ -type l -print`
	@if test -f $(top_srcdir)/maint/dist/dist_hook.sh; then top_srcdir="$(top_srcdir)" top_distdir="$(top_distdir)" distdir="$(distdir)" $(top_srcdir)/maint/dist/dist_hook.sh else :; fi

