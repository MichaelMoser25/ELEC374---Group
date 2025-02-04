module divider_cell(
	input a, bin, cin, modein, 
	output bout, cout, sum, modeout
);

	wire wXor;

	xor(wXor, modein, bin);
	
	assign modeout = modein;
	assign bout = bin;
	
	fulladd FA(wXor, a, cin, cout, sum); 
	
endmodule