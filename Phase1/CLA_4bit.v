module CLA_4bit(
input wire [3:0]  A, B,
input  wire Cin,
output wire [3:0] sum,
output wire Cout
);
wire P0, P1, P2, P3;
wire G0, G1, G2, G3;
wire C1, C2, C3, C4;

assign P0 = A[0]^B[0];
assign P1 = A[1]^B[1];
assign P2 = A[2]^B[2];
assign P3 = A[3]^B[3];

assign G0 = A[0]&B[0];
assign G1 = A[1]&B[1];
assign G2 = A[2]&B[2];
assign G3 = A[3]&B[3];

assign C1 = G0 | P0&Cin;
assign C2 = G1 | P1&G0 | P1&P0&Cin;
assign C3 = G2 | P2&G1 | P2&P1&C1 | P2&P1&P0&Cin;
assign C4 = G3 | P3&G2 | P3&P2&C2 | P3&P2&P1&C1 | P3&P2&P1&P0&Cin;

assign sum[0] = P0^Cin;
assign sum[1] = P1^C1;
assign sum[2] = P2^C2;
assign sum[3] = P3^C3;
assign Cout = C4;

endmodule
