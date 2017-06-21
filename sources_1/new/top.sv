
module top (
       input logic clk, 
       input logic clear, 
       input logic [3:0] scan_got,
       output logic [3:0] scan_output,                       
       output logic [3:0] select,
       output logic [7:0] segment,
       output logic [3:0] state_on_LED,
       output logic [3:0] opcode_on_LED,
       output logic [7:0] BCDa_on_LED
		);
		
    logic [4:0] HEX_key;
    logic [3:0] opcode;
    wire [15:0] BCD_num_a, BCD_num_b;
    logic [15:0] num_a, num_b;
    logic [15:0] alu_result, result;
    logic clk_slow;
    logic [3:0] state_on_LED;
    logic key_pressed_signal;
    keyboard_driver u0(
      clk,
      clear,
      scan_got,
      scan_output,
      HEX_key,
      key_pressed_signal
    );
    display_controller u1(
      clk,
      clear,
      BCD_num_a,
      BCD_num_b,
      select,
      segment,
      clk_slow
    );
    read_input u2(
      clk_slow,
      clear,
      HEX_key,
      opcode,
      BCD_num_a,
      BCD_num_b,
      key_pressed_signal,
      state_on_LED,
      opcode_on_LED,
      BCDa_on_LED, 
      result
    );
    alu u3(
      clk,
      clear,
      num_a,
      num_b,
      opcode,
      alu_result
    );
    input_to_alu u4(
      BCD_num_a,
      BCD_num_b,
      num_a,
      num_b
    );
    alu_to_output u5(
      alu_result, 
      result
    );
endmodule