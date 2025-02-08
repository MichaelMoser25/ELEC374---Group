module Bus (
	// Mux
	input wire [31:0]BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
	BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12,BusMuxInR13, BusMuxInR14, BusMuxInR15, 
	BusMuxIn_LO, BusMuxIn_HI, BusMuxIn_Zhigh, BusMuxIn_Zlow, BusMuxIn_PC, BusMuxIn_IR, BusMuxIn_MDR, BusMuxIn_InPort, C_sign_extended,
	//Encoder
	input wire R0out, R1out, R2out, R3out,  R4out, R5out, R6out, R7out, 
	R8out, R9out, R10out, R11out,  R12out, R13out, R14out, R15out, 
	HIout, LOout, Zhighout, Zlowout, PCout, IRout, MDRout, InPortout, Cout,
	
	output wire [31:0]BusMuxOut
	
);

reg [31:0]q;

always @ (*) begin
    q = 32'h0;  
    case (1'b1) 
        R0out: q = BusMuxInR0;
        R1out: q = BusMuxInR1;
        R2out: q = BusMuxInR2;
        R3out: q = BusMuxInR3;
        R4out: q = BusMuxInR4;
        R5out: q = BusMuxInR5;
        R6out: q = BusMuxInR6;
        R7out: q = BusMuxInR7;
        R8out: q = BusMuxInR8;
        R9out: q = BusMuxInR9;
        R10out: q = BusMuxInR10;
        R11out: q = BusMuxInR11;
        R12out: q = BusMuxInR12;
        R13out: q = BusMuxInR13;
        R14out: q = BusMuxInR14;
        R15out: q = BusMuxInR15;
        HIout: q = BusMuxIn_HI;
        LOout: q = BusMuxIn_LO;
        Zhighout: q = BusMuxIn_Zhigh;
        Zlowout: q = BusMuxIn_Zlow;
        PCout: q = BusMuxIn_PC;
        IRout: q = BusMuxIn_IR;
        MDRout: q = BusMuxIn_MDR;
        InPortout: q = BusMuxIn_InPort;
        Cout: q = C_sign_extended;
    endcase
end


assign BusMuxOut = q;
endmodule
	
	
	