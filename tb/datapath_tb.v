module datapath_tb;

reg clk;
reg reset;

datapath U1(
    .clk(clk),
    .reset(reset)
);

always begin
    #10;
    clk = ~clk;
end

initial begin
    clk = 0;
    reset = 1;
    #1;
    U1.INSTR_MEM.memory[0] = 32'b00000000010100000000000010010011;
    U1.INSTR_MEM.memory[1] = 32'b00000000101000000000000100010011;
    U1.INSTR_MEM.memory[2] = 32'b00000000001000001000000110110011;
    U1.INSTR_MEM.memory[3] = 32'b00000000001100000010000000100011;
    U1.INSTR_MEM.memory[4] = 32'b00000000000000000010001000000011;
    U1.INSTR_MEM.memory[5] = 32'b00000000000100001000010001100011;
    U1.INSTR_MEM.memory[6] = 32'b00000110001100000000001010010011;
    U1.INSTR_MEM.memory[7] = 32'b00000000011100000000001100010011;
    U1.INSTR_MEM.memory[8] = 32'b00000000001000001001010001100011;
    U1.INSTR_MEM.memory[9] = 32'b00000110001100000000001110010011;
    U1.INSTR_MEM.memory[10] = 32'b00000000100000000000010000010011;
    U1.INSTR_MEM.memory[11] = 32'b00000000001000001000010001100011;
    U1.INSTR_MEM.memory[12] = 32'b00000000100100000000010010010011;
    U1.INSTR_MEM.memory[13] = 32'b00000000000100001001010001100011;
    U1.INSTR_MEM.memory[14] = 32'b00000000101000000000010100010011;
    U1.INSTR_MEM.memory[15] = 32'b01000000000100010000010110110011;
    U1.INSTR_MEM.memory[16] = 32'b00000000001000001111011000110011;
    U1.INSTR_MEM.memory[17] = 32'b00000000001000001110011010110011;
    U1.INSTR_MEM.memory[18] = 32'b00000000001000001100011100110011;
    U1.INSTR_MEM.memory[19] = 32'b00000000001000001010011110110011;
    U1.INSTR_MEM.memory[20] = 32'b11111111101100000000100000010011;
    U1.INSTR_MEM.memory[21] = 32'b00000000001100000000100010010011;
    U1.INSTR_MEM.memory[22] = 32'b00000001000110000010100100110011;
    U1.INSTR_MEM.memory[23] = 32'b00000000001100000000100110010011;
    U1.INSTR_MEM.memory[24] = 32'b00000000000000000000101000010011;
    U1.INSTR_MEM.memory[25] = 32'b00000000000110100000101000010011;
    U1.INSTR_MEM.memory[26] = 32'b11111111111110011000100110010011;
    U1.INSTR_MEM.memory[27] = 32'b11111110000010011001110011100011;
    U1.INSTR_MEM.memory[28] = 32'b00000001000000000000101010010011;
    U1.INSTR_MEM.memory[29] = 32'b00000000001110101010010000100011;
    U1.INSTR_MEM.memory[30] = 32'b00000000100010101010101100000011;


    //ADDI test
    #20;
    reset = 0;
    
    #20;
    if(U1.PC.pc !== 32'd4) 
    $display("ADDI test error: pc update error");
    if(U1.REGFILE.regs[1] !== 32'd5)
    $display("ADDI test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd8) 
    $display("ADDI test error: pc update error");
    if(U1.REGFILE.regs[2] !== 32'd10)
    $display("ADDI test error: regfile update error");

    //ADD test
    #20;
    if(U1.PC.pc !== 32'd12) 
    $display("ADD test error: pc update error");
    if(U1.REGFILE.regs[3] !== 32'd15)
    $display("ADD test error: regfile update error");

    //SW test
    #20;
    if(U1.PC.pc !== 32'd16) 
    $display("SW test error: pc update error");
    if(U1.DATA_MEM.memory[0] !== 32'd15)
    $display("SW test error: data_memory update error");

    //LW test
    #20;
    if(U1.PC.pc !== 32'd20) 
    $display("LW test error: pc update error");
    if(U1.REGFILE.regs[4] !== 32'd15)
    $display("LW test error: regfile update error");

    //BEQ test (branch taken)
    #20;
    if(U1.PC.pc !== 32'd28) 
    $display("BEQ test error: pc update error");
    if(U1.REGFILE.regs[5] === 32'd99)
    $display("BEQ test error: fail to skip the instruction");

    #20;
    if(U1.PC.pc !== 32'd32) 
    $display("BEQ test error: pc update error");
    if(U1.REGFILE.regs[6] !== 32'd7)
    $display("BEQ test error: regfile update error");

    //BNE test (branch taken)
    #20;
    if(U1.PC.pc !== 32'd40) 
    $display("BNE test error: pc update error");
    if(U1.REGFILE.regs[7] === 32'd99)
    $display("BNE test error: fail to skip the instruction");

    #20;
    if(U1.PC.pc !== 32'd44) 
    $display("BNE test error: pc update error");
    if(U1.REGFILE.regs[8] !== 32'd8)
    $display("BNE test error: regfile update error");

    //BEQ test (branch not taken)
    #20;
    if(U1.PC.pc !== 32'd48) 
    $display("BEQ (branch not taken) test error: pc update error");

    #20;
    if(U1.PC.pc !== 32'd52) 
    $display("BEQ (branch not taken) test error: pc update error");
    if(U1.REGFILE.regs[9] !== 32'd9)
    $display("BEQ (branch not taken) test error: regfile update error");

    //BNE test (branch not taken)
    #20; 
    if(U1.PC.pc !== 32'd56) 
    $display("BNE (branch not taken) test error: pc update error");

    #20;
    if(U1.PC.pc !== 32'd60) 
    $display("BNE (branch not taken) test error: pc update error");
    if(U1.REGFILE.regs[10] !== 32'd10)
    $display("BNE (branch not taken) test error: regfile update error");

    //SUB test
    #20;
    if(U1.PC.pc !== 32'd64) 
    $display("SUB test error: pc update error");
    if(U1.REGFILE.regs[11] !== 32'd5)
    $display("SUB test error: regfile update error");

    //AND test
    #20;
    if(U1.PC.pc !== 32'd68) 
    $display("AND test error: pc update error");
    if(U1.REGFILE.regs[12] !== 32'd0)
    $display("AND test error: regfile update error");

    //OR test
    #20;
    if(U1.PC.pc !== 32'd72) 
    $display("OR test error: pc update error");
    if(U1.REGFILE.regs[13] !== 32'd15)
    $display("OR test error: regfile update error");

    //XOR test
    #20;
    if(U1.PC.pc !== 32'd76) 
    $display("XOR test error: pc update error");
    if(U1.REGFILE.regs[14] !== 32'd15)
    $display("XOR test error: regfile update error");

    //SLT test
    #20;
    if(U1.PC.pc !== 32'd80) 
    $display("SLT test error: pc update error");
    if(U1.REGFILE.regs[15] !== 32'd1)
    $display("SLT test error: regfile update error");

    //Signed ADDI
    #20;
    if(U1.PC.pc !== 32'd84) 
    $display("Signed ADDI test error: pc update error");
    if(U1.REGFILE.regs[16] !== 32'hFFFFFFFB)
    $display("Signed ADDI test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd88) 
    $display("Signed ADDI test error: pc update error");
    if(U1.REGFILE.regs[17] !== 32'h3)
    $display("Signed ADDI test error: regfile update error");

    //Signed SLT
    #20;
    if(U1.PC.pc !== 32'd92) 
    $display("Signed SLT test error: pc update error");
    if(U1.REGFILE.regs[18] !== 32'h1)
    $display("Signed SLT test error: regfile update error");

    //Backward branch
    #20;
    if(U1.PC.pc !== 32'd96) 
    $display("Backward branch test error: pc update error");
    if(U1.REGFILE.regs[19] !== 32'd3)
    $display("Backward branch test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd100) 
    $display("Backward branch test error: pc update error");
    if(U1.REGFILE.regs[20] !== 32'd0)
    $display("Backward branch test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd104) 
    $display("Backward branch test error: pc update error");
    if(U1.REGFILE.regs[20] !== 32'd1)
    $display("Backward branch test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd108) 
    $display("Backward branch test error: pc update error");
    if(U1.REGFILE.regs[19] !== 32'd2)
    $display("Backward branch test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd100) 
    $display("Backward branch test error: pc update error");

    #20;
    if(U1.PC.pc !== 32'd104) 
    $display("Backward branch test error: pc update error");
    if(U1.REGFILE.regs[20] !== 32'd2)
    $display("Backward branch test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd108) 
    $display("Backward branch test error: pc update error");
    if(U1.REGFILE.regs[19] !== 32'd1)
    $display("Backward branch test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd100) 
    $display("Backward branch test error: pc update error");

    #20;
    if(U1.PC.pc !== 32'd104) 
    $display("Backward branch test error: pc update error");
    if(U1.REGFILE.regs[20] !== 32'd3)
    $display("Backward branch test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd108) 
    $display("Backward branch test error: pc update error");
    if(U1.REGFILE.regs[19] !== 32'd0)
    $display("Backward branch test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd112) 
    $display("Backward branch test error: pc update error");

    //Memory Offset
    #20;
    if(U1.PC.pc !== 32'd116) 
    $display("Memory Offset test error: pc update error");
    if(U1.REGFILE.regs[21] !== 32'd16)
    $display("Memory Offset test error: regfile update error");

    #20;
    if(U1.PC.pc !== 32'd120) 
    $display("Memory Offset test error: pc update error");
    if(U1.DATA_MEM.memory[6] !== 32'd15)
    $display("Memory Offset test error: data_mem update error");

    #20;
    if(U1.PC.pc !== 32'd124) 
    $display("Memory Offset test error: pc update error");
    if(U1.REGFILE.regs[22] !== 32'd15)
    $display("Memory Offset test error: regfile update error");


    #20;
    $display("All tests completed");
    $finish;

end

endmodule