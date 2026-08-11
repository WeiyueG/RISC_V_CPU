module data_mem(
    input clk,
    input mem_write,
    input [31:0] addr,
    input [31:0] write_data,
    output [31:0] read_data
);

reg [31:0] memory [0:255];
integer i;

initial begin
    for(i = 0; i < 256; i = i +1) begin
        memory[i] = 32'b0;
    end
end
assign read_data = memory[addr[31:2]];

always @(posedge clk) begin
    if(mem_write) begin
        memory[addr[31:2]] <= write_data;
    end
end

endmodule

