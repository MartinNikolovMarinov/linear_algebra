#!/bin/bash

declare -a sections
readarray -t sections < <(find ./sections | grep .tex)
files=("./init.bib" "./init.tex" ${sections[*]})

echo ${files[*]} | tr ' ' '\n'