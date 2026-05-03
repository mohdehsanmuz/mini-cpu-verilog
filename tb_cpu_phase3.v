module tb_cpu_phase3;

reg clk;
reg reset;

cpu_phase3 uut (
    .clk(clk),
    .reset(reset)
);

// Clock
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #10 reset = 0;

    #200 $finish;
end

endmodule