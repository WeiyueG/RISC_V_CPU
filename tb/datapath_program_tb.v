module datapath_program_tb;

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
    $dumpfile("sim/datapath_program.vcd");
    $dumpvars(0, datapath_program_tb);
end

initial begin
    clk = 0;
    reset = 1;
    #1;
    U1.INSTR_MEM.memory[0] = 32'b00000000010000000000000010010011;
    U1.INSTR_MEM.memory[1] = 32'b00000000000000000000000100010011;
    U1.INSTR_MEM.memory[2] = 32'b00000000001000010000000100010011;
    U1.INSTR_MEM.memory[3] = 32'b11111111111100001000000010010011;
    U1.INSTR_MEM.memory[4] = 32'b11111110000000001001110011100011;
    U1.INSTR_MEM.memory[5] = 32'b00000000001000000010000000100011;
    U1.INSTR_MEM.memory[6] = 32'b00000000000000000010000110000011;

    #20;
    reset = 0;

    wait(U1.PC.pc === 32'd28) begin
        #1;
        if(U1.REGFILE.regs[1] !== 32'd0)
        $display("regfile update error");
        if(U1.REGFILE.regs[2] !== 32'd8)
        $display("regfile update error");
        if(U1.DATA_MEM.memory[0] !== 32'd8)
        $display("data_mem update error");
        if(U1.REGFILE.regs[3] !== 32'd8)
        $display("regfile update error");
    end

    #20;
    $display("All tests completed");
    $finish;

end

endmodule