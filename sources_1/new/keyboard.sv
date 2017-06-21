`define NOT_PRESSED 16
module keyboard_driver(
        input logic clk,
		input logic clear,
        input logic [3:0] scan_got,
        output logic [3:0] scan_output,
        output logic [4:0] HEX_key,
		output logic key_pressed_signal
     );
    
    logic key_pressed;
    logic [7:0] key;
    logic [7:0] tmp_key;
    logic [7:0] tmp_key_once_press;
	logic [20:0] count, nextcount;
    logic [3:0] scan_got_reg;
    logic [3:0] scan_output_reg;
    logic [23:0]count_press_time, countnext_press_time;
    logic [3:0] state;
	logic key_pressed_signal;
	assign key_pressed_signal = (state == 4'd15) ? 1 : 0;
	always_ff @(posedge clk) begin
	   if (~key_pressed) 
       begin 
	   	   if(nextcount)
           	   count <= nextcount;
           else count <= 0; 
       end
       else if(key_pressed) 
       begin 
           tmp_key_once_press = {scan_got_reg, scan_output_reg};
           count_press_time <= countnext_press_time;
       end 
    end
	always_comb begin
        countnext_press_time = count_press_time + 1;
		nextcount = count + 1;
    end
			
	always_comb begin
	   case (count[20:19])
		2'b00:  scan_output <= 4'b0001; 	
		2'b01:  scan_output <= 4'b0010; 		
		2'b10:  scan_output <= 4'b0100; 	
		2'b11:  scan_output <= 4'b1000; 		
	   endcase	
	    if((scan_got == 4'b1000) | (scan_got == 4'b0100) | (scan_got == 4'b0010) | (scan_got == 4'b0001) )  begin key_pressed = 1; scan_got_reg <= scan_got; scan_output_reg <= scan_output; end 
	    else begin key_pressed <= 0;  end
	end

always @(posedge count_press_time[19]) 
 if(!key_pressed) 
 begin 
 	state <= 4'b0000;
 end 
 else 
	case (state)
4'd0: begin   
			tmp_key <= tmp_key_once_press;
			state <=4'd1;
		end
4'd1: begin 
			if(tmp_key_once_press == tmp_key)
				state <= 4'd2;
			else
				state <= 4'd0;
		end
4'd2: begin
			if (tmp_key_once_press == tmp_key)                  
				state <= 4'd3;
			else
				state <= 4'd0;
		end                     
4'd3: begin
			if (tmp_key_once_press == tmp_key)                
				state <= 4'd4;
			else
				state <= 4'd0;   
		end          
4'd4: begin   
			 if(tmp_key_once_press == tmp_key)
				state <=4'd5;
			 else
				state <= 4'd0; 
		end
4'd5: begin 
			if(tmp_key_once_press == tmp_key)
				state <= 4'd6;
			else
				state <= 4'd0;
		end
4'd6: begin
			if (tmp_key_once_press == tmp_key)                  
				state <= 4'd7;
			else
				state <= 4'd0;
		end                     
4'd7: begin
			if (tmp_key_once_press == tmp_key)                
				  state <= 4'd8;
			else
				  state <= 4'd0;   
		end          
4'd8: begin 
			if (tmp_key_once_press == tmp_key)    
				  state <=4'd9;
			else
				  state <= 4'd0;  
		end
4'd9: begin 
			if(tmp_key_once_press == tmp_key)
				  state <= 4'd10;
			else
				  state <= 4'd0;
		end
4'd10: begin
			if (tmp_key_once_press == tmp_key)                  
				  state <= 4'd11;
			else
				 state <= 4'd0;
		end                     
4'd11: begin
			if (tmp_key_once_press == tmp_key)                
				 state <= 4'd12;
			else
				 state <= 4'd0;   
		end          
4'd12: begin 
			if(tmp_key_once_press == tmp_key)
			  state <= 4'd13;
			else
			  state <= 4'd0;
		end
4'd13: begin
			if (tmp_key_once_press == tmp_key)                  
				  state <= 4'd14;
			else
				 state <= 4'd0;
		end                     
4'd14: begin
			if (tmp_key_once_press == tmp_key)                
			 state <= 4'd15;
			else
			 state <= 4'd0;   
		end                 
4'd15: begin
			if (tmp_key_once_press == tmp_key ) 
				begin                 
					state <= 4'd0;
					key <=tmp_key_once_press; 
				end
			else
						 state <= 4'b0000; 
		end                        
  default:   state <= 4'b0000;   
  endcase   


always_comb
	if(clear || !key_pressed)
		HEX_key = `NOT_PRESSED;
	else
       case (key)
        8'b00010001: HEX_key = 4'b0001; //按键0 -> 1
        8'b00010010: HEX_key = 4'b0010; //按键1 -> 2
        8'b00010100: HEX_key = 4'b0011; //按键2 -> 3
        8'b00011000: HEX_key = 4'b1010; //按键3 -> 10(+) 
        8'b00100001: HEX_key = 4'b0100; //按键4 -> 4
        8'b00100010: HEX_key = 4'b0101; //按键5 -> 5
        8'b00100100: HEX_key = 4'b0110; //按键6 -> 6 
        8'b00101000: HEX_key = 4'b1011; //按键7 -> 11(-)
        8'b01000001: HEX_key = 4'b0111; //按键8 -> 7 
        8'b01000010: HEX_key = 4'b1000; //按键9 -> 8 
        8'b01000100: HEX_key = 4'b1001; //按键10-> 9
        8'b01001000: HEX_key = 4'b1100; //按键11-> 12(*) 
        8'b10000001: HEX_key = 4'b1100; //按键12-> 15(无作用) 
        8'b10000010: HEX_key = 4'b0000; //按键13-> 0 
        8'b10000100: HEX_key = 4'b1110; //按键14-> 14(=) 
        8'b10001000: HEX_key = 4'b1101; //按键15-> 13(/) 
        default HEX_key = `NOT_PRESSED; 	
       endcase          	   
endmodule