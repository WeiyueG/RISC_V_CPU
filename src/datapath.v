module datapath(
    input clk,
    input reset
);

wire [31:0] pc_current;
wire [31:0] pc_next;
wire [31:0] instruction;
wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;
wire [31:0] imm;
wire [31:0] wd;
wire [31:0] rd1;
wire [31:0] rd2;
wire mem_write;
wire [31:0] read_data;
wire reg_write;
wire alu_src;
wire branch;
wire result_src;
wire [3:0] alu_op;
wire [31:0] b;
wire [31:0] result;
wire zero;
wire branch_taken;

assign wd = result_src ? read_data : result;
assign b = alu_src ? imm : rd2;
assign branch_taken = (branch && (funct3 == 3'b000) && zero) || (branch && (funct3 == 3'b001) && (!zero));
assign pc_next = branch_taken ? (pc_current + imm) : (pc_current + 4);

pc PC(
    .clk(clk),
    .reset(reset),
    .pc_next(pc_next),
    .pc(pc_current)
);

instr_mem INSTR_MEM(
    .addr(pc_current),
    .instr(instruction)
);

decoder DECODER(
    .instr(instruction),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
);

imm_gen IMM_GEN(
    .instr(instruction),
    .imm(imm)
);

regfile REGFILE(
    .clk(clk),
    .we(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(wd),
    .rd1(rd1),
    .rd2(rd2)
);

data_mem DATA_MEM(
    .clk(clk),
    .mem_write(mem_write),
    .addr(result),
    .write_data(rd2),
    .read_data(read_data)
);

control_unit CONTROL_UNIT(
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

alu ALU(
    .a(rd1),
    .b(b),
    .alu_op(alu_op),
    .result(result),
    .zero(zero)
);


endmodule



