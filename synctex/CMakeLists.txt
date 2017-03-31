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

# SF #2503 synxtex error with unicode filename
add_test(synctex-2503-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" --synctex=1 tèst.tex)
add_test(synctex-2503-gunzip ${GZIP_EXECUTABLE} --decompress --stdout tèst.synctex.gz)
