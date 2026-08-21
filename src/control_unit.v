module control_unit(
    input [6:0]opcode,
    input [2:0]funct3,
    input [6:0]funct7,

    output reg reg_write,
    output reg mem_write,
    output reg alu_src,
    output reg branch,
    output reg result_src,
    output reg [3:0]alu_op
);

localparam R_type = 7'b0110011;
localparam I_type1 = 7'b0010011;
localparam I_type2 = 7'b0000011;
localparam S_type = 7'b0100011;
localparam B_type = 7'b1100011;

localparam ADD_OR_SUB = 3'b000;
localparam AND = 3'b111;
localparam OR = 3'b110;
localparam XOR = 3'b100;
localparam SLT = 3'b010;

always @(*) begin
    reg_write = 1'b0;
    mem_write = 1'b0;
    alu_src = 1'b0;
    branch = 1'b0;
    result_src = 1'b0;
    alu_op = 4'b0000;

    case(opcode)
    R_type: begin
        case(funct3)
        ADD_OR_SUB: begin
            if(funct7 == 7'b0000000) begin
                reg_write = 1'b1;
                mem_write = 1'b0;
                alu_src = 1'b0;
                branch = 1'b0;
                result_src = 1'b0;
                alu_op = 4'b0000;
            end

            if(funct7 == 7'b0100000) begin
                reg_write = 1'b1;
                mem_write = 1'b0;
                alu_src = 1'b0;
                branch = 1'b0;
                result_src = 1'b0;
                alu_op = 4'b0001;
            end
        end

        AND: begin
            if(funct7 == 7'b0000000) begin
                reg_write = 1'b1;
                mem_write = 1'b0;
                alu_src = 1'b0;
                branch = 1'b0;
                result_src = 1'b0;
                alu_op = 4'b0010;
            end
        end

        OR: begin
            if(funct7 == 7'b0000000) begin
                reg_write = 1'b1;
                mem_write = 1'b0;
                alu_src = 1'b0;
                branch = 1'b0;
                result_src = 1'b0;
                alu_op = 4'b0011;
            end
        end

        XOR: begin
            if(funct7 == 7'b0000000) begin
                reg_write = 1'b1;
                mem_write = 1'b0; 
                alu_src = 1'b0;
                branch = 1'b0;
                result_src = 1'b0;
                alu_op = 4'b0100;
            end
        end

        SLT: begin
            if(funct7 == 7'b0000000) begin
                reg_write = 1'b1;
                mem_write = 1'b0;
                alu_src = 1'b0;
                branch = 1'b0;
                result_src = 1'b0;
                alu_op = 4'b0101;
            end
        end
        endcase   
    end

    I_type1: begin
        if(funct3 == 3'b000) begin
            reg_write = 1'b1;
            mem_write = 1'b0;
            alu_src = 1'b1;
            branch = 1'b0;
            result_src = 1'b0;
            alu_op = 4'b0000;
        end
    end

    I_type2: begin
        if(funct3 == 3'b010) begin
            reg_write = 1'b1;
            mem_write = 1'b0;
            alu_src = 1'b1;
            branch = 1'b0;
            result_src = 1'b1;
            alu_op = 4'b0000;
        end
    end

    S_type: begin
        if(funct3 == 3'b010) begin
            reg_write = 1'b0;
            mem_write = 1'b1;
            alu_src = 1'b1;
            branch = 1'b0;
            result_src = 1'b0;
            alu_op = 4'b0000;
        end
    end

    B_type: begin
        if(funct3 == 3'b000 || funct3 == 3'b001) begin
            reg_write = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            branch = 1'b1;
            result_src = 1'b0;
            alu_op = 4'b0001;
        end
    end

    endcase
end


endmodule
