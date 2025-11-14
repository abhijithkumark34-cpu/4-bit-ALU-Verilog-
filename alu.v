module alu4 (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] opcode,
    output reg [3:0] Result,
    output reg carry,
    output reg zero
);

always @(*) begin
    carry = 0;
    case (opcode)
        3'b000: {carry, Result} = A + B;          // ADD
        3'b001: {carry, Result} = A - B;          // SUB
        3'b010: Result = A & B;                   // AND
        3'b011: Result = A | B;                   // OR
        3'b100: Result = A ^ B;                   // XOR
        3'b101: Result = ~A;                      // NOT
        3'b110: {carry, Result} = A + 1;          // INC
        3'b111: {carry, Result} = A - 1;          // DEC
        default: Result = 4'b0000;
    endcase

    zero = (Result == 4'b0000);
end

endmodule

