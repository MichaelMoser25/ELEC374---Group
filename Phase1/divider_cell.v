module divider_cell(
	input ain, bin, cin, modein, 
	output bout, cout, sum, modeout
);

	wire wXor;

	xor(wXor, modein, bin);
	
	fulladd FA(wXor, ain, cin, cout, sum); 
	
	assign modeout = modein;
	assign bout = bin;
	
endmodule