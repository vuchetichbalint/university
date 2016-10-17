`timescale 1ns / 1ps

module uart_test;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] bcd0;
	reg [3:0] bcd1;

	// Outputs
	wire tx_out;

	// Instantiate the Unit Under Test (UUT)
	uart_module uut (
		.clk(clk),
		.rst(rst),
		.bcd0(bcd0),
		.bcd1(bcd1),
		.tx_out(tx_out)
	);

	initial begin
		clk = 1;
		rst = 1;
		bcd0 = 0;
		bcd1 = 0;

		#100;
		rst=0;
		// Add stimulus here

		#1
		// junius 19. = 0619
		bcd1 = 0;
		bcd0 = 6;

		#2000  // long enough 
		bcd1 = 1;
		bcd0 = 9;
	end
	always #1 clk=~clk;

endmodule