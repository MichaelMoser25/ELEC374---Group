module MemoryDataRegister(
// MDMux
input [31:0]BusMuxOut, input [31:0]Mdatain,
input read,
// MDR
input clr, input clk, input write,

output reg [31:0] MDRout

);
always @(posedge clk) begin
	if(clr) begin
		MDRout = 32'h0;
	end else if(write) begin
		if(read) begin
			MDRout <= Mdatain;
		end else begin
			MDRout <= BusMuxOut;
		end
	end
end

	
endmodule
