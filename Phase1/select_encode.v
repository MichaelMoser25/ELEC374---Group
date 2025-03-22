
module select_encode_logic(
	 input clk,
    input [31:0] IR,              
    input Gra, Grb, Grc, 
    input Rin_enable, Rout_enable,
    output reg [15:0] R_in,
    output reg [15:0] R_out
);


reg [3:0] currentReg;

always @(*) begin

	R_in = 16'd0;
	R_out = 16'd0;
	currentReg = 4'b000;

		
		case(IR[31:27]) 
		
		5'b00000, 5'b00001, 5'b00010, 5'b01100, 5'b01101,
		5'b01110, 5'b01111, 5'b10000, 5'b10001, 5'b10010: begin // I format
			if (Gra) currentReg = IR[26:23];
			if (Grb) currentReg = IR[22:19];
			if (Rin_enable) R_in = (1 << currentReg);
			if (Rout_enable) R_out = (1 << currentReg);
			end
			
				5'b00001, 5'b00010, 5'b00011, 5'b00100,5'b00101,
				5'b00110, 5'b00111, 5'b01000: begin // R format
			if (Gra) currentReg = IR[26:23];
			if (Grb) currentReg = IR[22:19];
			if (Grc) currentReg = IR[18:15];
			if (Rin_enable) R_in = (1 << currentReg);
			if (Rout_enable) R_out = (1 << currentReg);
			end
			
			
			
			5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111, 5'b11000, 5'b11001: begin // J format, B format
			if (Gra) currentReg = IR[26:23];
			if (Grb) currentReg = IR[22:19];
			if (Rin_enable) R_in = (1 << currentReg);
			if (Rout_enable) R_out = (1 << currentReg);
			end
			
	endcase
end

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
