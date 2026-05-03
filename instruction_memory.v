module instruction_memory(
    input [3:0] addr,
    output reg [7:0] instruction
);

reg [7:0] mem [0:15];

integer i;

initial begin
    // Initialize all memory to 0 (IMPORTANT)
    for (i = 0; i < 16; i = i + 1)
        mem[i] = 8'b00000000;

    // Example program
    mem[0] = 8'b00000000; // ADD r0, r0
    mem[1] = 8'b00101000; // SUB r1, r0
    mem[2] = 8'b01010000; // AND r2, r0
    mem[3] = 8'b01111000; // OR r3, r0
end

always @(*) begin
    instruction = mem[addr];  // addr is already 4-bit (safe)
end

endmodule