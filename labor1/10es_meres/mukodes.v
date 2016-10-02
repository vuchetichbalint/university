`timescale 1ns / 1ps

module test;
	reg x;
	reg allow;
	reg clk;
	wire z;

	main uut (
		.x(x),
		.allow(allow),
		.clk(clk),
		.z(z)
	);

	initial begin
		//beallitjuk a kezdeti ertekeket
		x = 0;
		allow = 0;
		clk = 0;

		// 95 ns utan raadjuk az engedelyezo jelet, a bemeneten meg tartjuk a 0 jelet
		#95;
		allow = 1;
		x <= 0;

		// 20ns utan a bemenetre 1-et adunk
		#20
		x <= 1;

		// ezt egy orajel hosszusagig tartjuk, majd DC allapotba allitjuk
		#10
		x <= 1'bx;
		
		// 4 orajel mulva 1-re allitjuk a bemenetet, igy a rendszerunk tartani fogja az utolso allapotat
		#40
		x <= 1;

		// 3 orajel utan 0-ra allitjuk a bemenetet
		#30
		x <= 0;
		
		// 3 orajellel kesobb ismet 1-re allitjuk a bemenetet, a halozat ujra valaszol
		#30
		x <= 1;

		// megtortent a beallitas, DC allapotra allitjuk a bementunket
		#10
		x <= 1'bx;
		
		// 4 orajellel kesobb 0-ra allitjuk a bemenetet, most nem kell tartania az utolso allapotot
		#40
		x <= 0;
	end

	// 5ns-onkent invertaljuk az orajelet, igy lesz a periodusido 10ns
	always #5
	clk <= ~clk;

endmodule
