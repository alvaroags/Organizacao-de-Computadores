module ALUControl(ALUOP, Funct3, Funct7, Operation);
    input [2:0] ALUOP;
    input [2:0] Funct3;
    input [6:0] Funct7;
    output reg [3:0] Operation;

    always @(*) begin
        case (ALUOP)
            3'b000:
            begin
                Operation = 4'b0000; // LD e SD
            end

            3'b001:
            begin
                Operation = 4'b0001; // BEQ
            end

            3'b010: // R-Type
            begin
                case(Funct3)
                    3'b000:
                    begin
                        case(Funct7)
                            7'b0000000:
                            begin
                                Operation = 4'b0010; // ADD
                            end

                            7'b0100000:
                            begin
                                Operation = 4'b0011; // SUB
                            end    
                        endcase
                    end

                    3'b001:
                    begin
                        Operation = 4'b0100; // SLL
                    end

                    3'b110:
                    begin
                        Operation = 4'b0101; // OR
                    end

                    3'b111:
                    begin
                        Operation = 4'b0110; // AND
                    end
                endcase
            end

            3'b011:
            begin
                Operation = 4'b0101; // ORI
            end
        endcase
    end
endmodule