module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_op,
    output reg [31:0] result,
    output zero
);

localparam ADD = 4'b0000;
localparam SUB = 4'b0001;
localparam AND = 4'b0010;
localparam OR = 4'b0011;
localparam XOR = 4'b0100;
localparam SLT = 4'b0101;
localparam SLTU = 4'b0110;
localparam SLL = 4'b0111;
localparam SRL = 4'b1000;
localparam SRA = 4'b1001;

always @(*) begin
    case(alu_op)
    ADD: result = a + b;
    SUB: result = a - b;
    AND: result = a & b;
    OR: result = a | b;
    XOR: result = a ^ b;
    SLT: begin
        if($signed(a) < $signed(b)) result = 32'b1;
        else result = 32'd0;
    end
    SLTU: begin
        if(a < b) result = 32'd1;
        else result = 32'b0;
    end
    SLL: result = (a << b[4:0]);
    SRL: result = (a >> b[4:0]);
    SRA: result = ($signed(a) >>> b[4:0]);
    default: result = 32'b0;
    endcase
end

assign zero = (result == 32'b0);

endmodule




