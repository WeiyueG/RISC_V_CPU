module regfile(
    input clk,
    input we,
    input [4:0]rs1, //Source register 1
    input [4:0]rs2,  //Source register 2
    input [4:0]rd,  //Destination register
    input [31:0]wd,  //Write data
    output [31:0]rd1,  //Read data 1
    output [31:0]rd2 //Read data 2
);

reg [31:0] regs [31:0];

assign rd1 = (rs1 == 5'b0) ? 32'b0 : regs[rs1];
assign rd2 = (rs2 == 5'b0) ? 32'b0 : regs[rs2];

always @(posedge clk) begin
    if(we && rd != 0) begin
        regs[rd] <= wd;
    end
end

endmodule
