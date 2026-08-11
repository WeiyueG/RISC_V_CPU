module control_unit_tb;

reg [6:0]opcode;
reg [2:0]funct3;
reg [6:0]funct7;

wire reg_write;
wire mem_write;
wire alu_src;
wire branch;
wire result_src;
wire [3:0]alu_op;

control_unit U1(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .reg_write(reg_write),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .branch(branch),
    .result_src(result_src),
    .alu_op(alu_op)
);

initial begin
    opcode = 7'b0;
    funct3 = 3'b0;
    funct7 = 7'b0;

    //ADD test
    #1;
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b1) $display("ADD reg_write error");
    if(mem_write !== 1'b0) $display("ADD mem_write error");
    if(alu_src !== 1'b0) $display("ADD alu_src error");
    if(branch !== 1'b0) $display("ADD branch error");
    if(result_src !== 1'b0) $display("ADD result_src error");
    if(alu_op !== 4'b0000) $display("ADD alu_op error");

    //SUB test
    #1;
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b0100000;
    #1;
    if(reg_write !== 1'b1) $display("SUB reg_write error");
    if(mem_write !== 1'b0) $display("SUB mem_write error");
    if(alu_src !== 1'b0) $display("SUB alu_src error");
    if(branch !== 1'b0) $display("SUB branch error");
    if(result_src !== 1'b0) $display("SUB result_src error");
    if(alu_op !== 4'b0001) $display("SUB alu_op error");

    //AND test
    #1;
    opcode = 7'b0110011;
    funct3 = 3'b111;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b1) $display("AND reg_write error");
    if(mem_write !== 1'b0) $display("AND mem_write error");
    if(alu_src !== 1'b0) $display("AND alu_src error");
    if(branch !== 1'b0) $display("AND branch error");
    if(result_src !== 1'b0) $display("AND result_src error");
    if(alu_op !== 4'b0010) $display("AND alu_op error");

    //OR
    #1;
    opcode = 7'b0110011;
    funct3 = 3'b110;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b1) $display("OR reg_write error");
    if(mem_write !== 1'b0) $display("OR mem_write error");
    if(alu_src !== 1'b0) $display("OR alu_src error");
    if(branch !== 1'b0) $display("OR branch error");
    if(result_src !== 1'b0) $display("OR result_src error");
    if(alu_op !== 4'b0011) $display("OR alu_op error");

    //XOR
    #1;
    opcode = 7'b0110011;
    funct3 = 3'b100;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b1) $display("XOR reg_write error");
    if(mem_write !== 1'b0) $display("XOR mem_write error");
    if(alu_src !== 1'b0) $display("XOR alu_src error");
    if(branch !== 1'b0) $display("XOR branch error");
    if(result_src !== 1'b0) $display("XOR result_src error");
    if(alu_op !== 4'b0100) $display("XOR alu_op error");

    //SLT
    #1;
    opcode = 7'b0110011;
    funct3 = 3'b010;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b1) $display("SLT reg_write error");
    if(mem_write !== 1'b0) $display("SLT mem_write error");
    if(alu_src !== 1'b0) $display("SLT alu_src error");
    if(branch !== 1'b0) $display("SLT branch error");
    if(result_src !== 1'b0) $display("SLT result_src error");
    if(alu_op !== 4'b0101) $display("SLT alu_op error");

    //ADDI
    #1;
    opcode = 7'b0010011;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b1) $display("ADDI reg_write error");
    if(mem_write !== 1'b0) $display("ADDI mem_write error");
    if(alu_src !== 1'b1) $display("ADDI alu_src error");
    if(branch !== 1'b0) $display("ADDI branch error");
    if(result_src !== 1'b0) $display("ADDI result_src error");
    if(alu_op !== 4'b0000) $display("ADDI alu_op error");

    //LW
    #1;
    opcode = 7'b0000011;
    funct3 = 3'b010;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b1) $display("LW reg_write error");
    if(mem_write !== 1'b0) $display("LW mem_write error");
    if(alu_src !== 1'b1) $display("LW alu_src error");
    if(branch !== 1'b0) $display("LW branch error");
    if(result_src !== 1'b1) $display("LW result_src error");
    if(alu_op !== 4'b0000) $display("LW alu_op error");

    //SW
    #1;
    opcode = 7'b0100011;
    funct3 = 3'b010;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b0) $display("SW reg_write error");
    if(mem_write !== 1'b1) $display("SW mem_write error");
    if(alu_src !== 1'b1) $display("SW alu_src error");
    if(branch !== 1'b0) $display("SW branch error");
    if(result_src !== 1'b0) $display("SW result_src error");
    if(alu_op !== 4'b0000) $display("SW alu_op error");

    //BEQ
    #1;
    opcode = 7'b1100011;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b0) $display("BEQ reg_write error");
    if(mem_write !== 1'b0) $display("BEQ mem_write error");
    if(alu_src !== 1'b0) $display("BEQ alu_src error");
    if(branch !== 1'b1) $display("BEQ branch error");
    if(result_src !== 1'b0) $display("BEQ result_src error");
    if(alu_op !== 4'b0001) $display("BEQ alu_op error");

    //BNE
    #1;
    opcode = 7'b1100011;
    funct3 = 3'b001;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b0) $display("BNE reg_write error");
    if(mem_write !== 1'b0) $display("BNE mem_write error");
    if(alu_src !== 1'b0) $display("BNE alu_src error");
    if(branch !== 1'b1) $display("BNE branch error");
    if(result_src !== 1'b0) $display("BNE result_src error");
    if(alu_op !== 4'b0001) $display("BNE alu_op error");

    //default test 1
    #1;
    opcode = 7'b1000000;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b0) $display("default test 1 reg_write error");
    if(mem_write !== 1'b0) $display("default test 1 mem_write error");
    if(alu_src !== 1'b0) $display("default test 1 alu_src error");
    if(branch !== 1'b0) $display("default test 1 branch error");
    if(result_src !== 1'b0) $display("default test 1 result_src error");
    if(alu_op !== 4'b0000) $display("default test 1 alu_op error");

    //default test 2
    #1;
    opcode = 7'b0110011;
    funct3 = 3'b101;
    funct7 = 7'b0000000;
    #1;
    if(reg_write !== 1'b0) $display("default test 2 reg_write error");
    if(mem_write !== 1'b0) $display("default test 2 mem_write error");
    if(alu_src !== 1'b0) $display("default test 2 alu_src error");
    if(branch !== 1'b0) $display("default test 2 branch error");
    if(result_src !== 1'b0) $display("default test 2 result_src error");
    if(alu_op !== 4'b0000) $display("default test 2 alu_op error");

    //default test 3
    #1;
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b1000000;
    #1;
    if(reg_write !== 1'b0) $display("default test 3 reg_write error");
    if(mem_write !== 1'b0) $display("default test 3 mem_write error");
    if(alu_src !== 1'b0) $display("default test 3 alu_src error");
    if(branch !== 1'b0) $display("default test 3 branch error");
    if(result_src !== 1'b0) $display("default test 3 result_src error");
    if(alu_op !== 4'b0000) $display("default test 3 alu_op error");

    #10;
    $display("All tests completed");
    $finish;

end

endmodule