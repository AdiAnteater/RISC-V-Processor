`timescale 1ns / 1ps

module processor (
    input clk, reset,
    output [31:0] Result
);

    // Instantiate signals
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [3:0] operation; // Adjust size if necessary based on ALUController output
    wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite;
    wire [1:0] ALUOp;
    

data_path datapath_inst (
    .clk(clk),
    .reset(reset),
    .reg_write(RegWrite),
    .mem2reg(MemtoReg),
    .alu_src(ALUSrc),
    .mem_write(MemWrite),
    .mem_read(MemRead),
    .alu_cc(operation),
    .opcode(opcode),
    .funct7(funct7),
    .funct3(funct3),
    .alu_result(Result)
);

    Controller controller_inst (
        .Opcode(opcode),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .ALUOp(ALUOp) // Other connections as per Controller module definition
    );

    ALUController alucontroller_inst (
        .ALUOp(ALUOp),
        .Funct7(funct7),
        .Funct3(funct3),
        .Operation(operation) // Other connections as per ALUController module definition
    );

endmodule // processor