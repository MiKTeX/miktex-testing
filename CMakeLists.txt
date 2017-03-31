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

set(MIKTEX_BIBTEX_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-bibtex)
set(MIKTEX_DVIPS_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-dvips)
set(MIKTEX_DVISVGM_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-dvisvgm)
set(MIKTEX_EPSTOPDF_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-epstopdf)
set(MIKTEX_HTLATEX_EXECUTABLE ${MIKTEX_BINARY_DIR}/htlatex)
set(MIKTEX_INITEXMF_EXECUTABLE ${MIKTEX_BINARY_DIR}/initexmf)
set(MIKTEX_LATEX_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-latex)
set(MIKTEX_LUALATEX_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-lualatex)
set(MIKTEX_MAKE4HT_EXECUTABLE ${MIKTEX_BINARY_DIR}/make4ht)
set(MIKTEX_MAKEINDEX_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-makeindex)
set(MIKTEX_MPOST_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-mpost)
set(MIKTEX_PDFINFO_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-pdfinfo)
set(MIKTEX_PDFLATEX_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-pdflatex)
set(MIKTEX_PDFTEX_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-pdftex)
set(MIKTEX_PDFTOPPM_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-pdftoppm)
set(MIKTEX_PS2PK_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-ps2pk)
set(MIKTEX_XELATEX_EXECUTABLE ${MIKTEX_BINARY_DIR}/miktex-xelatex)

set(required_programs
  convert
  diff
  gzip
  md5sum
  pandoc
  touch
  unzip
)

foreach(p ${required_programs})
  string(TOUPPER "${p}" p_u)
  find_program(${p_u}_EXECUTABLE NAMES ${p})
  if(NOT ${p_u}_EXECUTABLE)
    message(FATAL_ERROR "The program ${p} could not be found.")
  endif()
endforeach()

add_test(initexmf-report ${MIKTEX_INITEXMF_EXECUTABLE} --report)

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
