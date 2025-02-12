module ALU ( 
input wire [31:0] A, B,
input wire [4:0]  op,
output reg [63:0]  result,
input clk
);
	
	
wire [31:0] ADD, SUB, AND, OR, ROR, ROL, SHR, SHRA, SHL, DIVHI, DIVLO, MUL, NEG, NOT;
wire ADD_cout, SUB_cout;

/* Operations specified:
	00011 : add
	00100 : sub
	00101 : and
	00110 : or
	00111 : ror
	01000 : rol
	01001 : shr
	01010 : shra
	01011 : shl
	01100 : addi
	01101 : andi
	01110 : ori
	01111 : div
	10000 : mul
	10001 : neg
	10010 : not
*/
 
always @(*) begin

	case(op)

		5'b00011		:	begin
							result[63:32] = 0;
							result[31:0] = ADD;

						end
						
		5'b00100		:	begin
							result[63:32] = 0;
							result[31:0] = SUB;

						end
						
		5'b00101		:	begin
							result[63:32] = 0;
							result[31:0] = AND;
						end
						
		5'b00110		:	begin
							result[63:32] = 0;
							result[31:0] = OR;
						end
		
		5'b00111		:	begin
							result[63:32] = 0;
							result[31:0] = ROR;
						end
		
		5'b01000		:	begin
							result[63:32] = 0;
							result[31:0] = ROL;
						end
		
		5'b01001		:	begin
							result[63:32] = 0;
							result[31:0] = SHR;
						end
						
		5'b01010		:	begin
							result[63:32] = 0;
							result[31:0] = SHRA;
						end
		
		5'b01011		:	begin
							result[63:32] = 0;
							result[31:0] = SHL;
						end
						
		5'b01111		:	begin
							result[63:32] = DIVHI;
							result[31:0] = DIVLO;
						end
						
		5'b10000		:	begin
							result[63:32] = 0;
							result[31:0] = MUL;
						end						

						
		5'b10001		:	begin
							result[63:32] = 0;
							result[31:0] = NEG;
						end
						
		5'b10010		:	begin
							result[63:32] = 0;
							result[31:0] = NOT;
						end
				

				default: result = 0;
	endcase
end


CLA_32bit adder (
	  .A(A),
	  .B(B),
	  .Cin(1'b0),
	  .sum(ADD),
	  .Cout(ADD_cout)
 );
CLA_32bit subtractor (
	  .A(A),
	  .B(B),
	  .Cin(1'b1),
	  .sum(SUB),
	  .Cout(SUB_cout)
 );

logic_and l_and (
	.A(A),
	.B(B),
	.result(AND)
);

logic_or l_or (
	 .A(A),
	 .B(B),
	 .result(OR)
);

shift_left s_left (
    .data_in(A),
    .shift_val(B),
    .data_out(SHL)
);

shift_right s_right (
    .data_in(A),
    .shift_val(B),
    .data_out(SHR)
);

arithmetic_shift_right s_right_a (
    .data_in(A),
    .shift_val(B),
    .data_out(SHRA)
);

rotate_left r_left (
    .data_in(A),
    .rot_val(B),
    .data_out(ROL)
);
	
rotate_right r_right (
    .data_in(A),
    .rot_val(B),
    .data_out(ROR)
);
	
	
NRdiv divider (
	.dividend(A),
	.divisor(B),
	.quotient(DIVHI),
	.remainder(DIVLO)
);

//BoothMul multiplier (
//	.multiplicand(A),
//   .multiplier(B),
//   .product(MUL)

logic_not l_not (
	 .A(A),
	 .result(NOT)
);

logic_negate l_neg (
	 .A(A),
	 .result(NEG)
);



endmodule

