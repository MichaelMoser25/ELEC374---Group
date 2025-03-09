module select_encode_logic(
    input [31:0] IR,              // Instruction Register
    input Gra, Grb, Grc,          // Register selection signals
    input Rin, Rout, BAout,       // Control signals
    output [15:0] R_in,           // R0in - R15in signals
    output [15:0] R_out           // R0out - R15out signals
);

    // Extract register fields from IR
    wire [3:0] Ra = IR[26:23];     // Ra field
    wire [3:0] Rb = IR[22:19];     // Rb field
    wire [3:0] Rc = IR[18:15];     // Rc field

    // Intermediate signals for selected register
    wire [3:0] selected_reg;
    wire [15:0] decoded_reg;

    // Select register field based on Gra, Grb, Grc
    assign selected_reg = (Gra) ? Ra :
                          (Grb) ? Rb :
                          (Grc) ? Rc : 4'b0000;

    // 4-to-16 decoder for register selection
    assign decoded_reg = (selected_reg == 4'b0000) ? 16'b0000000000000001 :
                        (selected_reg == 4'b0001) ? 16'b0000000000000010 :
                        (selected_reg == 4'b0010) ? 16'b0000000000000100 :
                        (selected_reg == 4'b0011) ? 16'b0000000000001000 :
                        (selected_reg == 4'b0100) ? 16'b0000000000010000 :
                        (selected_reg == 4'b0101) ? 16'b0000000000100000 :
                        (selected_reg == 4'b0110) ? 16'b0000000001000000 :
                        (selected_reg == 4'b0111) ? 16'b0000000010000000 :
                        (selected_reg == 4'b1000) ? 16'b0000000100000000 :
                        (selected_reg == 4'b1001) ? 16'b0000001000000000 :
                        (selected_reg == 4'b1010) ? 16'b0000010000000000 :
                        (selected_reg == 4'b1011) ? 16'b0000100000000000 :
                        (selected_reg == 4'b1100) ? 16'b0001000000000000 :
                        (selected_reg == 4'b1101) ? 16'b0010000000000000 :
                        (selected_reg == 4'b1110) ? 16'b0100000000000000 :
                        (selected_reg == 4'b1111) ? 16'b1000000000000000 : 16'b0000000000000000;

    // Generate R_in signals
    assign R_in = (Rin) ? decoded_reg : 16'b0;

    // Generate R_out signals
    // Handle BAout special case: when BAout is 1 and R0 is selected, R0out should be 0
    // For registers R1-R15, output the selected register normally
    wire [15:0] rout_temp = (Rout) ? decoded_reg : 16'b0;
    
    // When BAout is asserted
    // - If register 0 is selected, R0out should be 0 (to output zeros to the bus)
    // - If any other register is selected, its value should go to the bus
    assign R_out = (BAout) ? ((decoded_reg == 16'b0000000000000001) ? 16'b0 : decoded_reg) : rout_temp;

endmodule

// Sign extension module for the constant C
module sign_extension(
    input [31:0] IR,              // Instruction Register
    output [31:0] C_sign_extended // Sign-extended constant
);
    // sign-extend bit 18 to bits 31:19
    // For bits 17:0, use the original bits from IR
    assign C_sign_extended[31:19] = {13{IR[18]}};
    assign C_sign_extended[18:0] = IR[18:0];

endmodule
