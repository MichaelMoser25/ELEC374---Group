module fulladd (  
	input wire a,
	input wire b,
	input wire cin,
	output wire cout,
	output wire sum
);

	assign sum = a^b^c;
	assign cout = a&b | a&cin | b&cin;

endmodule