module decoder_tb;

reg [31:0]instr;
wire [6:0]opcode;
wire [4:0]rd;
wire [2:0]funct3;
wire [4:0]rs1;
wire [4:0]rs2;
wire [6:0]funct7;


decoder U1(
    .instr(instr),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
);

initial begin
    instr = 32'hAAAAAAAA;
    #5;
    if(opcode != 7'b0101010) $display("opcode error");
    if(rd != 5'b10101) $display("rd error");
    if(funct3 != 3'b010) $display("funct3 error");
    if(rs1 != 5'b10101) $display("rs1 error");
    if(rs2 != 5'b01010) $display("rs2 error");
    if(funct7 != 7'b1010101) $display("funct7 error");
    #5;
    $display("All tests passed");
    $finish;
end


endmodule
