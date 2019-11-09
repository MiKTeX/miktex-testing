## CMakeLists.txt:
##
## Copyright (C) 2019 Christian Schenk
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

add_test(luahbtex-sample2e ${MIKTEX_LUAHBLATEX_EXECUTABLE} --halt-on-error sample2e)
add_test(luahbtex-sample2e-toppm ${PDFTOPPM_EXECUTABLE} sample2e.pdf sample2e)
if(PDF_COMPARE_VISUALLY)
  add_test(luahbtex-sample2e-okay ${MD5SUM_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/sample2e-1.ppm.md5)
endif()
