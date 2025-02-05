module logic_and (
input	wire [31:0] A, B,
output wire [31:0] result
);
assign result = A&B;

endmodule

module logic_or (
input	wire [31:0] A, B,
output wire [31:0] result
);
assign result = A|B;

endmodule

module logic_not (
input wire [31:0] A,
output wire [31:0] result
);
assign result = ~A;

endmodule

module logic_negate (
input wire [31:0] A,
output wire [31:0] result
);
assign result = -A;

endmodule

