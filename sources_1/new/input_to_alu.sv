`timescale 1ns / 1ps
module input_to_alu(
    input logic [15:0] BCD_num_a,
    input logic [15:0] BCD_num_b,
    output logic [15:0] num_a,
    output logic [15:0] num_b
    );
    assign num_a[15:0] = BCD_num_a[15:12]* 1000 + BCD_num_a[11:8]* 100 + BCD_num_a[7:4]* 10+ BCD_num_a[3:0];
    assign num_b[15:0] = BCD_num_b[15:12]* 1000 + BCD_num_b[11:8]* 100 + BCD_num_b[7:4]* 10+ BCD_num_b[3:0];
endmodule
