`timescale 1ns / 1ps
module floating_point_addition(
input wire [31:0]flp_a,
input wire [31:0]flp_b,
output reg sign_out,
output reg [7:0] exp_out,
output reg [22:0] fraction_out
);

//define operator fraction,exponent,sign

reg sign_a,sign_b;
reg [22:0]frac_a,frac_b;
reg [7:0] exp_a,exp_b;

 reg [7:0]align;
reg carry;

reg [7:0] exp_a_bias,exp_b_bias;

always@(*)
begin
	sign_a=flp_a[31];
	frac_a=flp_a[22:0];
	exp_a=flp_a[30:23];
	
	sign_b=flp_b[31];
	frac_b=flp_b[22:0];
	exp_b=flp_b[30:23];



// in ieee format are  normalized;the left most significant bit is a 1

	frac_a=frac_a>>1;
	frac_a [22]=1'b1;
	frac_b=frac_b>>1;
	frac_b [22]=1'b1;


//A simple comparator  if the exponents are unsigned. so a bias constant is added to the exponents 127

  

	exp_a_bias=exp_a+127;
	exp_b_bias=exp_b+127;



//align fractions




if (exp_a_bias < exp_b_bias)
align = exp_b_bias - exp_a_bias;
while (align)
begin
frac_a= frac_a >> 1;
exp_a_bias = exp_a_bias + 1;
align = align - 1;
end
if (exp_b_bias < exp_a_bias)
align = exp_a_bias - exp_b_bias;
while (align)
begin
frac_b = frac_b >> 1;
exp_b_bias = exp_b_bias + 1;
align = align - 1;
end

//obtain result

	if(sign_a ==sign_b)
	begin
		{carry,fraction_out}=frac_a + frac_b;
	end
	else 
	begin
		{carry,fraction_out}=frac_a-frac_b;
	end
	


//normalized and obtain result


	if(carry==1)
	begin
		{carry,fraction_out}={carry,fraction_out} >> 1;
	end

	
exp_out=exp_b_bias;
sign_out=sign_a || sign_b;

end


endmodule
