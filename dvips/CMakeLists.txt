## CMakeLists.txt:
##
## Copyright (C) 2016-2017 Christian Schenk
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

add_test(dvips-sample2e-latex ${MIKTEX_LATEX_EXECUTABLE} --quiet sample2e)
add_test(dvips-sample2e-dvips ${MIKTEX_DVIPS_EXECUTABLE} -t a4 sample2e)

# SF #2336 dvips chokes on graphic files with accents
if(MIKTEX_NATIVE_WINDOWS)
  add_test(dvips-cp1252-latex ${MIKTEX_LATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "Åre_vapen_eps_cp1252.tex")
  add_test(
    NAME dvips-cp1252-dvips
    COMMAND
      ${MIKTEX_DVIPS_EXECUTABLE} -o "${CMAKE_CURRENT_BINARY_DIR}/Åre_vapen_eps_cp1252.ps" "${CMAKE_CURRENT_BINARY_DIR}/Åre_vapen_eps_cp1252.dvi"
    WORKING_DIRECTORY
      ${CMAKE_SOURCE_DIR}/inputs
  )
endif()
