module InstructionMemory(clock, reset, ReadAddress, Instruction);

    input wire clock, reset;
    input [31:0] ReadAddress;
    output reg [31:0] Instruction;
    reg [31:0] InstructionMemory[0:9];

    always @(posedge clock) begin
        if (reset) begin
            Instruction <= 32'b0;
        end
    end

    always @(ReadAddress) begin
        Instruction = InstructionMemory[ReadAddress/4];
    end

    initial begin
        $readmemb("Instrucoes.bin", InstructionMemory);
    end



endmodule