module InstructionDecoder(Instruction, funct3, funct7, opcode, ReadReg1, ReadReg2, WriteReg);

    input [31:0] Instruction;

    output reg [2:0] funct3;
    output reg [6:0] funct7;
    output reg [6:0] opcode;
    output reg [4:0] ReadReg1, ReadReg2, WriteReg;

    always @* begin
        funct3 <= Instruction[14:12];
        funct7 <= Instruction[31:25];
        opcode <= Instruction[6:0];
        ReadReg1 <= Instruction[19:15];
        ReadReg2 <= Instruction[24:20];
        WriteReg <= Instruction[11:7];
    end


endmodule