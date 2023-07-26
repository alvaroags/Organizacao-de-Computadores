module MuxJump(PCSum, PCADD4, PCOut, JumpControl);

    input [31:0] PCSum, PCADD4;
    input JumpControl;
    output reg [31:0] PCOut;

    always @* begin
        if (JumpControl) begin
            PCOut = PCSum;
        end else begin
            PCOut = PCADD4;
        end
    end

endmodule