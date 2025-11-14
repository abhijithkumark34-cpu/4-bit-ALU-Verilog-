`timescale 1ns/1ps

module alu4_tb;

    reg  [3:0] A, B;
    reg  [2:0] opcode;
    wire [3:0] Result;
    wire carry, zero;

    // Instantiate ALU
    alu4 uut (
        .A(A), 
        .B(B),
        .opcode(opcode),
        .Result(Result),
        .carry(carry),
        .zero(zero)
    );

    initial begin
        $monitor("time=%0t | A=%b | B=%b | opcode=%b | Result=%b | carry=%b | zero=%b",
                 $time, A, B, opcode, Result, carry, zero);

        // TEST 1: ADD
        A = 4'b0101; B = 4'b0011; opcode = 3'b000; #10;

        // TEST 2: SUB
        A = 4'b1000; B = 4'b0011; opcode = 3'b001; #10;

        // TEST 3: AND
        A = 4'b1100; B = 4'b1010; opcode = 3'b010; #10;

        // TEST 4: OR
        A = 4'b1100; B = 4'b1010; opcode = 3'b011; #10;

        // TEST 5: XOR
        A = 4'b1100; B = 4'b1010; opcode = 3'b100; #10;

        // TEST 6: NOT
        A = 4'b1100; opcode = 3'b101; #10;

        // TEST 7: INC
        A = 4'b1111; opcode = 3'b110; #10;

        // TEST 8: DEC
        A = 4'b0000; opcode = 3'b111; #10;

        $finish;
    end

endmodule

