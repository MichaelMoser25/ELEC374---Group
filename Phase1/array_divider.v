module array_divider (
	input [6:0] a,
	input [3:0] b,
	input	mode,
	output [3:0] q,
	output [3:0] r
);

	wire mode1, mode2, mode3, mode4;
	wire mode5, mode6, mode7, mode8;
	wire mode9, mode10, mode11, mode12;
	wire mode13, mode14, mode15, mode16;
	
	wire bout1, bout2, bout3, bout4;
	wire bout5, bout6, bout7, bout8;
	wire bout9, bout10, bout11, bout12;
	wire bout13, bout14, bout15, bout16;
	
	wire cout1, cout2, cout3, cout4;
	wire cout5, cout6, cout7, cout8;
	wire cout9, cout10, cout11, cout12;
	wire cout13, cout14, cout15, cout16;
	
	wire sum1, sum2, sum3, sum4;
	wire sum5, sum6, sum7, sum8;
	wire sum9, sum10, sum11, sum12;
	wire sum13,sum14, sum15, sum16;
	
	// array
	
	//divider cell (a, bin, cin, modein, bout, cout, sum, modeout)
	
	divider_cell inst1(a[6], b[3], cout2, mode, bout1, cout1, sum1, mode1);
	divider_cell inst2(a[5], b[2], cout3, mode1, bout2, cout2, sum2, mode2);
	divider_cell inst3(a[4], b[1], cout4, mode2, bout3, cout3, sum3, mode3);
	divider_cell inst4(a[3], b[0], mode4, mode3, bout4, cout4, sum4, mode4);
	
	divider_cell inst5(sum2, bout1, cout6, cout1, bout5, cout5, sum5, mode5);
	divider_cell inst6(sum3, bout2, cout7, mode5, bout6, cout6, sum6, mode6);
	divider_cell inst7(sum4, bout3, cout8, mode6, bout7, cout7, sum7, mode7);
	divider_cell inst8(a[2], bout4, mode8, mode7, bout8, cout8, sum8, mode8);
	
	divider_cell inst9(sum6, bout5, cout10, cout5, bout9, cout9, sum9, mode9);
	divider_cell inst10(sum7, bout6, cout11, mode9, bout10, cout10, sum10, mode10);
	divider_cell inst11(sum8, bout7, cout12, mode10, bout11, cout11, sum11, mode11);
	divider_cell inst12(a[1], bout8, mode12, mode11, bout12, cout12, sum12, mode12);
	
	divider_cell inst13(sum10, bout9, cout14, cout9, bout13, cout13, sum13, mode13);
	divider_cell inst14(sum11, bout10, cout15, mode13, bout14, cout14, sum14, mode14);
	divider_cell inst15(sum12, bout11, cout16, mode14, bout15, cout15, sum15, mode15);
	divider_cell inst16(a[0], bout12, mode16, mode15, bout16, cout16, sum16, mode16);
	
	assign q = {cout1, cout5, cout9, cout13};
	
	// adder stage
	
	wire sum17_0, sum17_1, sum17_2, sum17_3;
	wire [3:0] rca_a, rca_b, rca_sum;
	wire rca_cout;
	
	assign rca_a = {sum13, sum14, sum15, sum16};
	assign rca_b = {bout13, bout14, bout15, bout16};
	
	RCA_4bit rca(rca_a, rca_b, 1'b0, rca_sum, rca_cout);
	
	assign sum17_0 = rca_sum[0];
	assign sum17_1 = rca_sum[1];
	assign sum17_2 = rca_sum[2];
	assign sum17_3 = rca_sum[3];
	
	// mux stage
	
	mux_2_1_1bit mux0(sum16, sum17_0, cout13, r[0]);
	mux_2_1_1bit mux1(sum15, sum17_1, cout13, r[1]);
	mux_2_1_1bit mux2(sum14, sum17_2, cout13, r[2]);
	mux_2_1_1bit mux3(sum13, sum17_3, cout13, r[3]);
	
	
endmodule