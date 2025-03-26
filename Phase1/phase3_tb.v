`timescale 1ns/10ps
module phase3_tb;
	reg clk, clr;
	reg [31:0] inport_data;
	wire [31:0] outport_data, busOut;
	initial begin
		clk = 0;
		forever #10 clk = ~clk; // 10 ns period
	end

	initial begin
		inport_data = 32'd207;
		clr = 1;
		#5 
		clr = 0;
	end

	CPU cpu_instance (
		.clk(clk),
		.clr(clr), 
		.outport_data(outport_data),
		.busOut(busOut),
		.inport_data(inport_data)
);

endmodule