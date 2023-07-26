module RegisterFile(ReadReg1, ReadReg2, WriteReg, WriteData, RegWrite, clock, ReadData1, ReadData2, reset, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31);



    input [4:0] ReadReg1, ReadReg2, WriteReg;
    input [31:0] WriteData;
    input RegWrite, clock, reset;
    output reg [31:0] ReadData1, ReadData2;
    output [31:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31;

    reg [31:0] register [0:31];

    assign x0 = register[0];
    assign x1 = register[1];
    assign x2 = register[2];
    assign x3 = register[3];
    assign x4 = register[4];
    assign x5 = register[5];
    assign x6 = register[6];
    assign x7 = register[7];
    assign x8 = register[8];
    assign x9 = register[9];
    assign x10 = register[10];
    assign x11 = register[11];
    assign x12 = register[12];
    assign x13 = register[13];
    assign x14 = register[14];
    assign x15 = register[15];
    assign x16 = register[16];
    assign x17 = register[17];
    assign x18 = register[18];
    assign x19 = register[19];
    assign x20 = register[20];
    assign x21 = register[21];
    assign x22 = register[22];
    assign x23 = register[23];
    assign x24 = register[24];
    assign x25 = register[25];
    assign x26 = register[26];
    assign x27 = register[27];
    assign x28 = register[28];
    assign x29 = register[29];
    assign x30 = register[30];
    assign x31 = register[31];

    always @(posedge clock) begin
        if (~reset) begin
            $readmemb("Registradores.bin", register);
        end
        if (RegWrite) begin
            register[WriteReg] <= WriteData;
        end
    end

    always @* begin
        ReadData1 = register[ReadReg1];
        ReadData2 = register[ReadReg2];
    end

    initial begin
        $readmemb("Registradores.bin", register);
    end

endmodule