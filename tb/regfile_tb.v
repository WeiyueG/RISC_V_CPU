module regfile_tb;
    reg clk;
    reg we;
    reg [4:0] rs1;
    reg [4:0] rs2;
    reg [4:0] rd;
    reg [31:0] wd;
    wire [31:0] rd1;
    wire [31:0] rd2;

    regfile U1(
        .clk(clk),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );

    always begin
        #10;
        clk = ~clk;
    end

    initial begin

        // wd test
        clk = 0;
        we = 0;
        rs1 = 0;
        rs2 = 0;
        rd = 5'd5;
        wd = 32'hA;

        #5;
        rs1 = 5'd5;
        #10;
        if(rd1 == 32'hA) $display("we = 0 write error");

        #10;
        we = 1;

        //rd & wd test
        rd = 5'd5;
        wd = 32'hA;
        #20;
        rd = 5'd6;
        wd = 32'hB;

        #10;

        //rs test
        rs1 = 5'd5;
        rs2 = 5'd6;

        #10;
        if(rd1 != 32'hA) $display("rd test error");
        if(rd2 != 32'hB) $display("rd test error");

        //check the first register remains 0
        rd = 0;
        wd = 32'd999;
        
        #20;
        rs1 = 0;

        #10;
        if(rd1 != 0) $display("First register error");

        #10;
        $display("All tests passed");

        #100;
        $finish;
    end

endmodule
