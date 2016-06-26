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

cmake_minimum_required(VERSION 3.2.1 FATAL_ERROR)

project(miktex-test)

enable_testing()

if (NOT MIKTEX_BINARY_DIR)
  message(FATAL_ERROR "MIKTEX_BINARY_DIR is not set.")
endif()

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
