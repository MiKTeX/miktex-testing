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

add_test(xetex-sample2e ${MIKTEX_XELATEX_EXECUTABLE} --quiet sample2e)
add_test(xetex-sample2e-toppm ${PDFTOPPM_EXECUTABLE} sample2e.pdf sample2e)
add_test(xetex-sample2e-topng ${CONVERT_EXECUTABLE} -strip sample2e-1.ppm sample2e-1.png)
if(PDF_COMPARE_VISUALLY)
  add_test(xetex-sample2e-okay ${DIFF_EXECUTABLE} --binary sample2e-1.png ${CMAKE_CURRENT_SOURCE_DIR}/sample2e-1.png)
endif()

# SF #2352 miktex-xetex and file names with spaces 
add_test(xetex-spacy-filename ${MIKTEX_XELATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "a b c")

add_test(xetex-jpeg ${MIKTEX_XELATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "jpeg.tex")
add_test(xetex-jpeg-toppm ${PDFTOPPM_EXECUTABLE} jpeg.pdf jpeg)
add_test(xetex-jpeg-topng ${CONVERT_EXECUTABLE} -strip jpeg-1.ppm jpeg-1.png)
if(PDF_COMPARE_VISUALLY)
  add_test(xetex-jpeg-okay ${DIFF_EXECUTABLE} --binary jpeg-1.png ${CMAKE_CURRENT_SOURCE_DIR}/jpeg-1.png)
endif()

add_test(xetex-fontspec-lmodern ${MIKTEX_XELATEX_EXECUTABLE} "--include-directory=${CMAKE_SOURCE_DIR}/inputs" fontspec-lmodern.tex)
add_test(xetex-fontspec-lmodern-toppm ${PDFTOPPM_EXECUTABLE} fontspec-lmodern.pdf fontspec-lmodern)
add_test(xetex-fontspec-lmodern-topng ${CONVERT_EXECUTABLE} -strip fontspec-lmodern-1.ppm fontspec-lmodern-1.png)
if(PDF_COMPARE_VISUALLY)
  add_test(xetex-fontspec-lmodern-okay ${DIFF_EXECUTABLE} --binary fontspec-lmodern-1.png ${CMAKE_CURRENT_SOURCE_DIR}/fontspec-lmodern-1.good.png)
endif()

# SF #2379 File Name Issues with XeLaTeX 3.14159265-2.6-0.99992 (MiKTeX 2.9)
add_test(xetex-pdf-utf8 ${MIKTEX_XELATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "Åre_vapen_pdf_utf8.tex")
add_test(xetex-pdf-utf8-toppm ${PDFTOPPM_EXECUTABLE} Åre_vapen_pdf_utf8.pdf Åre_vapen_pdf_utf8)
add_test(xetex-pdf-utf8-topng ${CONVERT_EXECUTABLE} -strip Åre_vapen_pdf_utf8-1.ppm Åre_vapen_pdf_utf8-1.png)

# SF #2407 lualatex fails with permission denied when trying to input a file open for writing
add_test(xetex-2407-xelatex ${MIKTEX_XELATEX_EXECUTABLE} "${CMAKE_SOURCE_DIR}/bugs/#2407-lualatex-fails-with-permission-denied-when-trying-to-input-a-file-open-for-writing/test.tex")

# SF #2565 miktex-NAME.exe "-aux-directory=DIR" and "-output-directory=DIR" options suddenly conflict
add_test(xetex-2565-xelatex ${MIKTEX_XELATEX_EXECUTABLE} -aux-directory=auxfiles -output-directory=outfiles --synctex=1 sample2e.tex)
add_test(xetex-2565-auxfiles ${MD5SUM_EXECUTABLE} auxfiles/sample2e.aux auxfiles/sample2e.log)
add_test(xetex-2565-outfiles ${MD5SUM_EXECUTABLE} outfiles/sample2e.pdf outfiles/sample2e.synctex.gz)

# SF #2563 Incompatibiliy between blindtext and listings(tcolorbox)/hyperref
add_test(xetex-2563-xelatex ${MIKTEX_XELATEX_EXECUTABLE} "${CMAKE_SOURCE_DIR}/bugs/#2563-incompatibiliy-between-blindtext-and-listings(tcolorbox)-hyperref/test.tex")
