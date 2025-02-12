module mux(input wire[31:0] a, b, input enable, output reg[31:0] out );
	always@(*)
	begin
		if (enable)
			out <= b;
		else
			out <= a;
	end

endmodule