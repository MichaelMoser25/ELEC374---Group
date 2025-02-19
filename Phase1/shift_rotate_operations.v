module shift_left (
input wire [31:0] data_in,
input wire [31:0] shift_val,
output wire [31:0] data_out
);
assign data_out = data_in << shift_val;

endmodule

module shift_right (
input wire [31:0] data_in,
input wire [31:0] shift_val,
output wire [31:0] data_out
);
assign data_out = data_in >> shift_val;

endmodule

module arithmetic_shift_right (
input wire [31:0] data_in,
input wire [31:0] shift_val,
output wire [31:0] data_out
);
	assign data_out = data_in >>> shift_val;
	
endmodule

module rotate_left (
input wire [31:0] data_in,
input wire [31:0] rot_val,
output reg [31:0] data_out
);
	reg [4:0] r;
	always @(*) begin
	r = rot_val;
	data_out = (data_in << r)|(data_in >> (32-r));
	end
	
endmodule

module rotate_right (
input wire [31:0] data_in,
input wire [31:0] rot_val,
output reg [31:0] data_out
);
	reg [4:0] r;
	always @(*) begin
	r = rot_val;
	data_out = (data_in >> r)|(data_in << (32-r));
	end
endmodule
