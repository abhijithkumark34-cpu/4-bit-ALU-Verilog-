module ALU_4(
input [3:0] A,
input [3:0] B,
input [2:0] opcode,//      this line tell the sysyem to do which operations like; add, sub ,or ,xor
output  reg [3:0]Result,
output reg Carry,
output zero);
reg [4:0] temp;//       reg is like a storage were  the variable is stored and temp is just temporory storage  variable  inside my alu
always @(*) begin//     this line says that when ever the input changes the block inside this should run again
carry =0;//             so alu need to recalculate the next step autometically 
temp =0;//               we set this 2 to 0 beauce verilog may keep old values from previous operation
case (opcode)//          here we store the  opcode which have to be perfomed  like add, sub , or ,xor 
3'b000: begain//         add
temp=A+B;
result = temp[3:0];//      this line says only first 4 bit are stored in  result but the result might be 
carry = temp[4];//         be 5 bit that is the carry and it is MSB which is store in the carry 
end
3'b001: begin//            next sub opcode on next step you can see we took 5 bit....  you do not need to do 2s coplement because verilog performs it internally
temp={1'b0,A}-{1'b0,B};//        this line says to live one bit space extra  which tottal becomes 5 bit 
result =temp[3:0];
carry = temp[4];
end		
endmodule



