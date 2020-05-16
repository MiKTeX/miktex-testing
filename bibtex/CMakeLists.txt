## CMakeLists.txt:
##
## Copyright (C) 2016-2020 Christian Schenk
## 
## This file is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published
## by the Free Software Foundation; either version 2, or (at your
## option) any later version.
## 
## This file is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this file; if not, write to the Free Software
## Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
## USA.

# SF #2410 bibtex buffer size exceeded
configure_file(
  "${CMAKE_SOURCE_DIR}/bugs/#2410-bibtex-buffer-size-exceeded/utf8-test.aux"
  "${EXTRA_LONG_DIRECTORY_PATH_WITH_SPACES}/bibtex/utf8-test.aux"
  COPYONLY
)
add_test(bibtex-2410 ${MIKTEX_BIBTEX_EXECUTABLE} "${EXTRA_LONG_DIRECTORY_PATH_WITH_SPACES}/bibtex/utf8-test.aux")
add_test(bibtex-explicit-bib ${MIKTEX_BIBTEX_EXECUTABLE} explicit-bib)
