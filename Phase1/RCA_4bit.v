module RCA_4bit(
	input wire [3:0] a, b,
	input wire c_in,
	output wire [3:0] sum,
	output wire c_out
);

	wire c_in2, c_in3, c_in4;
	
	fulladd add1(a[0], b[0], c_in, c_in2, sum[0]);
	fulladd add2(a[1], b[1], c_in2, c_in3, sum[1]);
	fulladd add3(a[2], b[2], c_in3, c_in4, sum[2]);
	fulladd add4(a[3], b[3], c_in4, c_out, sum[3]);

endmodule