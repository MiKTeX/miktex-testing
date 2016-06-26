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

# SF #2350 tex4ht doesn't find fonts in some folders
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/mtest.tex
  mtest.tex
  COPYONLY
)
add_test(tex4ht-2350-htlatex ${MIKTEX_BINARY_DIR}/htlatex mtest "html" " -cunihtf")
add_test(tex4ht-2350-grep grep "Hallo Welt" mtest.html)

# SF #2505 htlatex.exe removes quotes
add_test(tex4ht-2505-htlatex ${MIKTEX_BINARY_DIR}/htlatex mtest "xhtml,ooffice" "ooffice/! -cmozhtf" "-coo -cvalidate")
add_test(tex4ht-2505-unzip unzip -t mtest.odt)
