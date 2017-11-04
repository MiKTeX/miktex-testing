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

# SF #2350 tex4ht doesn't find fonts in some folders
configure_file(
  "${CMAKE_SOURCE_DIR}/bugs/#2350-tex4ht-doesnt-find-fonts-in-some-folders/mtest.tex"
  mtest.tex
  COPYONLY
)
configure_file(
  "${CMAKE_SOURCE_DIR}/bugs/#2350-tex4ht-doesnt-find-fonts-in-some-folders/test.tex"
  test.tex
  COPYONLY
)
add_test(tex4ht-2350-htlatex ${HTLATEX_EXECUTABLE} mtest "html" " -cunihtf")
add_test(tex4ht-2350-mtest-okay ${DIFF_EXECUTABLE} --strip-trailing-cr mtest.html ${CMAKE_CURRENT_SOURCE_DIR}/mtest.good.html)
add_test(tex4ht-2350-make4ht ${MAKE4HT_EXECUTABLE} test "xhtml,charset=utf-8" " -cunihtf -utf8")
add_test(tex4ht-2350-test-okay ${DIFF_EXECUTABLE} --strip-trailing-cr test.html ${CMAKE_CURRENT_SOURCE_DIR}/test.good.html)

# SF #2505 htlatex.exe removes quotes
add_test(tex4ht-2505-htlatex ${HTLATEX_EXECUTABLE} mtest "xhtml,ooffice" "ooffice/! -cmozhtf" "-coo -cvalidate")
add_test(tex4ht-2505-unzip ${UNZIP_EXECUTABLE} -t mtest.odt)
