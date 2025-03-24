module outport (
	input clr, clock, enable,
	input [31:0] D,
	output reg [31:0] Q
);

	always @ (*) begin
		if (clr) begin
			Q <= 32'h00000000;
		end
		else if (enable) begin
			Q <= D;
		end
	end

endmodule

module inport (
	input clr, clock, enable,
	input [31:0] D,
	output reg [31:0] Q
);
	
	initial begin
		Q = 32'hA2;
	end
	
	always @ (*) begin
		if (clr) begin
			Q <= 32'h00000000;
		end
		else if (enable) begin
			Q <= D;
		end
	end

endmodule

