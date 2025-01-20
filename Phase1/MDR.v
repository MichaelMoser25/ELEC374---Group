module MemoryDataRegister #(parameter INIT = 32'h0)(
// MDMux
input [31:0]BusMuxOut, input [31:0]Mdatain,
input read,
// MDR
input clr, input clk, input write,

output MDRout

);
reg [31:0] data = INIT;
always @(posedge clk) begin
	if(clr) begin
		data = 32'h0;
	end else if(write) begin
		if(read) begin
			data = Mdatain;
		end else begin
			data = BusMuxOut;
		end
	end
end
assign MDRout = data;

	
endmodule