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

add_test(pdftex-sample2e ${MIKTEX_BINARY_DIR}/pdflatex --quiet sample2e)
add_test(pdftex-sample2e-toppm ${MIKTEX_BINARY_DIR}/pdftoppm sample2e.pdf sample2e)
add_test(pdftex-sample2e-topng convert -strip sample2e-1.ppm sample2e-1.png)
add_test(pdftex-sample2e-okay diff --binary sample2e-1.png ${CMAKE_CURRENT_SOURCE_DIR}/sample2e-1.png)

add_test(pdftex-spacy-filename ${MIKTEX_BINARY_DIR}/pdflatex --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" --recorder "a b c")
add_test(pdftex-8-3-filename ${MIKTEX_BINARY_DIR}/pdflatex --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "ABC~1.TEX")

# SF #1940 tex: wrong \jobname if filename contains a dot 
add_test(pdftex-filename-with-dot ${MIKTEX_BINARY_DIR}/pdflatex --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "sample.2e.tex")
add_test(pdftex-filename-with-dot-check md5sum sample.2e.log)

add_test(pdftex-jpeg ${MIKTEX_BINARY_DIR}/pdflatex --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "jpeg.tex")
add_test(pdftex-jpeg-toppm ${MIKTEX_BINARY_DIR}/pdftoppm jpeg.pdf jpeg)
add_test(pdftex-jpeg-topng convert -strip jpeg-1.ppm jpeg-1.png)
add_test(pdftex-jpeg-okay diff --binary jpeg-1.png ${CMAKE_CURRENT_SOURCE_DIR}/jpeg-1.png)

# SF #2371 mathchoice in pdftex broken
add_test(pdftex-2371-touch touch -d "2010-10-10 10:10:10" timestamp)
add_test(pdftex-2371-pdftex ${MIKTEX_BINARY_DIR}/pdftex -job-time=timestamp -output-format=dvi "${CMAKE_SOURCE_DIR}/bugs/#2371-mathchoice-in-pdftex-broken/test.tex")
add_test(pdftex-2371-okay diff --binary test.dvi "${CMAKE_SOURCE_DIR}/bugs/#2371-mathchoice-in-pdftex-broken/test.dvi")

# SF #2407 lualatex fails with permission denied when trying to input a file open for writing
add_test(pdftex-2407-pdflatex ${MIKTEX_BINARY_DIR}/pdflatex "${CMAKE_SOURCE_DIR}/bugs/#2407-lualatex-fails-with-permission-denied-when-trying-to-input-a-file-open-for-writing/test.tex")

# SF #2427 Problem with package epstopdf
add_test(pdftex-2427-pdflatex ${MIKTEX_BINARY_DIR}/pdflatex "--include-directory=${CMAKE_SOURCE_DIR}/bugs/#2427-problem-with-package-epstopdf" "test.tex")

# SF #2493 pdfcsplain broken
add_test(pdftex-2493-pdfcsplain ${MIKTEX_BINARY_DIR}/pdfcsplain "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "pdfuni-article.tex")
