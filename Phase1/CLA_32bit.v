module CLA_32bit(
input [31:0] A, B,
input select, // 0: addition, 1: subtraction
input Cin,
output wire [31:0] sum,
output Cout

);

wire C0, C1, C2, C3, C4, C5, C6;
reg [31:0] operand;

always @(*) begin
	if (select==1) begin
		operand = (~B);
	end else operand = B;
end
	

cla_4bit adder1(A[3:0], operand[3:0], Cin, sum[3:0], C0);
cla_4bit adder2(A[7:4], operand[7:4], C0, sum[7:4], C1);
cla_4bit adder3(A[11:8], operand[11:8], C1, sum[11:8], C2);
cla_4bit adder4(A[15:12], operand[15:12], C2, sum[15:12], C3);
cla_4bit adder5(A[19:16], operand[19:16], C3, sum[19:16], C4);
cla_4bit adder6(A[23:20], operand[23:20], C4, sum[23:20], C5);
cla_4bit adder7(A[27:24], operand[27:24], C5, sum[27:24], C6);
cla_4bit adder8(A[31:28], operand[31:28], C6, sum[31:28], Cout);

endmodule
