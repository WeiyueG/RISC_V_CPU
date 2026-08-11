module pc_tb;
reg clk;
reg reset;
reg [31:0]pc_next;
wire [31:0]pc;

pc U1(
    .clk(clk),
    .reset(reset),
    .pc_next(pc_next),
    .pc(pc)
);

always begin
    #10;
    clk = ~clk;
end

initial begin
    clk = 0;
    reset = 0;
    pc_next = 0;

    #5;
    pc_next = 32'd100;
    
    #20;
    //pc update test
    if(pc != 32'd100) $display("pc update error");

    #20;
    //reset test
    reset = 1;
    #20;
    if(pc != 0) $display("reset error");
    #20;
    reset = 0;

    #20;
    //pc update test
    pc_next = 32'd8;
    #20;
    if(pc != 32'd8) $display("pc update error");

    #20;
    $display("All tests passed");
    $finish;
end
endmodule
