`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:08 10/02/2016 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


// modul be- es kimeneteinek definialasa
module main(
	// jel bemenet
	input x,
	// engedelyezo bemenet
	input allow,
	// orajel bemenet
	input clk,
	// jel kimente
	output z
);

// az allapot eltarolasara szolgalo regiszter
reg [2:0] state;
// a kimenetet tarolo regiszter
reg rout;


// a kezdeti ertekek beallitasa
initial begin
state <= 0;
rout <= 0;
end


// a modul mukodesenek leirasa
always @(posedge clk)
if(allow)
	case(state)
		0: begin
				rout <= 0;
				if(x)
					state <= 1;
			end
		1: begin
			rout <= 0;
			state <= 2;
		end
		2: begin
			rout <= 1;
			state <= 3;
		end
		3: begin
			rout <= 1;
			state <= 4;
		end
		4: begin
			if(x || rout)
			rout <= 1;
			if(x==0)
				begin
					rout <= 0;
					state <= 0;
				end
		end
	endcase


// kimeneti regiszter erteket rakotjuk a kimenetre
assign z = rout;

endmodule

