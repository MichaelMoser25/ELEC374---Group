module ControlUnit (
    input wire clk,
    input wire clr,  // Reset signal
    input wire [31:0] IR,  // Instruction Register (could be output from datapath IR)
    input wire CON_FF_result,  // Condition code from datapath

    // Control signal outputs to Datapath
    output wire mdr_in, mdr_out, pc_increment,

    // Register selection control
    output wire Gra, Grb, Grc, Rin, Rout, BAout, y_in,

    output wire MARin, hi_in, lo_in, Zhighin, Zlowin, pc_in, ir_in, OutPort_write, c_in, read,
    output wire hi_out, lo_out, zhigh_out, zlow_out, pc_out, ir_out, InPort_read, c_out,

    output wire [4:0] alu_control,  // ALU control code

    output wire memRead, memWrite,

    output wire CON_FF_in
);
	wire z_in;
	assign Zhighin = z_in;
	assign Zlowin = z_in;

endmodule                                   
