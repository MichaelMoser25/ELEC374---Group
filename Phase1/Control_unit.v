`timescale 1ns/10ps
module ControlUnit (
    input wire clk,
    input wire clr,  // Reset signal
    input wire [31:0] IR,  // Instruction Register (could be output from datapath IR)
    input wire CON_FF_result,  // branch condition met? 1 or 0

    // Control signal outputs to Datapath
    output reg mdr_in, mdr_out, pc_increment,

    // Register selection control
    output reg Gra, Grb, Grc, Rin, Rout, BAout, y_in,

    output reg MARin, hi_in, lo_in, z_in, pc_in, ir_in, OutPort_write, c_in, read,
    output reg hi_out, lo_out, zhigh_out, zlow_out, pc_out, ir_out, InPort_read, c_out,

    output reg [4:0] alu_control,  // ALU control code

    output reg memRead, memWrite,

    output reg CON_FF_in
);

	
	
	reg [6:0] state;
	parameter reset_state = 7'b1111111, T0 = 7'd0, T1 = 7'd1, T2 = 7'd2, ld_T3 = 7'd3, ld_T4 = 7'd4, ld_T5 = 7'd5, ld_T6 = 7'd6, ld_T7 = 7'd7,
									ldi_T3 = 7'd8, ldi_T4 = 7'd9, ldi_T5 = 7'd10, st_T3 = 7'd11, st_T4 = 7'd12, st_T5 = 7'd13, st_T6 = 7'd14, 
									div_T3 = 7'd15, div_T4 = 7'd16, div_T5 = 7'd17, div_T6 = 7'd18,
									neg_T3 = 7'd19, neg_T4 = 7'd20,
									not_T3 = 7'd21, not_T4 = 7'd22,
									and_T3 = 7'd23, and_T4 = 7'd24, and_T5 = 7'd25,
									or_T3 = 7'd26, or_T4 = 7'd27, or_T5 = 7'd28,
									br_T3 = 7'd29, br_T4 = 7'd30, br_T5 = 7'd31, br_T6 = 7'd32,
									
									addi_T3 = 7'd36, addi_T4 = 7'd37, addi_T5 = 7'd38,
									andi_T3 = 7'd39, andi_T4 = 7'd40, andi_T5 = 7'd41, ori_T3 = 7'd42, ori_T4 = 7'd43, ori_T5 = 7'd44;
									


	    initial begin
        Gra = 0; Grb = 0; Grc = 0; Rin = 0; Rout = 0; BAout = 0;
        hi_in = 0; lo_in = 0; z_in = 0; pc_in = 0; ir_in = 0; OutPort_write = 0; c_in = 0; read = 0;
        hi_out = 0; lo_out = 0; zhigh_out = 0; zlow_out = 0; pc_out = 0; ir_out = 0; InPort_read = 0; c_out = 0;
        MARin = 0; 
        alu_control <= 5'd0; mdr_in = 0; mdr_out = 0;
		 pc_increment = 0; y_in = 0; memRead = 0; memWrite = 0;
		 CON_FF_in = 0; state = reset_state;
    end
	

	always @(posedge clk) begin
		if (clr) state = reset_state;
		else begin 
			case (state) 
				reset_state: state = T0;
				T0: state = T1;
				T1: state = T2;
				T2: begin
				
						case (IR[31:27])
							5'b00000: state = ld_T3; // load
							5'b00001: state = ldi_T3; // Load immediate
							5'b00010: state = st_T3;  // store
							5'b01111: state = div_T3; // div
							5'b10001: state = neg_T3; // neg
							5'b10010: state = not_T3; // not
							5'b00101: state = and_T3; // and
							5'b00110: state = or_T3; // or
							5'b10011: state = br_T3; // branch
							5'b01100: state = addi_T3;
							5'b01101: state = andi_T3;
							5'b01110: state = ori_T3;


										
								
					
						endcase
					
					
				end
				ld_T3: state = ld_T4;
				ld_T4: state = ld_T5;
				ld_T5: state = ld_T6;
				ld_T6: state = ld_T7;
				ld_T7: state = T0;
				ldi_T3: state = ldi_T4;
				ldi_T4: state = ldi_T5;
				ldi_T5: state = T0;
				st_T3: state = st_T4;
				st_T4: state = st_T5;
				st_T5: state = st_T6;
				st_T6: state = T0;
				
				div_T3: state = div_T4;
				div_T4: state = div_T5;
				div_T5: state = div_T6;
				div_T6: state = T0;
				
				neg_T3: state = neg_T4;
				neg_T4: state = T0;
				
				not_T3: state = not_T4;
				not_T4: state = T0;
				
				and_T3: state = and_T4;
				and_T4: state = and_T5;
				and_T5: state = T0;
				
				or_T3: state = or_T4;
				or_T4: state = or_T5;
				or_T5: state = T0;
				
				addi_T3: state = addi_T4;
				addi_T4: state = addi_T5;
				addi_T5: state = T0;
				
				andi_T3: state = andi_T4;
				andi_T4: state = andi_T5;
				andi_T5: state = T0;
				
				ori_T3: state = ori_T4;
				ori_T4: state = ori_T5;
				ori_T5: state = T0;


			
			endcase
		end
		
	
	
	
	
	
	
	end
	
	always @(state) begin
		 case (state)
			T0: begin
				pc_out <= 1; alu_control <= 5'd19; MARin <= 1; pc_increment <= 1;
				#5 z_in <= 1; 
				#10 pc_out <= 0;
				#5 MARin <= 0; z_in <= 0; alu_control <= 5'd0;
			end
			T1: begin
				memRead <= 1; zlow_out <= 1;  pc_in <=1;
				#5 read <= 1; pc_in <= 1; mdr_in <= 1; 
				#10 zlow_out <= 0; memRead <= 0;
				#5 pc_out <= 0; read <= 0; pc_in <= 0; mdr_in <= 0; pc_increment <= 0;
			end
			T2: begin
				mdr_out <= 1;
				#5 ir_in <= 1; 
				#10 mdr_out <= 0;
				#5 MARin <= 0; ir_in <= 0;
			end
			ld_T3: begin
				Grb <= 1; BAout <= 1; alu_control <= 5'd3;
				#5 y_in <= 1; Rout = 1;
				#10 Grb <= 0;
				#5 y_in <= 0; BAout <= 0; Rout = 0;	
			end
			ld_T4: begin
				c_out <= 1;
				#5 z_in <= 1;
				#15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
			end
			ld_T5: begin
				#5 zlow_out <= 1; MARin <= 1;
				#15 zlow_out <= 0; MARin <= 0;
			end
			ld_T6: begin
				#5 read <= 1; memRead <= 1; mdr_in <= 1;
				#15 read <= 0; memRead <= 0; mdr_in <= 0;
			end
			ld_T7: begin
				Gra <= 1;
				#5 mdr_out <= 1; Rin <= 1;
				#15 mdr_out <= 0; Gra <= 0; Rin <= 0;
			end
			ldi_T3: begin
				Grb <= 1; BAout <= 1; alu_control <= 5'd3;
				#5 y_in <= 1; Rout = 1;
				#10 Grb <= 0;
				#5 y_in <= 0; BAout <= 0; Rout = 0;
			end
			ldi_T4: begin
				c_out <= 1;
				#5 z_in <= 1;
				#15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
			end
			ldi_T5: begin
				#5 zlow_out <= 1; Rin <= 1; Gra <= 1;
				#15 zlow_out <= 0; Rin <= 0; Gra <= 0;
			end
			st_T3: begin
				Grb <= 1; BAout <= 1; alu_control <= 5'd3;
				#5 y_in <= 1; Rout = 1;
				#10 Grb <= 0;
				#5 y_in <= 0; BAout <= 0; Rout = 0;
			end
			st_T4: begin
				c_out <=1;
				#5 z_in <= 1;
				#15 c_out <=0; z_in <= 0; alu_control <= 5'd0;
			end
			st_T5: begin
				#5 zlow_out <= 1; MARin <= 1;
				#15 zlow_out <= 0; MARin <= 0;
			end
			st_T6: begin
				#5 Rout <=1; Gra <= 1; mdr_in <= 1;memWrite <= 1;
				#15  Rout <=0; Gra <= 0; memWrite <= 0; mdr_in <= 0;
			end
			div_T3: begin 
				Gra <= 1; Rout <= 1; y_in <= 1;
				#15 Gra <= 0; Rout <= 0; y_in <= 0;
            end
			div_T4: begin 
				Grb <= 1; Rout <= 1; z_in <= 1; alu_control <= 5'b01111;
				#15 Grb <= 0; Rout <= 0; z_in <= 0; alu_control <= 5'b00000;
         end
			div_T5: begin 
				zlow_out <= 1; lo_in <= 1;	
				#15 zlow_out <= 0; lo_in <= 0;
         end
			div_T6: begin 
				zhigh_out <= 1; hi_in <= 1;
				#15 zhigh_out <= 0; hi_in <= 0;
         end
			neg_T3: begin
				Gra <= 1; Rout <= 1; z_in <= 1; alu_control <= 5'b10001;
				#15 Gra <= 0; Rout <= 0; z_in <= 0; alu_control <= 5'b00000;
			end
			neg_T4: begin
				Grb <= 1; Rin <= 1; zlow_out <= 1;
				#15 Grb <= 0; Rin <= 0; zlow_out <= 0;
			end
			and_T3: begin
				Grb <= 1; Rout <= 1; y_in <= 1;
				#15 Grb <= 0; Rout <= 0; y_in <= 0;
			end
			and_T4: begin
				Grc <= 1; Rout <= 1; z_in <= 1; alu_control <= 5'b00101;
				#15 Grc <= 0; Rout <= 0; z_in <= 0; alu_control <= 5'b00000;
			end
			and_T5: begin
				Gra <= 1; Rin <= 1; zlow_out <= 1;
				#15 Gra <= 0; Rin <= 0; zlow_out <= 0;
			end
			or_T3: begin
				Grb <= 1; Rout <= 1; y_in <= 1;
				#15 Grb <= 0; Rout <= 0; y_in <= 0;
			end
			or_T4: begin
				Grc <= 1; Rout <= 1; z_in <= 1; alu_control <= 5'b00110;
				#15 Grc <= 0; Rout <= 0; z_in <= 0; alu_control <= 5'b00000;
			end
			or_T5: begin
				Gra <= 1; Rin <= 1; zlow_out <= 1;
				#15 Gra <= 0; Rin <= 0; zlow_out <= 0;
			end
			br_T3: begin
				Gra <= 1; Rout <= 1; CON_FF_in <= 1;
				#10 Gra <= 0; Rout <= 0; CON_FF_in <= 0;
		   end
		   br_T4: begin
				pc_out <= 1; y_in <= 1;
				#10 pc_out <= 0; y_in <= 0;
		   end
		   br_T5: begin
				c_out <= 1; alu_control <= 5'b00011;
				z_in <= 1;
				#15 c_out <= 0; z_in <= 0;
			end
		   br_T6: begin
				zlow_out <= 1; pc_in <= (CON_FF_result == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
				#15 zlow_out <= 0; pc_in <= 0;
		   end
			
			addi_T3: begin
				Grb <= 1; alu_control <= 5'd3;
				#5 y_in <= 1; Rout = 1;
				#10 Grb <= 0;
				#5 y_in <= 0;  Rout = 0;
		  end
		  addi_T4: begin
				c_out <= 1;
				#5 z_in <= 1;
				#15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
		  end
		  addi_T5: begin
				#5 zlow_out <= 1; Gra <= 1; Rin <=1;
				#15 zlow_out <= 0; Gra <= 0; Rin <=0;
		  end
		  
		  andi_T3: begin
				Grb <= 1; alu_control <= 5'd5;
				#5 y_in <= 1; Rout = 1;
				#10 Grb <= 0;
				#5 y_in <= 0;  Rout = 0;
		  end
		  andi_T4: begin
				c_out <= 1;
				#5 z_in <= 1;
				#15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
		  end
		  andi_T5: begin
				#5 zlow_out <= 1; Gra <= 1; Rin <=1;
				#15 zlow_out <= 0; Gra <= 0; Rin <=0;
		  end
		  ori_T3: begin
				Grb <= 1; alu_control <= 5'd6; 
				#5 y_in <= 1; Rout = 1;
				#10 Grb <= 0;
				#5 y_in <= 0;  Rout = 0;
		  end
		  ori_T4: begin
				c_out <= 1;
				#5 z_in <= 1;
				#15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
		  end
		  ori_T5: begin
				#5 zlow_out <= 1; Gra <= 1; Rin <=1;
				#15 zlow_out <= 0; Gra <= 0; Rin <=0;
			end

	endcase

	
	end
	

endmodule                                   
