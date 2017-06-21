module alu(
    input logic clk,
    input logic clear,
    input logic [15:0] num_a,
    input logic [15:0] num_b,
    input logic [3:0] opcode,
    output logic [15:0] result
    );
    always @ (posedge clk or posedge clear)
    begin
        if(clear)
        begin
            result <= 0;
        end
        else
        begin
            case(opcode)
                10: begin result <= num_a + num_b; end
                11: begin result <= num_a - num_b; end
                12: begin result <= num_a * num_b; end
                13: begin result <= num_a / num_b; end
            endcase
        end
    end
endmodule
