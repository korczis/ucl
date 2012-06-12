## Process this file with automake to create Makefile.in
#
# Copyright (C) 1996-2002 Markus F.X.J. Oberhumer
#

INCLUDES = -I$(top_srcdir)/include
CFLAGS = @CFLAGS@ $(CFLAGS_O) $(CFLAGS_W)

noinst_PROGRAMS = simple uclpack

LDADD = $(libucl)
simple_DEPENDENCIES = $(libucl)
uclpack_DEPENDENCIES = $(libucl)

EXTRA_DIST = lutil.h

@libucl@:
	cd $(top_builddir)/src && $(MAKE) all

