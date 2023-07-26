module Control(Opcode, funct3, RegWrite, ALUOP, BranchNotZero, BranchZero, MemRead, MemWrite, WriteSrc, ALUSrc);

    input [6:0] Opcode;
    input [2:0] funct3;
    output reg[2:0] ALUOP;
    output reg BranchNotZero, BranchZero, RegWrite, MemRead, MemWrite, WriteSrc, ALUSrc;
    always @* begin

        case (Opcode)
            7'b0000011: begin //Load
                RegWrite = 1'b1;
                ALUOP = 3'b000;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                WriteSrc = 1'b1;
                ALUSrc = 1'b1;
            end
            7'b0100011: begin //Store
                RegWrite = 1'b0;
                ALUOP = 3'b000;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                WriteSrc = 1'b0;
                ALUSrc = 1'b1;
            end
            7'b0110011: begin //R-Type
                RegWrite = 1'b1;
                ALUOP = 3'b010;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                WriteSrc = 1'b0;
                ALUSrc = 1'b0;
            end
            7'b0010011: begin //I-Type
                RegWrite = 1'b1;
                ALUOP = 3'b011;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                WriteSrc = 1'b0;
                ALUSrc = 1'b1;
            end
            7'b1100011: begin //SB-Type
                RegWrite = 1'b0;
                ALUOP = 3'b001;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                WriteSrc = 1'b0;
                ALUSrc = 1'b0;
            end
        endcase

        case (Opcode)
            7'b1100011: begin //SB-Type
                case (funct3)
                    3'b000: begin //BEQ
                        BranchNotZero = 1'b0;
                        BranchZero = 1'b1;
                    end
                    3'b001: begin //BNE
                        BranchNotZero = 1'b1;
                        BranchZero = 1'b0;
                    end
                endcase
            end
            default: begin
                BranchNotZero = 1'b0;
                BranchZero = 1'b0;
            end

        endcase
    end

endmodule