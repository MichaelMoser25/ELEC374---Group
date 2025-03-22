module Ram #(parameter MEM_FILE = "memory.hex" )(
	input clk, read, write,
	input [8:0] address,
	input [31:0] data_in,
	output reg [31:0] data_out
	
);
	reg [31:0]memory [0:511];
	
    initial begin
			data_out = 32'd0;
			$readmemh(MEM_FILE, memory);
//			$readmemh("memory.hex", memory);

    end

	
	always @(*) begin
		if (write)
			memory[address] <= data_in;
		else if (read)
			data_out <= memory[address];
	end
	
	
	
endmodule 