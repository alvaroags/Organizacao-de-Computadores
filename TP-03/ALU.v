module ALU(ReadData1, ReadData2, Operation, Zero, Result);

    input [31:0] ReadData1, ReadData2;
    input [3:0] Operation;
    output reg Zero;
    output reg [31:0] Result;

    always @* begin
        case (Operation)
            4'b0000: begin // LD e SD
                Result <= ReadData1 + ReadData2;
            end
            4'b0001: begin // BEQ
                Result <= ReadData1 - ReadData2;
            end
            4'b0010: begin // ADD
                Result <= ReadData1 + ReadData2;
            end
            4'b0011: begin // SUB
                Result <= ReadData1 - ReadData2;
            end
            4'b0100: begin // SLL
                Result <= ReadData1 << ReadData2[4:0];
            end
            4'b0101: begin // OR
                Result <= ReadData1 | ReadData2;
            end
            4'b0110: begin // AND
                Result <= ReadData1 & ReadData2;
            end
            4'b0111: begin // ORI
                Result <= ReadData1 | ReadData2;
            end
        endcase

        Zero <= (Result == 0);

    end

endmodule