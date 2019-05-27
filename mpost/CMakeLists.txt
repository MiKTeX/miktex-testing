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

configure_file(
  "${CMAKE_SOURCE_DIR}/inputs/example.mp"
  example.mp
  COPYONLY
)
add_test(mpost-example ${MIKTEX_MPOST_EXECUTABLE} example.mp)

# SF #2449 MetaPost won't use text
configure_file(
  "${CMAKE_SOURCE_DIR}/bugs/#2449-metapost-wont-use-text/test.mp"
  test.mp
  COPYONLY
)
add_test(mpost-2449-mpost ${MIKTEX_MPOST_EXECUTABLE} test.mp)
