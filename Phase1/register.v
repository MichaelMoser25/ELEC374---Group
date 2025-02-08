module register (
input clr, clk, write,
input [31:0] BusMuxOut,
output reg [31:0] q
);

initial q = 0;

always @ (posedge clk) begin
	if (clr) begin
		q = 0;
	end
	else if (write) begin
		q = BusMuxOut;
	end
end

endmodule
					

