module alu (
    input [7:0] a,
    input [7:0] b,
    input [2:0] alu_op,
    output reg [7:0] result
);

always @(*) begin
    case (alu_op)
        3'b000: result = a + b; // ADD
        3'b001: result = a - b; // SUB
        3'b010: result = a & b; // AND
        3'b011: result = a | b; // OR
        default: result = 8'b0;
    endcase
end

endmodule