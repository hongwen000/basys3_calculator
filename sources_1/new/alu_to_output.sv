`timescale 1ns / 1ps
module alu_to_output(
    input logic [15:0] alu_result,
    output logic [15:0] result
    );
	assign result[15:12] = (alu_result/ 1000)% 10;		
	assign result[11:8] = (alu_result/ 100)% 10;
	assign result[7:4] = (alu_result/ 10)% 10;	
	assign result[3:0] = alu_result%10;	
endmodule
