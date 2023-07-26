module MuxALU(ReadData2, ImmGen, ALUSrc, out);

    input [31:0] ReadData2, ImmGen;
    output reg [31:0] out;
    input ALUSrc;

    always @* begin
        if (ALUSrc) begin
            out = ImmGen;
        end
        else begin
            out = ReadData2;
        end
    end

endmodule