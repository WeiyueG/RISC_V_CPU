module tb;

reg [31:0] a;
reg [31:0] b;
reg [3:0] alu_op;
wire [31:0] result;
wire zero;

alu U1(.a(a), .b(b), .alu_op(alu_op), .result(result), .zero(zero));

initial begin
    //ADD tests
    alu_op = 4'b0000;
    a = 32'b0; 
    b = 32'b0; 
    #1 
    if(result != 32'b0) $display("ADD result Error");
    if(zero != 1'b1) $display("ADD zero Error");
    #20 
    a = 32'd5; 
    b = 32'd10;
    #1 
    if(result != 32'd15) $display("ADD result Error");
    if(zero != 1'b0) $display("ADD zero Error");
    #20 
    a = 32'hFFFFFFFF; 
    b = 32'd1;
    #1 
    if(result != 32'b0) $display("ADD result Error");
    if(zero != 1'b1) $display("ADD zero Error");

    //SUB tests
    #20
    alu_op = 4'b0001;
    a = 32'b0; 
    b = 32'b0; 
    #1 
    if(result != 32'b0) $display("SUB result Error");
    if(zero != 1'b1) $display("SUB zero Error");
    #20 
    a = 32'd10; 
    b = 32'd5;
    #1 
    if(result != 32'd5) $display("SUB result Error");
    if(zero != 1'b0) $display("SUB zero Error");
    #20 
    a = 32'd20; 
    b = 32'd30;
    #1 
    if(result != 32'hFFFFFFF6) $display("SUB result Error");
    if(zero != 1'b0) $display("SUB zero Error"); 

    //AND tests
    #20
    alu_op = 4'b0010;
    a = 32'b0; 
    b = 32'b0; 
    #1 
    if(result != 32'b0) $display("AND result Error");
    if(zero != 1'b1) $display("AND zero Error");
    #20 
    a = 32'hFFFFFFFF; 
    b = 32'hFFFFFFFF;
    #1 
    if(result != 32'hFFFFFFFF) $display("AND result Error");
    if(zero != 1'b0) $display("AND zero Error");
    #20 
    a = 32'hF0F0F0F0; 
    b = 32'h0F0F0F0F;
    #1 
    if(result != 32'b0) $display("AND result Error");
    if(zero != 1'b1) $display("AND zero Error"); 
    #20 
    a = 32'hAAAAAAAA; 
    b = 32'h55555555;
    #1 
    if(result != 32'b0) $display("AND result Error");
    if(zero != 1'b1) $display("AND zero Error"); 

    //OR tests
    #20
    alu_op = 4'b0011;
    a = 32'b0; 
    b = 32'b0; 
    #1 
    if(result != 32'b0) $display("OR result Error");
    if(zero != 1'b1) $display("OR zero Error");
    #20 
    a = 32'hFFFFFFFF; 
    b = 32'hFFFFFFFF;
    #1 
    if(result != 32'hFFFFFFFF) $display("OR result Error");
    if(zero != 1'b0) $display("OR zero Error");
    #20 
    a = 32'hF0F0F0F0; 
    b = 32'h0F0F0F0F;
    #1 
    if(result != 32'hFFFFFFFF) $display("OR result Error");
    if(zero != 1'b0) $display("OR zero Error"); 
    #20 
    a = 32'hAAAAAAAA; 
    b = 32'h55555555;
    #1 
    if(result != 32'hFFFFFFFF) $display("OR result Error");
    if(zero != 1'b0) $display("OR zero Error"); 

    //XOR tests
    #20
    alu_op = 4'b0100;
    a = 32'b0; 
    b = 32'b0; 
    #1 
    if(result != 32'b0) $display("XOR result Error");
    if(zero != 1'b1) $display("XOR zero Error");
    #20 
    a = 32'hFFFFFFFF; 
    b = 32'hFFFFFFFF;
    #1 
    if(result != 32'b0) $display("XOR result Error");
    if(zero != 1'b1) $display("XOR zero Error");
    #20 
    a = 32'hF0F0F0F0; 
    b = 32'h0F0F0F0F;
    #1 
    if(result != 32'hFFFFFFFF) $display("XOR result Error");
    if(zero != 1'b0) $display("XOR zero Error"); 
    #20 
    a = 32'hAAAAAAAA; 
    b = 32'h55555555;
    #1 
    if(result != 32'hFFFFFFFF) $display("XOR result Error");
    if(zero != 1'b0) $display("XOR zero Error"); 

    //SLT tests
    #20
    alu_op = 4'b0101;
    a = 32'd5; 
    b = 32'd10; 
    #1 
    if(result != 32'b1) $display("SLT result Error");
    if(zero != 1'b0) $display("SLT zero Error");
    #20 
    a = 32'd10; 
    b = 32'd10;
    #1 
    if(result != 32'b0) $display("SLT result Error");
    if(zero != 1'b1) $display("SLT zero Error");
    #20 
    a = 32'd10; 
    b = 32'd5;
    #1 
    if(result != 32'b0) $display("SLT result Error");
    if(zero != 1'b1) $display("SLT zero Error");
    #20 
    a = 32'h80000000; 
    b = 32'h8FFFFFFF;
    #1 
    if(result != 32'b1) $display("SLT result Error");
    if(zero != 1'b0) $display("SLT zero Error"); 
    #20 
    a = 32'hFFFFFFFF; 
    b = 32'd1;
    #1 
    if(result != 32'b1) $display("SLT result Error");
    if(zero != 1'b0) $display("SLT zero Error"); 

    //SLTU tests
    #20
    alu_op = 4'b0110;
    a = 32'd5; 
    b = 32'd10; 
    #1 
    if(result != 32'b1) $display("SLTU result Error");
    if(zero != 1'b0) $display("SLTU zero Error");
    #20 
    a = 32'd10; 
    b = 32'd10;
    #1 
    if(result != 32'b0) $display("SLTU result Error");
    if(zero != 1'b1) $display("SLTU zero Error");
    #20 
    a = 32'd10; 
    b = 32'd5;
    #1 
    if(result != 32'b0) $display("SLTU result Error");
    if(zero != 1'b1) $display("SLTU zero Error");
    #20 
    a = 32'h80000000; 
    b = 32'h8FFFFFFF;
    #1 
    if(result != 32'b1) $display("SLTU result Error");
    if(zero != 1'b0) $display("SLTU zero Error"); 
    #20 
    a = 32'hFFFFFFFF; 
    b = 32'd1;
    #1 
    if(result != 32'b0) $display("SLTU result Error");
    if(zero != 1'b1) $display("SLTU zero Error");

    //SLL tests
    #20
    alu_op = 4'b0111;
    a = 32'd5; 
    b = 32'd1; 
    #1 
    if(result != 32'd10) $display("SLL result Error");
    if(zero != 1'b0) $display("SLL zero Error");
    #20 
    a = 32'd5; 
    b = 32'd2;
    #1 
    if(result != 32'd20) $display("SLL result Error");
    if(zero != 1'b0) $display("SLL zero Error");
    #20 
    a = 32'd1; 
    b = 32'd31;
    #1 
    if(result != 32'h80000000) $display("SLL result Error");
    if(zero != 1'b0) $display("SLL zero Error"); 

    //SRL tests
    #20
    alu_op = 4'b1000;
    a = 32'd10; 
    b = 32'd1; 
    #1 
    if(result != 32'd5) $display("SRL result Error");
    if(zero != 1'b0) $display("SRL zero Error");
    #20 
    a = 32'd20; 
    b = 32'd2;
    #1 
    if(result != 32'd5) $display("SRL result Error");
    if(zero != 1'b0) $display("SRL zero Error");
    #20 
    a = 32'hFFFFFFFF; 
    b = 32'd31;
    #1 
    if(result != 32'b1) $display("SRL result Error");
    if(zero != 1'b0) $display("SRL zero Error"); 

     //SRA tests
    #20
    alu_op = 4'b1001;
    a = 32'h80000000; 
    b = 32'd1; 
    #1 
    if(result != 32'hC0000000) $display("SRA result Error");
    if(zero != 1'b0) $display("SRA zero Error");
    #20 
    a = 32'hF0000000; 
    b = 32'd4;
    #1 
    if(result != 32'hFF000000) $display("SRA result Error");
    if(zero != 1'b0) $display("SRA zero Error");
    #20 
    a = 32'h80000000; 
    b = 32'd31;
    #1 
    if(result != 32'hFFFFFFFF) $display("SRA result Error");
    if(zero != 1'b0) $display("SRA zero Error"); 
    #100
    $display("All ALU tests passed");
    $finish;
end

endmodule

