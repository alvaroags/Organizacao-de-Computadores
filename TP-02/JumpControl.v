module JumpControl(BranchNotZero, BranchZero, Zero, JumpControl);

    input BranchNotZero, BranchZero, Zero;
    output reg JumpControl;

    always @* begin
        if (BranchNotZero && !Zero) begin
            JumpControl = 1'b1;
        end else if (BranchZero && Zero) begin
            JumpControl = 1'b1;
        end else begin
            JumpControl = 1'b0;
        end
    end

endmodule