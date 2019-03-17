SHELL = /bin/bash

all: bitstream-av

arty:
	@pushd litex; \
	python3 litex/boards/targets/arty.py --cpu-type vexriscv  --csr-csv `pwd`/csr.csv --with-ethernet --cpu-variant jtag; \
	popd

verilog: update-cpu
	@pushd litex; \
	rm -rf build; \
	python3 ../avalanche/avalanche.py --csr-csv `pwd`/csr.csv;  \
	popd

bitstream-av: verilog

	./fixmem.sh litex/build/gateware/mem.init
	./libero-polar.sh litex/build/gateware top.tcl

flash-av:

	./libero-polar.sh . flash.tcl

update-cpu:

	pushd litex/litex/soc/cores/cpu/vexriscv/verilog && sbt "run-main vexriscv.GenCoreDefault" && popd

