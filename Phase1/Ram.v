module Ram(
	input clk, read, write,
	input [7:0] address,
	input [31:0] data_in,
	output reg [31:0] data_out
	
);
	reg [32:0]memory [511:0];
	
	always @(posedge clk) begin
		if (write)
			memory[address] <= data_in;
		else if (read)
			data_out <= memory[address];
	end
	
endmodule 