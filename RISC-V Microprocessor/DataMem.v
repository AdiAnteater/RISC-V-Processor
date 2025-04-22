`timescale 1ns / 1ps

module DataMem( MemRead, MemWrite, addr, write_data, read_data);

input [8:0] addr;
output reg [31:0] read_data;
input [31:0] write_data;
input MemWrite;
input MemRead;

reg [31:0] Mem [127:0];
integer i;

initial begin
    read_data <= 0;
    for(i=0; i<128;i=i+1) begin
        Mem[i] = i;
    end
end

always @(*) begin
    if(MemWrite == 1'b1) begin
        Mem[addr[8:2]] = write_data;
    end
    
    if(MemRead == 1'b1) begin
        read_data = Mem[addr[8:2]];
    end
 end
endmodule
