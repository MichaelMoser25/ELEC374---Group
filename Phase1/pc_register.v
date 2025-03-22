module pc_register (
input clk, increment, enable, 
input[31:0] pc_in,
output reg[31:0] pc_out
);

initial pc_out = 0;

always @(negedge clk)
	begin
		if(enable && increment)
			pc_out <= pc_out + 1;
			
			else if (enable)
			pc_out <= pc_in;
	end


endmodule
					