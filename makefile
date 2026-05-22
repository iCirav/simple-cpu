# simple-cpu Makefile

PROJECT = simple-cpu

SRC_DIR = src
TB_DIR = tb
BUILD_DIR = build
SIM_DIR = sim

TOP = top
TB = cpu_tb

.PHONY: all build upload sim clean dirs

all: build

dirs:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(SIM_DIR)

build: dirs
	apio build

upload: build
	apio upload

sim: dirs
	iverilog -g2012 -o $(SIM_DIR)/$(TB).out \
		$(TB_DIR)/$(TB).v \
		$(SRC_DIR)/*.v
	vvp $(SIM_DIR)/$(TB).out

wave:
	gtkwave $(SIM_DIR)/$(TB).vcd

clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(SIM_DIR)
	rm -f *.vcd
	rm -f *.out