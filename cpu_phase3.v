module cpu_phase3(
    input clk,
    input reset
);

    // PC
    reg [3:0] pc;
    wire [7:0] instruction;

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 0;
        else
            pc <= pc + 1;
    end

    // Instruction Memory
    instruction_memory imem (
        .addr(pc),
        .instruction(instruction)
    );

    // Decode
    wire [2:0] opcode = instruction[7:5];
    wire [1:0] reg1   = instruction[4:3];
    wire [1:0] reg2   = instruction[2:1];

    // Control Unit
    wire [2:0] alu_op;
    wire we;

    control_unit cu (
        .opcode(opcode),
        .alu_op(alu_op),
        .we(we)
    );

    // Register File
    wire [7:0] rd1, rd2, wr_data;

    reg_file rf (
        .clk(clk),
        .reset(reset),
        .we(we),
        .rs1(reg1),
        .rs2(reg2),
        .rd(reg1),
        .wd(wr_data),
        .rd1(rd1),
        .rd2(rd2)
    );

    // ALU
    alu alu_inst (
        .a(rd1),
        .b(rd2),
        .alu_op(alu_op),
        .result(wr_data)
    );

endmodule