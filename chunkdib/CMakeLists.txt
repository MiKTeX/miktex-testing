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

add_test(chunkdib-latex ${MIKTEX_LATEX_EXECUTABLE} sample2e)
add_test(chunkdib-png ${MIKTEX_DVIPNG_EXECUTABLE} -D 300 sample2e)
add_test(chunkdib-bmp ${CONVERT_EXECUTABLE} -flatten sample2e1.png bmp3:sample2e1.bmp)
file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/chunks")
add_test(
  NAME chunkdib-chunks
  COMMAND ${CHUNKDIB_EXECUTABLE} ../sample2e1.bmp
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/chunks"
)
#TODO:
# convert -metric NCC ${CMAKE_CURRENT_BINARY_DIR}/chunks/sample2e1-1-1.bmp ${CMAKE_CURRENT_SOURCE_DIR}/sample2e-300-chunks/sample2e1-1-1.bmp null:
add_test(chunk-dib-diff ${DIFF_EXECUTABLE} "${CMAKE_CURRENT_BINARY_DIR}/chunks" "${CMAKE_CURRENT_SOURCE_DIR}/sample2e-300-chunks")
