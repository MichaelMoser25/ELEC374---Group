module ALU ( 
input wire [31:0] A, B,
input wire [3:0]  op,
output reg [31:0]  result
);
wire Cout;
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
				3		: CLA_32bit adder(A, B, 0, 0, result, Cout);
				4		: CLA_32bit subtractor(A, B, 1, 0, result, Cout);
				

				default: result = A;
	endcase
end

endmodule

