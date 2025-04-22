module Controller(
    Opcode,
    ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,
    ALUOp
    );
 
 
// I/O Signals    
input [6:0] Opcode;
output [1:0] ALUOp;
output MemtoReg;
output MemWrite;
output RegWrite;
output ALUSrc;
output MemRead;


// Behavi
//Control Signals
assign MemtoReg = (Opcode == 7'b0000011) ? 1'b1 : 1'b0;
assign MemWrite = (Opcode == 7'b0100011) ? 1'b1 : 1'b0;
assign MemRead = (Opcode == 7'b0000011) ? 1'b1 : 1'b0;
assign ALUSrc = ((Opcode == 7'b0010011) || (Opcode == 7'b0000011) || (Opcode == 7'b0100011)) ? 1'b1 : 1'b0;
assign RegWrite = ((Opcode == 7'b0110011) || (Opcode == 7'b0010011) || (Opcode == 7'b0000011)) ? 1'b1 : 1'b0;
assign ALUOp = (Opcode == 7'b0110011) ? 2'b10 : 
               (Opcode == 7'b0000011 || Opcode == 7'b0100011) ? 2'b01 : 2'b00;



endmodule