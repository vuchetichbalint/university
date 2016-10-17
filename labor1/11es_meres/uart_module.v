`timescale 1ns / 1ps
module uart_module(
	input clk,
	input rst,
	input [3:0] bcd0,
	input [3:0] bcd1,
	output tx_out
 );

reg [4:0] tx_cntr; // counter: which bit we put on the output  
reg [29:0] tx_shr; // shiftregister: we put in this all three chars at the same time
reg tx_en; //enabling flag
reg tx_reg; // register for output

reg [8:0] bd; // for 576000 bit/sec with 16MHz we need to count for 16M/57.6k=277 what we can represent with 9 bits

// assig the output reg to the actual output
assign tx_out = tx_reg;

always@(posedge clk)
begin
	if(rst)
	begin
		// reset set all signals to default values
		tx_en <= 0;
		tx_shr <= 0;
		bd <= 0;
		tx_cntr <= 0;
		tx_reg <= 1;
	end

	else 
	begin
	// instead of 'rategen' module 
		if(bd==277) // 16000000/57600 = 277 
		begin
			bd <= 0;
			tx_en <= 1;
		end
		else
		begin
			bd <= bd + 1;
			tx_en <= 0;
		end
	end

	if(tx_en)
	begin

		if(tx_cntr==0)
		begin
			//bcd1
			tx_shr[0] <= 1'b0; //start
			tx_shr[7:1] <= {3'b011,bcd1[3:0]}; //hexa 30 (ASCII '0') + bcd
			tx_shr[8] <= bcd1[0]+bcd1[1]+bcd1[2]+bcd1[3]+1; //parity
			tx_shr[9] <= 1; //stop
			
			//bcd0
			tx_shr[10] <= 0; //start
			tx_shr[17:11] <= {3'b011,bcd0[3:0]}; //hexa 30 (ASCII '0') + bcd
			tx_shr[18] <= bcd0[0]+bcd0[1]+bcd0[2]+bcd0[3]+1; //parity
			tx_shr[19] <= 1; //stop
			
			// add carriage return char
			tx_shr[20] <= 0; //start
			tx_shr[27:21] <= 7'b0001101; // CR in ascii is 0x0d
			tx_shr[28] <= 0; //parity
			tx_shr[29] <= 1; //stop

			tx_cntr <= 29; // set counter for counting down
			tx_reg <= 1; //set output 1
		end
		else
		begin
			// otherwise put out the LSB to the output then shift right and count down 
			tx_reg <= tx_shr[0];
			tx_shr <= tx_shr >> 1;
			tx_cntr <= tx_cntr - 1;
		end
	end
end
endmodule