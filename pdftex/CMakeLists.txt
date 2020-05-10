## CMakeLists.txt:
##
## Copyright (C) 2016-2020 Christian Schenk
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
  add_test(pdftex-sample2e-okay ${MD5SUM_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/sample2e-1.ppm.md5)
endif()

add_test(pdftex-spacy-filename ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" --recorder "a b c")

# SF #1940 tex: wrong \jobname if filename contains a dot 
add_test(pdftex-filename-with-dot ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "sample.2e.tex")
if(PDF_COMPARE_VISUALLY)
  add_test(pdftex-filename-with-dot-check ${MD5SUM_EXECUTABLE} sample.2e.log)
endif()

add_test(pdftex-jpeg ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "jpeg.tex")
add_test(pdftex-jpeg-toppm ${PDFTOPPM_EXECUTABLE} jpeg.pdf jpeg)
add_test(pdftex-jpeg-okay ${MD5SUM_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/jpeg-1.ppm.md5)

# SF #2371 mathchoice in pdftex broken
add_test(pdftex-2371-touch ${TOUCH_EXECUTABLE} -t "201010101010.10" timestamp)
add_test(pdftex-2371-pdftex ${MIKTEX_PDFTEX_EXECUTABLE} --quiet -job-time=timestamp -output-format=dvi "${CMAKE_SOURCE_DIR}/bugs/#2371-mathchoice-in-pdftex-broken/test.tex")
if(DVI_COMPARE_VISUALLY)
  add_test(pdftex-2371-okay ${DIFF_EXECUTABLE} --binary test.dvi "${CMAKE_SOURCE_DIR}/bugs/#2371-mathchoice-in-pdftex-broken/test.dvi")
endif()

# SF #2407 lualatex fails with permission denied when trying to input a file open for writing
add_test(pdftex-2407-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "${CMAKE_SOURCE_DIR}/bugs/#2407-lualatex-fails-with-permission-denied-when-trying-to-input-a-file-open-for-writing/test.tex")

# SF #2427 Problem with package epstopdf
add_test(pdftex-2427-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/bugs/#2427-problem-with-package-epstopdf" "test.tex")

# SF #2493 pdfcsplain broken
add_test(pdftex-2493-pdfcsplain ${MIKTEX_PDFTEX_EXECUTABLE} --quiet "--undump=pdfcsplain" "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "pdfuni-article.tex")

# SF #2570 pdflatex doesn't ignore BOM (byte order mark)
add_test(pdftex-2570-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "utf8bom.tex")

# SF #2605 "pdfSyntax Error (441): Unknown filter 'DCTDecode'"
# TODO: grep for poppler error message: "Unknown filter 'DCTDecode'"
add_test(pdftex-2605-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/bugs/#2605-unknown-filter-dctdecode" "--include-directory=${CMAKE_SOURCE_DIR}/inputs" "pdfmitjpg.tex")
add_test(pdftex-2605-pdflatex-2 ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/bugs/#2605-unknown-filter-dctdecode" "test.tex")

# GH #20 pdfLaTeX crashes on file inclusion
add_test(pdftex-20-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/bugs/#20-pdflatex-crashes-on-file-inclusion" "test.tex")

# TL mailing list 2018-05-10: "TL2018: Problems with filenames"
add_test(pdftex-utf8-pdflatex ${MIKTEX_PDFLATEX_EXECUTABLE} --quiet "--include-directory=${CMAKE_SOURCE_DIR}/inputs" Begrüßung.tex)
