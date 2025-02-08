module MemoryDataRegister(
// MDMux
input [31:0]BusMuxOut, input [31:0]Mdatain,
input read,
// MDR
input clr, input clk, input write,

output[31:0] MDRout

);
reg [31:0] data = 0;
always @(posedge clk) begin
	if(clr) begin
		data = 32'h0;
	end else if(write) begin
		if(read) begin
			data <= Mdatain;
		end else begin
			data <= BusMuxOut;
		end
	end
end
assign MDRout = data;

	
endmodule
