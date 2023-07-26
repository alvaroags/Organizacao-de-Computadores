module PC(clock, reset, PCin, PCOut);



    initial begin
        PCOut = 32'b0;
    end

    input clock, reset;
    input [31:0] PCin;
    output reg [31:0] PCOut;

    always @(posedge clock) begin
        if (~reset) begin
            PCOut <= 32'b0;
        end else begin
            PCOut <= PCin;
        end
    end

endmodule

module PCADD4(PCin, PCADD4);

    input [31:0] PCin;
    output reg [31:0] PCADD4;

    always @* begin
        PCADD4 = PCin + 32'b100;
    end

endmodule

module PCSUM(PCin, ImmGen, PCSum, Neg);

    input [31:0] PCin, ImmGen;
    input Neg;
    output reg [31:0] PCSum;

    always @* begin
        if (Neg == 1'b1) begin
            PCSum = PCin - ImmGen;
        end else begin
            PCSum = PCin + ImmGen;
        end
    end
endmodule