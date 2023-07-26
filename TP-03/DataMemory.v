module DataMemory(clock, reset, Address, WriteData, ReadData, Write, Read);

    input wire clock, reset, Write, Read;
    input [31:0] Address, WriteData;
    output reg [31:0] ReadData;
    reg [31:0] Mem[0:31];

    always @(posedge clock) begin
        if (~reset) begin
            ReadData <= 32'b0;
        end else if (Write) begin
            Mem[Address] <= WriteData;
        end else if (Read) begin
            ReadData <= Mem[Address];
        end
    end
	 
endmodule