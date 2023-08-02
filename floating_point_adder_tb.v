`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:51:13 08/01/2023
// Design Name:   floating_point_addition
// Module Name:   C:/example_verilog/floating_point_adder/floating_point_adder/floating_point_adder_tb.v
// Project Name:  floating_point_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: floating_point_addition
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module floating_point_adder_tb;

	// Inputs
	reg [31:0] flp_a;
	reg [31:0] flp_b;

	// Outputs
	wire sign;
	wire [7:0] exponent;
	wire [22:0] sum;

	// Instantiate the Unit Under Test (UUT)
	floating_point_addition uut (
		.flp_a(flp_a), 
		.flp_b(flp_b), 
		.sign(sign), 
		.exponent(exponent), 
		.sum(sum)
	);

	
	
	initial
$monitor ("sign = %b, exp_biased = %b, sum = %b",sign, exponent, sum);
//apply input vectors
initial
begin
//+12 + +35 = +47
// s ----e---- --------------f-------------
#0 flp_a = 32'b0_0000_0100_1000_0000_0000_0000_0000_000;
flp_b = 32'b0_0000_0110_0001_1000_0000_0000_0000_000;
//+26.5 + +4.375 = +30.875
// s ----e---- --------------f-------------
#10 flp_a = 32'b0_0000_0101_1010_1000_0000_0000_0000_000;
flp_b = 32'b0_0000_0011_0001_1000_0000_0000_0000_000;
//+11 + +34 = +45
// s ----e---- --------------f-------------
#10 flp_a = 32'b0_0000_0100_0110_0000_0000_0000_0000_000;
flp_b = 32'b0_0000_0110_0001_0000_0000_0000_0000_000;
//+23.75 + +87.125 = +110.875
// s ----e---- --------------f-------------
#10 flp_a = 32'b0_0000_0101_0111_1100_0000_0000_0000_000;
flp_b = 32'b0_0000_0111_0101_1100_1000_0000_0000_000;
#10 $stop;
end
      
endmodule

