module ALU ( 
input wire [31:0] A, B,
input wire [3:0]  op,
output reg [31:0]  result
);
 wire [31:0] sum_add;
 wire [31:0] sum_sub;
 wire Cout_add;
 wire Cout_sub;
 
 CLA_32bit adder (
	  .A(A),
	  .B(B),
	  .select(0),
	  .Cin(0),
	  .sum(sum_add),
	  .Cout(Cout_add)
 );
	  CLA_32bit subtractor (
	  .A(A),
	  .B(B),
	  .select(1),
	  .Cin(1),
	  .sum(sum_sub),
	  .Cout(Cout_sub)
 );
/* OPERATORS:
	0 : or
	1 : and
	2 : not
	3 : add
	4 : sub
*/
 
always @(*) begin
	case(op)
				0		: result = (A|B);
				1		: result = (A&B);
				2		: result = ~A;
				3		: result = sum_add;
				4		: result = sum_sub;
				

				default: result = A;
	endcase
end

endmodule

