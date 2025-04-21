#!/bin/bash

EXEC=./DrudeAl_AMTsolver_L51.out
radios=(1 5 10 20 30 50)
mkdir -p run

generate_cmds() {
  for a in "${radios[@]}"; do
    echo "$EXEC --vscan -a $a > run/log_a${a}_vscan.txt 2>&1"
    echo "$EXEC --bscan -a $a > run/log_a${a}_bscan.txt 2>&1"
  done
}

# Usamos GNU parallel con 4 procesos en paralelo
generate_cmds | parallel -j4

