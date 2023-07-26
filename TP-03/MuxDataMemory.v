module MuxDataMemory(ReadData, ALUResult, WriteSrc, out);

    input [31:0] ReadData, ALUResult;
    input WriteSrc;
    output reg [31:0] out;

    always @* begin
        if (WriteSrc) begin
            out = ReadData;
        end
        else begin
            out = ALUResult;
        end
    end
endmodule