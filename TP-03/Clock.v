module Clock(clock);

    output reg clock;
    always begin
        #10 clock = 1'b0;
        #10 clock = 1'b1;
    end

endmodule