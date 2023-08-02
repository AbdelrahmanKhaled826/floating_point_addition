`timescale 1ns / 1ps

module floating_point_addition_tb;

	// Inputs
	reg [31:0] flp_a;
	reg [31:0] flp_b;

	// Outputs
	wire sign_out;
	wire [7:0] exp_out;
	wire [22:0] fraction_out;

	// Instantiate the Unit Under Test (UUT)
	floating_point_addition uut (
		.flp_a(flp_a), 
		.flp_b(flp_b), 
		.sign_out(sign_out), 
		.exp_out(exp_out), 
		.fraction_out(fraction_out)
	);
initial 
$monitor ("sign = %b, exp_biased = %b, sum = %b", sign_out, exp_out, fraction_out);


initial begin
		

//+12 + +35 = +47
// s ----e---- --------------f-------------
#0
 flp_a = 32'b0_0000_0100_1000_0000_0000_0000_0000_000;
flp_b = 32'b0_0000_0110_0001_1000_0000_0000_0000_000;
//+26.5 + +4.375 = +30.875
// s ----e---- --------------f-------------
#10 
flp_a = 32'b0_0000_0101_1010_1000_0000_0000_0000_000;
flp_b = 32'b0_0000_0011_0001_1000_0000_0000_0000_000;
//+11 + +34 = +45
// s ----e---- --------------f-------------
#10
 flp_a = 32'b0_0000_0100_0110_0000_0000_0000_0000_000;
flp_b = 32'b0_0000_0110_0001_0000_0000_0000_0000_000;
//+23.75 + +87.125 = +110.875
// s ----e---- --------------f-------------
#10
 flp_a = 32'b0_0000_0101_0111_1100_0000_0000_0000_000;
flp_b = 32'b0_0000_0111_0101_1100_1000_0000_0000_000;
#10

 flp_a = 32'b0_0000_0000_0000_0000_0000_0000_0000_000;
flp_b = 32'b0_0000_0000_0000_0000_0000_0000_0000_000;
#10
 $stop;

	end
      
endmodule

