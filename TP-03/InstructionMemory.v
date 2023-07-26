module InstructionMemory(clock, reset, ReadAddress, Instruction);

    input wire clock, reset;
    input [31:0] ReadAddress;
    output reg [31:0] Instruction;
    reg [31:0] InstructionMemory[0:7];

    always @(posedge clock) begin
        if (~reset) begin
            $readmemb("instrucoes.bin", InstructionMemory);
        end else begin
				Instruction = InstructionMemory[ReadAddress/4];
		  end
    end

    initial begin
        $readmemb("instrucoes.bin", InstructionMemory);
    end

endmodule