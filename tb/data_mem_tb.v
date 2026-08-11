module data_mem_tb;

    reg clk;
    reg mem_write;
    reg [31:0] addr;
    reg [31:0] write_data;
    wire [31:0] read_data;
    integer i;

    data_mem U1(
        .clk(clk),
        .mem_write(mem_write),
        .addr(addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    always begin
        #10;
        clk = ~clk;
    end

    initial begin
        clk = 0;
        mem_write = 0;
        write_data = 0;
        addr = 0;

        #5;
        //initial test
        for(i = 0; i < 256; i = i + 1) begin
            addr = i * 4;
            #1;
            if(read_data != 0)
            $display("initial error");
        end

        //read data test
        #20;
        U1.memory[0] = 32'hAAAAAAAA;
        #20;
        addr = 32'b0;
        #20;
        if(read_data != 32'hAAAAAAAA) $display("read data error");

        #20;
        U1.memory[255] = 32'hF0F0F0F0;
        #20;
        addr = 32'd1020;
        #20;
        if(read_data != 32'hF0F0F0F0) $display("read data error");

        //write data test
        #20;
        addr = 32'b0;
        write_data = 32'd100;
        #20;
        mem_write = 1;
        #20;
        mem_write = 0;
        #1;
        if(U1.memory[0] != 32'd100) $display("write memory error");

        #20;
        addr = 32'd400;
        write_data = 32'hA0A0A0A0;
        #20;
        mem_write = 1;
        #20;
        mem_write = 0;
        #1;
        if(U1.memory[100] != 32'hA0A0A0A0) $display("write memory error");

        #20;
        $display("All tests passed");
        $finish;        
    end

endmodule
