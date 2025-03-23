module Datapath #(parameter MEM_FILE = "memory.hex")(
		input clr, clk, MDRin, MDRout, pc_increment,
		// Control signals for select_encode_logic
		input wire Gra, Grb, Grc, Rin, Rout, BAout, RYin,

        input wire MARin, HIin, LOin, Zhighin, Zlowin, PCin, IRin, InPortin, Cin, read,

		input wire HIout, LOout, Zhighout, Zlowout, PCout, IRout, InPortout, Cout,
		input [4:0] alu_control,

        output wire [31:0] dataHI, dataLO,
	    input memoryRead, memoryWrite
		 
);

wire [31:0] memoryData;

// Bus connections
wire [31:0] bus, MDmuxOut;

// Register outputs
wire [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, 
    reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, regY, 
    regHI, regLO, regIR, regMDR, regInPort, regZlow, regZhigh;
// For BAout mux
wire [31:0] reg0Out;

// ALU result
wire [63:0] alu_result;
assign dataHI = alu_result[63:32]; 
assign dataLO = alu_result[31:0];

// MAR and PC data
wire [31:0] MAR_data;
wire [31:0] PC_data;

// C sign extended output
wire [31:0] C_sign_extended;

// Decoder outputs
wire [15:0] R_in;  // R0in to R15in
wire [15:0] R_out; // R0out to R15out

//CON FF result
wire CON_FF_result;


// Instantiate select_encode_logic module
select_encode_logic sel_enc (
	 .clk(clk),
    .IR(regIR),
    .Gra(Gra),
    .Grb(Grb),
    .Grc(Grc),
    .Rin_enable(Rin),
    .Rout_enable(Rout),
    .R_in(R_in),
    .R_out(R_out)
);

sign_extension sign_ext (
    .IR(regIR),
    .C_sign_extended(C_sign_extended)
);

Bus bus_unit (
    .BusMuxInR0(reg0Out), .BusMuxInR1(reg1), .BusMuxInR2(reg2), .BusMuxInR3(reg3),
    .BusMuxInR4(reg4), .BusMuxInR5(reg5), .BusMuxInR6(reg6), .BusMuxInR7(reg7),
    .BusMuxInR8(reg8), .BusMuxInR9(reg9), .BusMuxInR10(reg10), .BusMuxInR11(reg11),
    .BusMuxInR12(reg12), .BusMuxInR13(reg13), .BusMuxInR14(reg14), .BusMuxInR15(reg15),
    .BusMuxIn_LO(regLO), .BusMuxIn_HI(regHI), .BusMuxIn_Zhigh(regZhigh), .BusMuxIn_Zlow(regZlow),
    .BusMuxIn_PC(PC_data), .BusMuxIn_IR(regIR), .BusMuxIn_MDR(regMDR), .BusMuxIn_InPort(regInPort), 
    .C_sign_extended(C_sign_extended),  // Connect to sign extended value

    // Connect to individual register output signals from select_encode_logic
    .R0out(R_out[0]), .R1out(R_out[1]), .R2out(R_out[2]), .R3out(R_out[3]),
    .R4out(R_out[4]), .R5out(R_out[5]), .R6out(R_out[6]), .R7out(R_out[7]),
    .R8out(R_out[8]), .R9out(R_out[9]), .R10out(R_out[10]), .R11out(R_out[11]),
    .R12out(R_out[12]), .R13out(R_out[13]), .R14out(R_out[14]), .R15out(R_out[15]),
    .HIout(HIout), .LOout(LOout), .Zhighout(Zhighout), .Zlowout(Zlowout),
    .PCout(PCout), .IRout(IRout), .MDRout(MDRout), .InPortout(InPortout), .Cout(Cout),

    .BusMuxOut(bus) 
);

register r0 (clr, clk, R_in[0], bus, reg0);
mux rZeroMux (
    .a(32'b0),
    .b(reg0),
    .enable(~BAout),
    .out(reg0Out)
);
					
register r1 (clr, clk, R_in[1], bus, reg1);
register r2 (clr, clk, R_in[2], bus, reg2);
register r3 (clr, clk, R_in[3], bus, reg3);
register r4 (clr, clk, R_in[4], bus, reg4);
register r5 (clr, clk, R_in[5], bus, reg5);
register r6 (clr, clk, R_in[6], bus, reg6);
register r7 (clr, clk, R_in[7], bus, reg7);
register r8 (clr, clk, R_in[8], bus, reg8);
register r9 (clr, clk, R_in[9], bus, reg9);
register r10 (clr, clk, R_in[10], bus, reg10);
register r11 (clr, clk, R_in[11], bus, reg11);
register r12 (clr, clk, R_in[12], bus, reg12);
register r13 (clr, clk, R_in[13], bus, reg13);
register r14 (clr, clk, R_in[14], bus, reg14);
register r15 (clr, clk, R_in[15], bus, reg15);

register rHI (clr, clk, HIin, bus, regHI);
register rLO (clr, clk, LOin, bus, regLO);

pc_register PC_reg (
    .clk(clk), 
    .increment(pc_increment), 
    .enable(PCin), 
    .pc_in(bus), 
    .pc_out(PC_data)
);

register rIR (clr, clk, IRin, bus, regIR);
register rInPort (clr, clk, InPortin, bus, regInPort);
register rY (clr, clk, RYin, bus, regY);

mux MDmux (
    .a(bus),
    .b(memoryData),
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

register MAR (clr, clk, MARin, bus, MAR_data);

ALU alu_unit (
    .A(regY),
    .B(bus),
    .op(alu_control),  
    .result(alu_result),
    .clk(clk)
);

register rZhigh (clr, clk, Zhighin, alu_result[63:32], regZhigh);
register rZlow (clr, clk, Zlowin, alu_result[31:0], regZlow);

Ram #(.MEM_FILE(MEM_FILE)) memory (
    .clk(clk),
    .read(memoryRead),
    .write(memoryWrite),
    .address(MAR_data[8:0]),  
    .data_in(regMDR),
    .data_out(memoryData)
);

con_ff CON_FF(
	.clk(clk),
	.reset(1'b0),
	.CONin(1'b1),
	.C2(regIR[22:19]),
	.value(bus),
	.result(CON_FF_result)
);

endmodule