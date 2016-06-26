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

add_test(dvips-cp1252-latex latex --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "Åre_vapen_eps_cp1252.tex")

# SF #2336 dvips chokes on graphic files with accents
add_test(
  NAME dvips-cp1252-dvips
  COMMAND
    ${MIKTEX_BINARY_DIR}/dvips -o "${CMAKE_CURRENT_BINARY_DIR}/Åre_vapen_eps_cp1252.ps" "${CMAKE_CURRENT_BINARY_DIR}/Åre_vapen_eps_cp1252.dvi"
  WORKING_DIRECTORY
    ${CMAKE_SOURCE_DIR}/inputs
)
