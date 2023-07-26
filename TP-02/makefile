all:
	iverilog -o testbench testBench.v
	vvp testbench

gtk:
	iverilog -o testbench testBench.v
	vvp testbench
	gtkwave RiscV.vcd
py:
	python3 montador.py