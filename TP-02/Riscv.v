`include "ALU.v"
`include "ALUControl.v"
`include "Clock.v"
`include "Control.v"
`include "DataMemory.v"
`include "ImmGen.v"
`include "InstructionMemory.v"
`include "JumpControl.v"
`include "MuxALU.v"
`include "MuxDataMemory.v"
`include "MuxJump.v"
`include "PC.v"
`include "RegisterFile.v"
`include "InstructionDecoder.v"

module Riscv(clk, reset, Instruction, Result, PCOut, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31);

    input clk, reset;
    output wire [31:0] Result;
    output wire [31:0] PCOut;
    output wire [31:0] Instruction;
    output wire [31:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31;

    //INSTRUCAO
    wire [2:0] Funct3;
    wire [6:0] Opcode;
    wire [31:0] ReadAddress;
    wire [31:0] ImmGenOut;
    wire [6:0] Funct7;
    wire [4:0] ReadReg1, ReadReg2, WriteReg;

    // ALU
    wire [31:0] ReadData1, ReadData2;
    wire [3:0] Operation;
    wire Zero;
    wire [31:0] SaidaMuxALU;

    // ALUControl
    wire [2:0] ALUOP;
    // Control
    wire BranchNotZero, BranchZero, MemRead, MemWrite, RegWrite, ALUSrc, WriteSrc;
    // DataMemory
    wire [31:0] ReadData;
    wire Write, Read;
    // ImmGen
    // InstructionMemory
    // JumpControl
    wire JumpControl;
    // PC
    wire [31:0] PCin, PCSum, PCADD4;
    // RegisterFile
    wire [31:0] WriteData;

    InstructionDecoder InstructionDecoder1(
        .Instruction(Instruction[31:0]),
        .funct3(Funct3),
        .funct7(Funct7),
        .opcode(Opcode),
        .ReadReg1(ReadReg1),
        .ReadReg2(ReadReg2),
        .WriteReg(WriteReg)
    );

    ALU ALU1(
        .ReadData1(ReadData1),
        .ReadData2(SaidaMuxALU),
        .Operation(Operation),
        .Zero(Zero),
        .Result(Result)
    );

    ALUControl ALUControl1(
        .ALUOP(ALUOP),
        .Funct3(Funct3),
        .Funct7(Funct7),
        .Operation(Operation)
    );

    Control Control1(
        .Opcode(Opcode),
        .funct3(Funct3),
        .RegWrite(RegWrite),
        .ALUOP(ALUOP),
        .BranchNotZero(BranchNotZero),
        .BranchZero(BranchZero),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .WriteSrc(WriteSrc),
        .ALUSrc(ALUSrc)
    );

    DataMemory DataMemory1(
        .clock(clk),
        .reset(reset),
        .Address(Result),
        .WriteData(ReadData2),
        .ReadData(ReadData),
        .Write(MemWrite),
        .Read(MemRead)
    );

    ImmGen ImmGen1(
        .Instruction(Instruction[31:0]),
        .ImmGenOut(ImmGenOut)
    );

    InstructionMemory InstructionMemory1(
        .clock(clk),
        .reset(reset),
        .ReadAddress(PCOut),
        .Instruction(Instruction[31:0])
    );

    JumpControl JumpControl1(
        .BranchNotZero(BranchNotZero),
        .BranchZero(BranchZero),
        .Zero(Zero),
        .JumpControl(JumpControl)
    );

    MuxALU MuxALU1(
        .ReadData2(ReadData2),
        .ImmGen(ImmGenOut),
        .ALUSrc(ALUSrc),
        .out(SaidaMuxALU)
    );

    MuxDataMemory MuxDataMemory1(
        .ReadData(ReadData),
        .ALUResult(Result),
        .WriteSrc(WriteSrc),
        .out(WriteData)
    );

    MuxJump MuxJump1(
        .PCSum(PCSum),
        .PCADD4(PCADD4),
        .PCOut(PCin),
        .JumpControl(JumpControl)
    );

    PC PC1(
        .clock(clk),
        .reset(reset),
        .PCin(PCin),
        .PCOut(PCOut)
    );

    PCADD4 PCADD41(
        .PCin(PCOut),
        .PCADD4(PCADD4)
    );

    PCSUM PCSUM1(
        .PCin(PCOut),
        .ImmGen(ImmGenOut),
        .PCSum(PCSum),
        .Neg(Instruction[31])
    );

    RegisterFile RegisterFile1(
        .ReadReg1(ReadReg1),
        .ReadReg2(ReadReg2),
        .WriteReg(WriteReg),
        .WriteData(WriteData),
        .RegWrite(RegWrite),
        .clock(clk),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
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

endmodule

