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

add_test(luatex-sample2e ${MIKTEX_BINARY_DIR}/lualatex sample2e)
add_test(luatex-sample2e-toppm ${MIKTEX_BINARY_DIR}/pdftoppm sample2e.pdf sample2e)
add_test(luatex-sample2e-topng convert -strip sample2e-1.ppm sample2e-1.png)
add_test(luatex-sample2e-okay diff --binary sample2e-1.png ${CMAKE_CURRENT_SOURCE_DIR}/sample2e-1.png)

add_test(
  NAME
    luatex-output-directory
  COMMAND
    ${MIKTEX_BINARY_DIR}/lualatex "--output-directory=${CMAKE_CURRENT_BINARY_DIR}" sample2e
  WORKING_DIRECTORY
    ${CMAKE_BINARY_DIR}
)

add_test(luatex-spacy-filename ${MIKTEX_BINARY_DIR}/lualatex "${CMAKE_SOURCE_DIR}/inputs/a b c")

#add_test(luatex-jpeg lualatex --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "jpeg.tex")
#add_test(luatex-jpeg-toppm ${MIKTEX_BINARY_DIR}/pdftoppm jpeg.pdf jpeg)
#add_test(luatex-jpeg-topng convert -strip jpeg-1.ppm jpeg-1.png)
#add_test(luatex-jpeg-okay diff --binary jpeg-1.png ${CMAKE_CURRENT_SOURCE_DIR}/jpeg-1.png)

# SF #2361 Bug in lualatex with ragged2e package and \mathrm fixed 
add_test(luatex-2361-lualatex ${MIKTEX_BINARY_DIR}/lualatex "${CMAKE_SOURCE_DIR}/bugs/#2361-bug-in-lualatex-with-ragged2e-package-and-mathrm-fixed/2361.tex")
add_test(luatex-2361-toppm ${MIKTEX_BINARY_DIR}/pdftoppm 2361.pdf 2361)
add_test(luatex-2361-topng convert -strip 2361-1.ppm 2361-1.png)
add_test(luatex-2361-okay diff --binary 2361-1.png ${CMAKE_CURRENT_SOURCE_DIR}/2361-1.png)

# SF #2407 lualatex fails with permission denied when trying to input a file open for writing
add_test(luatex-2407-lualatex ${MIKTEX_BINARY_DIR}/lualatex "${CMAKE_SOURCE_DIR}/bugs/#2407-lualatex-fails-with-permission-denied-when-trying-to-input-a-file-open-for-writing/test.tex")
