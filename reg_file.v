module reg_file(
    input clk,
    input reset,
    input we,
    input [1:0] rs1,
    input [1:0] rs2,
    input [1:0] rd,
    input [7:0] wd,
    output [7:0] rd1,
    output [7:0] rd2
);

reg [7:0] regs [0:3];

// Read ports
assign rd1 = regs[rs1];
assign rd2 = regs[rs2];

// Write + Reset
always @(posedge clk or posedge reset) begin
    if (reset) begin
        regs[0] <= 8'd5;
        regs[1] <= 8'd3;
        regs[2] <= 8'd2;
        regs[3] <= 8'd1;
    end
    else if (we) begin
        regs[rd] <= wd;
    end
end

endmodule