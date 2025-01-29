module register #(parameter DATA_WIDTH_IN = 32, DATA_WIDTH_OUT = 32, INIT = 32'h0)(
input clr, clk, write,
input [DATA_WIDTH_IN-1:0] BusMuxOut,
output wire [DATA_WIDTH_OUT-1:0] BusMuxIn
);

reg [DATA_WIDTH_IN-1:0]q;
initial q = INIT;

always @ (posedge clk) begin
	if (clr) begin
		q <= {DATA_WIDTH_IN{1'b0}};
	end
	else if (write) begin
		q <= BusMuxOut;
	end
end

assign BusMuxIn = q[DATA_WIDTH_OUT-1:0];
endmodule
					

