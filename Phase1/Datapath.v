module Datapath (
		input clr, clk, MDRin, MDRout, pc_increment,
		input [4:0] op_code,
		input [31:0] data_in,

		input wire R0in, R1in, R2in, R3in,  R4in, R5in, R6in, R7in, 
        R8in, R9in, R10in, R11in,  R12in, R13in, R14in, R15in, RYin, MARin, 
        HIin, LOin, Zhighin, Zlowin, PCin, IRin, InPortin, Cin, read,

		input wire R0out, R1out, R2out, R3out,  R4out, R5out, R6out, R7out, 
			 R8out, R9out, R10out, R11out,  R12out, R13out, R14out, R15out, 
			 HIout, LOout, Zhighout, Zlowout, PCout, IRout, InPortout, Cout,

    output wire [31:0] dataHI, dataLO
);

wire [31:0] bus, MDmuxOut;

wire [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, 
    reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, regY, 
    regHI, regLO,  regPC, regIR, regMDR, regInPort, regC, regZlow, regZhigh;
	 



wire [63:0] alu_result;
assign dataHI = alu_result[63:32]; 
assign dataLO = alu_result[31:0];


wire [31:0] MAR_data;

wire [31:0] PC_data;

Bus bus_unit (
    .BusMuxInR0(reg0), .BusMuxInR1(reg1), .BusMuxInR2(reg2), .BusMuxInR3(reg3),
    .BusMuxInR4(reg4), .BusMuxInR5(reg5), .BusMuxInR6(reg6), .BusMuxInR7(reg7),
    .BusMuxInR8(reg8), .BusMuxInR9(reg9), .BusMuxInR10(reg10), .BusMuxInR11(reg11),
    .BusMuxInR12(reg12), .BusMuxInR13(reg13), .BusMuxInR14(reg14), .BusMuxInR15(reg15),
    .BusMuxIn_LO(regLO), .BusMuxIn_HI(regHI), .BusMuxIn_Zhigh(regZhigh), .BusMuxIn_Zlow(regZlow),
    .BusMuxIn_PC(PC_data), .BusMuxIn_IR(regIR), .BusMuxIn_MDR(regMDR), .BusMuxIn_InPort(regInPort), 
    .C_sign_extended(regC),

    .R0out(R0out), .R1out(R1out), .R2out(R2out), .R3out(R3out),
    .R4out(R4out), .R5out(R5out), .R6out(R6out), .R7out(R7out),
    .R8out(R8out), .R9out(R9out), .R10out(R10out), .R11out(R11out),
    .R12out(R12out), .R13out(R13out), .R14out(R14out), .R15out(R15out),
    .HIout(HIout), .LOout(LOout), .Zhighout(Zhighout), .Zlowout(Zlowout),
    .PCout(PCout), .IRout(IRout), .MDRout(MDRout), .InPortout(InPortout), .Cout(Cout),

    .BusMuxOut(bus) 
);

register r0 (clr, clk, R0in, bus, reg0);
register r1 (clr, clk, R1in, bus, reg1);
register r2 (clr, clk, R2in, bus, reg2);
register r3 (clr, clk, R3in, bus, reg3);
register r4 (clr, clk, R4in, bus, reg4);
register r5 (clr, clk, R5in, bus, reg5);
register r6 (clr, clk, R6in, bus, reg6);
register r7 (clr, clk, R7in, bus, reg7);
register r8 (clr, clk, R8in, bus, reg8);
register r9 (clr, clk, R9in, bus, reg9);
register r10 (clr, clk, R10in, bus, reg10);
register r11 (clr, clk, R11in, bus, reg11);
register r12 (clr, clk, R12in, bus, reg12);
register r13 (clr, clk, R13in, bus, reg13);
register r14 (clr, clk, R14in, bus, reg14);
register r15 (clr, clk, R15in, bus, reg15);

pc_register PC_reg (
    .clk(clk), 
    .increment(pc_increment), 
    .enable(PCin), 
    .pc_in(bus), 
    .pc_out(PC_data)
);

register rIR (clr, clk, IRin, bus, regIR);
register rInPort (clr, clk, InPortin, bus, regInPort);
register rC (clr, clk, Cin, bus, regC);

register rY (clr, clk, RYin, bus, regY);

mux MDmux  (
				.a(bus),
				.b(data_in),
				.enable(read), 
				.out(MDmuxOut)
);
				
register MDR (
				.clr(clr),
				.clk(clk),
				.write(MDRin),
				.d(MDmuxOut),
				.q(regMDR)
);

//MemoryDataRegister MDR (
//				.BusMuxOut(bus),
//				.Mdatain(data_in),
//				.read(read),
//				.clr(clr),
//				.clk(clk),
//				.write(MDRin),
//				.MDRout(regMDR)
//
//);



register MAR (clr, clk, MARIn, bus, MAR_data);


ALU alu_unit (
    .A(regY),
    .B(bus),
    .op(op_code),  
    .result(alu_result),
	 .clk(clk)
);

register rZhigh (clr, clk, Zhighin, alu_result[63:32], regZhigh);
register rZlow (clr, clk, Zlowin, alu_result[31:0], regZlow);




endmodule
