`timescale 1ns / 100ps
`include "Riscv.v"

module testBench();
    wire clk, reset;
    wire [31:0]Result, PC_Output;
    wire [31:0]Instruction;
    wire [31:0]x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31;


    Clock clock_0(
        .clock(clk)
    );

    Riscv tb( 
        .clk(clk),
        .reset(reset), 
        .Instruction(Instruction), 
        .Result(Result), 
        .PCOut(PC_Output),
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .x5(x5),
        .x6(x6),
        .x7(x7),
        .x8(x8),
        .x9(x9),
        .x10(x10),
        .x11(x11),
        .x12(x12),
        .x13(x13),
        .x14(x14),
        .x15(x15),
        .x16(x16),
        .x17(x17),
        .x18(x18),
        .x19(x19),
        .x20(x20),
        .x21(x21),
        .x22(x22),
        .x23(x23),
        .x24(x24),
        .x25(x25),
        .x26(x26),
        .x27(x27),
        .x28(x28),
        .x29(x29),
        .x30(x30),
        .x31(x31)
    );

    /*riscv RP1(
        .clk(clk),
        .reset(reset)
    );*/

    initial
    begin

        
        $dumpfile("Riscv.vcd");
        $dumpvars(0, testBench);
        $display("teste");

        #30000
        $display("Registrador 0:  %d", x0);
        $display("Registrador 1:  %d", x1);
        $display("Registrador 2:  %d", x2);
        $display("Registrador 3:  %d", x3);
        $display("Registrador 4:  %d", x4);
        $display("Registrador 5:  %d", x5);
        $display("Registrador 6:  %d", x6);
        $display("Registrador 7:  %d", x7);
        $display("Registrador 8:  %d", x8);
        $display("Registrador 9:  %d", x9);
        $display("Registrador 10: %d", x10);
        $display("Registrador 11: %d", x11);
        $display("Registrador 12: %d", x12);
        $display("Registrador 13: %d", x13);
        $display("Registrador 14: %d", x14);
        $display("Registrador 15: %d", x15);
        $display("Registrador 16: %d", x16);
        $display("Registrador 17: %d", x17);
        $display("Registrador 18: %d", x18);
        $display("Registrador 19: %d", x19);
        $display("Registrador 20: %d", x20);
        $display("Registrador 21: %d", x21);
        $display("Registrador 22: %d", x22);
        $display("Registrador 23: %d", x23);
        $display("Registrador 24: %d", x24);
        $display("Registrador 25: %d", x25);
        $display("Registrador 26: %d", x26);
        $display("Registrador 27: %d", x27);
        $display("Registrador 28: %d", x28);
        $display("Registrador 29: %d", x29);
        $display("Registrador 30: %d", x30);
        $display("Registrador 31: %d", x31);

        $finish;
        
        /*clk = 1'b0;
        reset = 1'b1;
        
        #10 reset = 1'b0;*/
    end
	
endmodule