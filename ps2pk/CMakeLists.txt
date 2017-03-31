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

add_test(ps2pk-pfb ${MIKTEX_PS2PK_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/Symbol.pfb)
add_test(ps2pk-pfb-okay ${DIFF_EXECUTABLE} Symbol10.300pk ${CMAKE_CURRENT_SOURCE_DIR}/Symbol10.300pk.ref)
