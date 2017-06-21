module read_input (
	input logic clk, 
	input logic clear, 
	input logic [4:0] HEX_key, 
	output logic [3:0] opcode, 
	output logic [15:0] BCD_num_a, 
	output logic [15:0] BCD_num_b, 
	input logic key_pressed_signal,
	output logic [3:0] state_on_LED,
	output logic [3:0] opcode_on_LED,
	output logic [7:0] BCDa_on_LED,
	input logic [15:0] result 
	); 
	
	reg [3:0] opcode_reg;
	reg [3:0] state;
	reg flag_pressed;
	reg state_pressed;
	assign opcode_on_LED = opcode;
    assign state_on_LED = state;
	assign BCDa_on_LED = BCD_num_a[7:0];
always @(posedge clk)
    if (clear)
    begin
		state_pressed <=0;
		flag_pressed <=0;
    end
    else
	  if (key_pressed_signal)    
      case(state_pressed)
       0: begin       	     
				flag_pressed <=1;
				state_pressed <=1;
       	  end
       1: begin
				flag_pressed  <=0;
				state_pressed <=1;
          end
		endcase
		else
		begin
			state_pressed <= 0;
			flag_pressed <= 0;
		end

	always @ (posedge clk or posedge clear)
	begin
		if(clear)
		begin
			BCD_num_a <= 0;
			BCD_num_b <= 0;
			state <= 0;
			opcode <= 0;
		end	
		else
		if(flag_pressed)
		begin
		begin
			case(state)
				0:	case(HEX_key[3:0])
					0,1,2,3,4,5,6,7,8,9:
					begin
						if(HEX_key <= 9)
							BCD_num_a[15:0] <= {8'b0,BCD_num_a[3:0],HEX_key[3:0]};
						state <= 0;
					end
					10,11,12,13:	
					begin
						opcode_reg <= HEX_key[3:0];	
						BCD_num_b <= 16'b0000_0000_0000_0000;
						state <= 1;
					end
					default:state <= 0;
					endcase
					
				1:	case(HEX_key[3:0])
					0,1,2,3,4,5,6,7,8,9:
					begin
						opcode <= opcode_reg;	
						BCD_num_b[15:0] <= {8'b0,BCD_num_b[3:0],HEX_key[3:0]};
						state <= 1;
					end
					14:		
					begin
						BCD_num_b <= 16'b0000_0000_0000_0000;
						BCD_num_a <= result;	
						state <= 0;
					end
					default:state <= 1;
					endcase
				default : state <= 0;
			endcase
		end
		end
	end
endmodule
