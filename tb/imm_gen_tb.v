module imm_gen_tb;
reg [31:0]instr;
wire [31:0]imm;

imm_gen U1(
    .instr(instr),
    .imm(imm)
);

initial begin
    //R-type test
    instr = 32'hAAAAAA33;
    #1;
    if(imm != 0) $display("R-type error");

    #10;
    //I-type1 test
    instr = 32'hF0FAAA13;
    #1;
    if(imm != 32'hFFFFFF0F) $display("I-type1 error");

    #10;
    //I-type2 test
    instr = 32'h00FAAA03;
    #1;
    if(imm != 32'h0000000F) $display("I-type2 error");

    #10;
    //S-type test
    instr = 32'hA8F0BC23;
    #1;
    if(imm != 32'hFFFFFA98) $display("S-type error");

    #10;
    //B-type test
    instr = 32'hA0B4F163;
    #1;
    if(imm != 32'hFFFFF202) $display("B-type error");

    #10;
    //default test
    instr = 32'hFFFFFFFF;
    #1;
    if(imm != 0) $display("default error");

    #10;
    $display("All tests passed");
    $finish;
end
endmodule
