module mux_2_1_1bit(
	input wire data_1, data_0, select,
	output wire mux_out
);

	assign mux_out = select ? data_1 : data_0;
endmodule