# Customize maint.mk.                           -*- makefile -*-
# Copyright (C) 2003-2014 Free Software Foundation, Inc.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Use the direct link.  This is guaranteed to work immediately, while
# it can take a while for the faster mirror links to become usable.
url_dir_list = http://ftp.gnu.org/gnu/$(PACKAGE)

# Used in maint.mk's web-manual rule
manual_title = GNU idutils: ID database utilities

# Tests not to run as part of "make distcheck".
local-checks-to-skip =			\
  sc_bindtextdomain			\
  sc_changelog				\
  sc_prohibit_atoi_atof			\
  sc_prohibit_path_max_allocation

old_NEWS_hash = 0d3506ea3896c9f25ac6965df07bc1dd

-include $(srcdir)/dist-check.mk

update-copyright-env = \
  UPDATE_COPYRIGHT_FORCE=1 \
  UPDATE_COPYRIGHT_USE_INTERVALS=2 \
  UPDATE_COPYRIGHT_MAX_LINE_LENGTH=79

_hv_file = $(srcdir)/testsuite/help-version

exclude_file_name_regexp--sc_cast_of_argument_to_free = ^src/lid\.c$$
exclude_file_name_regexp--sc_program_name = ^testsuite/
exclude_file_name_regexp--sc_prohibit_always_true_header_tests = src/lid\.c$$
exclude_file_name_regexp--sc_prohibit_strcmp = ^libidu/iduglobal\.h$$

config_h_exempt = ^(testsuite/single_file_token_bug\.c|src/lid-[aegl]id\.c)$$
exclude_file_name_regexp--sc_require_config_h = $(config_h_exempt)
exclude_file_name_regexp--sc_require_config_h_first = $(config_h_exempt)

export _gl_TS_headers = lid.h $(srcdir)/../libidu/*.h
export _gl_TS_obj_files = *.$(OBJEXT) ../libidu/*.$(OBJEXT)
