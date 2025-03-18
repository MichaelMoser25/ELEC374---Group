module outport (
	input clr, clock, enable,
	input [31:0] D,
	output reg [31:0] Q
);

	reg [31:0] data;

	always @ (posedge clock or posedge clr) begin
		if (clr)
			data <= 32'h00000000;
		else if (enable) begin
			data <= D;
			Q <= data;
		end
	end

endmodule

module inport (
	input clr, clock,
	input [31:0] D,
	output reg [31:0] Q
);

	reg [31:0] data;
	
	always @ (posedge clock or posedge clr) begin
		if (clr)
			data <= 32'h00000000;
		else begin
			data <= D;
			Q <= data;
		end
	end

endmodule

