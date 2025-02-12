module register (
input clr, clk, write,
input [31:0] d,
output reg [31:0] q
);

initial q = 0;

always @ (negedge clk) begin
	if (clr) begin
		q <= 0;
	end
	else if (write) begin
		q <= d;
	end
end

endmodule
					

