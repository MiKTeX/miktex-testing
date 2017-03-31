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

cmake_minimum_required(VERSION 3.2.1 FATAL_ERROR)

project(miktex-testing)

enable_testing()

if (NOT MIKTEX_BINARY_DIR)
  find_program(MIKTEX_PDFTEX_EXECUTABLE NAMES miktex-pdftex)
  get_filename_component(MIKTEX_BINARY_DIR ${MIKTEX_PDFTEX_EXECUTABLE} DIRECTORY CACHE)
endif()

set(required_programs
  convert
  diff
  gzip
  md5sum
  pandoc
  unzip
)

foreach(p ${required_programs})
  string(TOUPPER "${p}" p_u)
  find_program(${p_u}_EXECUTABLE NAMES ${p})
  if(NOT ${p_u}_EXECUTABLE)
    message(FATAL_ERROR "The program ${p} could not be found.")
  endif()
endforeach()

add_test(initexmf-report ${MIKTEX_BINARY_DIR}/initexmf --report)

add_subdirectory(makeindex)
add_subdirectory(ps2pk)
add_subdirectory(dvips)
add_subdirectory(dvisvgm)
add_subdirectory(pdftex)
add_subdirectory(luatex)
add_subdirectory(xetex)
add_subdirectory(tex4ht)
add_subdirectory(chunkdib)
add_subdirectory(bibtex)
add_subdirectory(synctex)
add_subdirectory(epstopdf)
