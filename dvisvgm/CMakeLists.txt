## CMakeLists.txt:
##
## Copyright (C) 2016 Christian Schenk
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

add_test(dvisvgm-sample2e-latex ${MIKTEX_BINARY_DIR}/latex --quiet sample2e)
add_test(dvisvgm-sample2e-dvisvgm-all-pages ${MIKTEX_BINARY_DIR}/dvisvgm --page=1- sample2e.dvi)

add_test(dvisvgm-pstricks-latex ${MIKTEX_BINARY_DIR}/latex --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" 3d6.tex)
add_test(dvisvgm-pstricks-dvisvgm ${MIKTEX_BINARY_DIR}/dvisvgm 3d6.dvi)
