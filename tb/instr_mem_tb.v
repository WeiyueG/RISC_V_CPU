module instr_mem_tb;

reg [31:0]addr;
wire [31:0]instr;
integer i;

instr_mem U1(
    .addr(addr),
    .instr(instr)
);

initial begin
    #1;
    //initial test
    for(i = 0; i < 256; i = i + 1) begin
        addr = i * 4;
        #1;
        if(instr != 0)
        $display("initial error");
    end

    //instr update test
    #5;
    U1.memory[0] = 32'hAAAAAAAA;
    #1;
    addr = 32'b0;
    #1;
    if(instr != 32'hAAAAAAAA) $display("instr update error");

    #5;
    U1.memory[20] = 32'hF0F0F0F0;
    #1;
    addr = 32'd80;
    #1;
    if(instr != 32'hF0F0F0F0) $display("instr update error");

    #5;
    $display("All tests passed");
    $finish;


end
endmodule
