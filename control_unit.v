module control_unit (
    input [2:0] opcode,
    output reg [2:0] alu_op,
    output reg we
);

always @(*) begin
    case (opcode)
        3'b000: begin alu_op = 3'b000; we = 1; end // ADD
        3'b001: begin alu_op = 3'b001; we = 1; end // SUB
        3'b010: begin alu_op = 3'b010; we = 1; end // AND
        3'b011: begin alu_op = 3'b011; we = 1; end // OR
        default: begin alu_op = 3'b000; we = 0; end
    endcase
end

endmodule