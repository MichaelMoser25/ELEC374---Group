module ControlUnit (
    input wire clk,
    input wire clr,  // Reset signal
    input wire [31:0] IR,  // Instruction Register (could be output from datapath IR)
    input wire CON_FF_result,  // Condition code from datapath

    // Control signal outputs to Datapath
    output wire MDRin, MDRout, pc_increment,

    // Register selection control
    output wire Gra, Grb, Grc, Rin, Rout, BAout, RYin,

    output wire MARin, HIin, LOin, Zhighin, Zlowin, PCin, IRin, OutPort_write, Cin, read,
    output wire HIout, LOout, Zhighout, Zlowout, PCout, IRout, InPort_read, Cout,

    output wire [4:0] alu_control,  // ALU control code

    output wire memoryRead, memoryWrite,

    output wire CON_FF_in
);
	

endmodule                                   
