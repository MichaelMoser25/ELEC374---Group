module Bus (
	// Mux
	input [31:0]BusMuxInR0, input [31:0]BusMuxInR1, input [31:0]BusMuxInR2, input [31:0]BusMuxInR3,
	input [31:0]BusMuxInR4, input [31:0]BusMuxInR5, input [31:0]BusMuxInR6, input [31:0]BusMuxInR7,
	input [31:0]BusMuxInR8, input [31:0]BusMuxInR9, input [31:0]BusMuxInR10, input [31:0]BusMuxInR11,
	input [31:0]BusMuxInR12,input [31:0]BusMuxInR13, input [31:0]BusMuxInR14, input [31:0]BusMuxInR15, 
	input [31:0]BusMuxIn_LO, input [31:0]BusMuxIn_HI, input [31:0]BusMuxIn_Zhigh, input [31:0]BusMuxIn_Zlow,
	input [31:0]BusMuxIn_PC, input [31:0]BusMuxIn_MDR, input [31:0]BusMuxIn_InPort, input [31:0]C_sign_extended,
	//Get rid of __?
	//Encoder
	input R0out, input R1out, input R2out, input R3out, 
	input R4out, input R5out, input R6out, input R7out, 
	input R8out, input R9out, input R10out, input R11out, 
	input R12out, input R13out, input R14out, input R15out, 
	input HIout, input LOout, input Zhighout, input Zlowout,
	input PCout, input MDRout, input InPortout, input Cout,
	
	output wire [31:0]BuxMuxOut
	
);

reg [31:0]q;

always @ (*) begin
	if(R0out) q = BusMuxInR0;
	if(R1out) q = BusMuxInR1;
	if(R2out) q = BusMuxInR2;
	if(R3out) q = BusMuxInR3;
	if(R4out) q = BusMuxInR4;
	if(R5out) q = BusMuxInR5;
	if(R6out) q = BusMuxInR6;
	if(R7out) q = BusMuxInR7;
	if(R8out) q = BusMuxInR8;
	if(R9out) q = BusMuxInR9;
	if(R10out) q = BusMuxInR10;
	if(R11out) q = BusMuxInR11;
	if(R12out) q = BusMuxInR12;
	if(R13out) q = BusMuxInR13;
	if(R14out) q = BusMuxInR14;
	if(R15out) q = BusMuxInR15;
	if(HIout) q = BusMuxIn_HI;
	if(LOout) q = BusMuxIn_LO;
	if(Zhighout) q = BusMuxIn_Zhigh;
	if(Zlowout) q = BusMuxIn_Zlow;
	if(PCout) q = BusMuxIn_PC;
	if(MDRout) q = BusMuxIn_MDR;
	if(InPortout) q = BusMuxIn_InPort;
	if(Cout) q = C_sign_extended;
end

assign BusMuxOut = q;
endmodule
	
	
	