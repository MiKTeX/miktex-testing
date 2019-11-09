## CMakeLists.txt:
##
## Copyright (C) 2016-2019 Christian Schenk
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

project(miktex-testing LANGUAGES NONE)

enable_testing()

option(
  DVI_COMPARE_VISUALLY
  "Compare resulting DVI files visually with a test reference."
  TRUE
)

option(
  PDF_COMPARE_VISUALLY
  "Compare resulting PDF files visually with a test reference."
  TRUE
)

if(MIKTEX_BINARY_DIR)
  set(bindir_guess ${MIKTEX_BINARY_DIR})
elseif(WIN32)
  set(bindir_guess "C:/Program Files/MiKTeX 2.9")
else()
  set(bindir_guess "/usr/local/bin")
endif()

set(miktex_executables
  initexmf
  miktex-bibtex
  miktex-dvipng
  miktex-dvips
  miktex-dvisvgm
  miktex-epstopdf
  miktex-luahbtex
  miktex-latex
  miktex-lualatex
  miktex-makeindex
  miktex-mpost
  miktex-pdflatex
  miktex-pdftex
  miktex-ps2pk
  miktex-xelatex
)

foreach(exe ${miktex_executables})
  string(REPLACE "-" "_" exe_ "${exe}")
  string(TOUPPER "${exe_}" EXE)
  find_program(${EXE}_EXECUTABLE
    NAMES ${exe}
    PATHS ${bindir_guess}
  )
  if(NOT ${EXE}_EXECUTABLE)
    message(FATAL_ERROR "The MiKTeX executable ${exe} does no exist.")
  endif()
endforeach()

set(script_wrappers
  htlatex
  make4ht
)

#TODO:
#set(nodist_executables
#  chunkdib
#)

foreach(exe ${script_wrappers} ${nodist_executables})
  string(TOUPPER "${exe}" EXE)
  find_program(${EXE}_EXECUTABLE
    NAMES ${exe}
    PATHS ${bindir_guess}
  )
endforeach()

set(required_programs
  diff
  gzip
  md5sum
  pdfinfo
  pdftoppm
  touch
  unzip
)

if(EXISTS ${CHUNKDIB_EXECUTABLE})
  list(APPEND required_programs
    convert
  )
endif()

foreach(exe ${required_programs})
  string(TOUPPER "${exe}" EXE)
  find_program(${EXE}_EXECUTABLE
    NAMES ${exe}
    PATHS ${bindir_guess}
  )
  if(NOT ${EXE}_EXECUTABLE)
    message(FATAL_ERROR "The program ${exe} could not be found.")
  endif()
endforeach()

add_test(initexmf-report ${INITEXMF_EXECUTABLE} --report)

add_subdirectory(makeindex)
add_subdirectory(ps2pk)
add_subdirectory(dvips)
add_subdirectory(dvisvgm)
add_subdirectory(pdftex)
add_subdirectory(luatex)
add_subdirectory(xetex)
if(EXISTS ${HTLATEX_EXECUTABLE})
  add_subdirectory(tex4ht)
endif()
if(EXISTS ${CHUNKDIB_EXECUTABLE})
  add_subdirectory(chunkdib)
endif()
add_subdirectory(bibtex)
add_subdirectory(synctex)
add_subdirectory(epstopdf)
add_subdirectory(mpost)
#add_subdirectory(luahbtex)
