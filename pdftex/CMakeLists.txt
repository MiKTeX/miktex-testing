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

add_test(pdftex-sample2e ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet sample2e)
add_test(pdftex-sample2e-toppm ${PDFTOPPM_EXECUTABLE} sample2e.pdf sample2e)
if(PDF_COMPARE_VISUALLY)
  add_test(pdftex-sample2e-topng ${CONVERT_EXECUTABLE} -strip sample2e-1.ppm sample2e-1.png)
  add_test(pdftex-sample2e-okay ${DIFF_EXECUTABLE} --binary sample2e-1.png ${CMAKE_CURRENT_SOURCE_DIR}/sample2e-1.png)
endif()

add_test(pdftex-spacy-filename ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" --recorder "a b c")

if(EXISTS "${CMAKE_SOURCE_DIR}/inputs/ABC~1.TEX")
  add_test(pdftex-8-3-filename ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "ABC~1.TEX")
endif()

# SF #1940 tex: wrong \jobname if filename contains a dot 
add_test(pdftex-filename-with-dot ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "sample.2e.tex")
add_test(pdftex-filename-with-dot-check ${MD5SUM_EXECUTABLE} sample.2e.log)

add_test(pdftex-jpeg ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "jpeg.tex")
add_test(pdftex-jpeg-toppm ${PDFTOPPM_EXECUTABLE} jpeg.pdf jpeg)
if(PDF_COMPARE_VISUALLY)
  add_test(pdftex-jpeg-topng ${CONVERT_EXECUTABLE} -strip jpeg-1.ppm jpeg-1.png)
  add_test(pdftex-jpeg-okay ${DIFF_EXECUTABLE} --binary jpeg-1.png ${CMAKE_CURRENT_SOURCE_DIR}/jpeg-1.png)
endif()

# SF #2371 mathchoice in pdftex broken
add_test(pdftex-2371-touch ${TOUCH_EXECUTABLE} -d "2010-10-10 10:10:10" timestamp)
add_test(pdftex-2371-pdftex ${MIKTEX_PDFTEX_EXECUTABLE} -job-time=timestamp -output-format=dvi "${CMAKE_SOURCE_DIR}/bugs/#2371-mathchoice-in-pdftex-broken/test.tex")
if(PDF_COMPARE_VISUALLY)
  add_test(pdftex-2371-okay ${DIFF_EXECUTABLE} --binary test.dvi "${CMAKE_SOURCE_DIR}/bugs/#2371-mathchoice-in-pdftex-broken/test.dvi")
endif()

# SF #2407 lualatex fails with permission denied when trying to input a file open for writing
add_test(pdftex-2407-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} "${CMAKE_SOURCE_DIR}/bugs/#2407-lualatex-fails-with-permission-denied-when-trying-to-input-a-file-open-for-writing/test.tex")

# SF #2427 Problem with package epstopdf
add_test(pdftex-2427-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} "--include-directory=${CMAKE_SOURCE_DIR}/bugs/#2427-problem-with-package-epstopdf" "test.tex")

# SF #2493 pdfcsplain broken
add_test(pdftex-2493-pdfcsplain ${MIKTEX_PDFTEX_EXECUTABLE} "--undump=pdfcsplain" "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "pdfuni-article.tex")

# SF #2570 pdflatex doesn't ignore BOM (byte order mark) 
add_test(pdftex-2570-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "utf8bom.tex")
