#!/bin/bash

SIM_DIR='./sim'
SRC_DIR='./src'
SIM_FILE_LIST='../src/COMPLIST'
TESTBENCH_FILE='./testbenches/DLX_tb.vhd'
DESIGN='work.csd_tb'

# Functions to print colored messages
print_green() {
    local message=$1
    echo -e "\e[1;32m${message}\e[0m"
}
print_red() {
    local message=$1
    echo -e "\e[1;31m${message}\e[0m"
}

# Sim folder
echo "[INFO] Simulation folder setup"
if [ ! -d "$SIM_DIR" ]; then
    echo "[INFO] Creating simulation folder"
    mkdir -p "$SIM_DIR"
    echo "[INFO] Copying sources from $SRC_DIR"
    echo "$TESTBENCH_FILE" >>"$SIM_FILE_LIST"
    cp -r $SRC_DIR/* $SIM_DIR/
else
    cp -r --update $SRC_DIR/* $SIM_DIR/
fi
cd "$SIM_DIR"
print_green "[DONE] Simulation folder setup"

# Compile
echo "[INFO] Compiling sources"
vcom -F "$SIM_FILE_LIST"
if [ $? -ne 0 ]; then
    print_red "[ERROR] Compiling sources"
    exit 1
fi
print_green "[DONE] Compiling sources"

# Simulation
echo "[INFO] Opening vsim"
if ps aux | grep -q [v]sim; then
    print_red "[ERROR] Opening vsim"
    exit 1
else
    setsid vsim -t 1ns ${DESIGN}
    print_green "[DONE]"
fi
