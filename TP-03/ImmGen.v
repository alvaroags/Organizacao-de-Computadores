module ImmGen(Instruction, ImmGenOut);

    input [31:0] Instruction;
    wire [11:0] imm_I;
    wire [11:0] imm_SB;
    wire [11:0] imm_S;
    reg[11:0] ImmGen;
    output reg [31:0] ImmGenOut;

    assign imm_I = Instruction[31:20];
    assign imm_SB = {Instruction[31], Instruction[7], Instruction[30:25], Instruction[11:8]};
    assign imm_S = {Instruction[31:25], Instruction[11:7]};

    always @* begin

        case (Instruction[6:0])
            7'b0000011: begin //I-Type - Load
                ImmGen = imm_I;
            end
            7'b0010011: begin //I-Type - ORI
                ImmGen = imm_I;
            end
            7'b0100011: begin //S-Type - Store
                ImmGen = imm_S;
            end
            7'b1100011: begin //SB-Type - Branch
                ImmGen = imm_SB;
            end
            default: begin
                ImmGen = 12'b0;
            end
        endcase
        if(Instruction[31]) begin
            if(Instruction[6:0] == 7'b1100011) begin
                ImmGenOut = {20'b0, ((~ImmGen) + 1'b1)<<1'b1};
            end else begin
                ImmGenOut = {20'b1, ImmGen};
            end
        end
        else begin
            ImmGenOut = {20'b0, ImmGen};
        end
    end

endmodule