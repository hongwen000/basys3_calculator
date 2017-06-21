
module display_controller(
	input logic clk, 
	input logic clear, 
	input logic [15:0] adata, 
	input logic [15:0] bdata, 
	output logic [3:0] select, 
	output logic [7:0] segment, 
	output logic clk_slow
	);
	wire [15:0] data;
	reg [3:0] segdata;
	reg [20:0] cnt;
	assign data = (bdata == 0) ? adata : bdata;  
	always @ (posedge clk)   
	begin 
		if(clear)
		begin
			cnt <= 0;
			clk_slow <= 1;
		end
		else
		begin
			cnt <= cnt + 1; 
			clk_slow <= cnt[19]; 
		end
	end
	always @ (posedge clk)   
	begin
		if(clear)
		begin
			select <= 0;
		end
		else
		begin
			case (cnt[20:19])
				2'b00: begin select = 4'b0111; segdata <= data[3:0];end  
				2'b01: begin select = 4'b1011; segdata <= data[7:4];end
				2'b10: begin select = 4'b1101; segdata <= data[11:8];end
				2'b11: begin select = 4'b1110; segdata <= data[15:12];end
				default:  segdata <= 0;
			endcase
		end
	end
	always @ (*) 
	begin
		if(clear)
		begin
			segment <= 8'b11111111;
		end
		else
		begin
		  case(segdata)
	         4'h0: segment = 8'b10000001;
	         4'h1: segment = 8'b11001111;
	         4'h2: segment = 8'b10010010;
	         4'h3: segment = 8'b10000110;
	         4'h4: segment = 8'b11001100;
    	     4'h5: segment = 8'b10100100;
        	 4'h6: segment = 8'b10100000;
        	 4'h7: segment = 8'b10001111;
        	 4'h8: segment = 8'b10000000;
        	 4'h9: segment = 8'b10000100;
        	 4'hA: segment = 7'b10001000;
        	 4'hB: segment = 7'b11100000;
        	 4'hC: segment = 7'b10110001;
        	 4'hD: segment = 7'b11000010;
        	 4'hE: segment = 7'b10110000;
        	 4'hF: segment = 7'b10111000;
			default: segment <= 8'b11111111;
		endcase
	  end
	end
endmodule
