module imm_gen(
    input [31:0]instr,
    output reg [31:0]imm
);

reg [6:0]opcode;

localparam R_type = 7'b0110011;
localparam I_type1 = 7'b0010011;
localparam I_type2 = 7'b0000011;
localparam S_type = 7'b0100011;
localparam B_type = 7'b1100011;

always @(*) begin
    opcode = instr[6:0];
    case(opcode)
    R_type: imm = 32'b0;
    I_type1: imm = {{20{instr[31]}}, instr[31:20]};
    I_type2: imm = {{20{instr[31]}}, instr[31:20]};
    S_type: imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};
    B_type: imm = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};    
    default: imm = 32'b0;
    endcase
    
    
end

endmodule
