`timescale 1ns/10ps
module Datapath_mem_tb;
    reg clk, clr;
    
    reg mdr_in, mdr_out, y_in,MARin, pc_increment;
    
    reg [31:0] instruction;
	 
	 reg Gra, Grb, Grc, BAout, Rin, Rout;

    
    reg hi_in, lo_in, z_in, pc_in, ir_in, inport_in, c_in, read;
	 
	reg [4:0] alu_control;
    
    reg hi_out, lo_out, zhigh_out, zlow_out, pc_out, ir_out, inport_out, c_out;

    // Outputs
    wire [31:0] data_hi, data_lo;
	 reg [15:0] rin_debug,rout_debug;

	 reg memRead, memWrite;

    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load1c = 4'b0011,
              Reg_load1d = 4'b0100, Reg_load1e = 4'b0101, Reg_load1f = 4'b0110, T0 = 4'b0111,
              T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101,
              T7 = 4'b1110;
    reg [3:0] present_state = Default;

    // Instantiate the Datapath module
    Datapath DUT (
        .clr(clr),
        .clk(clk),
        .MDRin(mdr_in),
        .MDRout(mdr_out),
        .pc_increment(pc_increment),
        .instruction(instruction),
		  .Gra(Gra),
		  .Grb(Grb),
		  .Grc(Grc),
		  .BAout(BAout),
		  
//        .data_in(data_in),

        // Register input enables
        .RYin(y_in), .MARin(MARin),
        .HIin(hi_in), .LOin(lo_in),
        .Zhighin(z_in), .Zlowin(z_in),
        .PCin(pc_in), .IRin(ir_in), .InPortin(inport_in), .Cin(c_in), .read(read),

        // Register output enables
        
        .HIout(hi_out), .LOout(lo_out),
        .Zhighout(zhigh_out), .Zlowout(zlow_out),
        .PCout(pc_out), .IRout(ir_out), .InPortout(inport_out), .Cout(c_out),
		  .alu_control(alu_control),

        // Output connections
        .dataHI(data_hi),
        .dataLO(data_lo),
		  .memoryRead(memRead),
		  .memoryWrite(memWrite),
		  .rin_debug(rin_debug),
		  .rout_debug(rout_debug)

    );


    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; //10 originally
    end
 
    initial begin
        clr = 1;


     
    Gra = 0; Grb = 0; Grc = 0; Rin = 0; Rout = 0; BAout = 0;
    
    hi_in = 0; lo_in = 0; z_in = 0; pc_in = 0; ir_in = 0; inport_in = 0; c_in = 0; read = 0;
    
    hi_out = 0; lo_out = 0; zhigh_out = 0; zlow_out = 0; pc_out = 0; ir_out = 0; inport_out = 0; c_out = 0;
    
    MARin = 0; 

        instruction = 32'd0; alu_control <= 5'd0;
		          #5 clr = 0; 
    end

	 
	 
    always @(posedge clk) begin 
		case (present_state)
		Default : present_state = Reg_load1a;
		Reg_load1a : present_state = Reg_load1b;
		Reg_load1b : present_state = Reg_load1c;
		Reg_load1c : present_state = Reg_load1d;
		Reg_load1d : present_state = Reg_load1e;
		Reg_load1e : present_state = Reg_load1f;
		Reg_load1f : present_state = T0;
		T0 : present_state = T1;
		T1 : present_state = T2;
		T2 : present_state = T3;
		T3 : present_state = T4;
		T4 : present_state = T5;
		T5 : present_state = T6;
		T6 : present_state = T7;
	
        endcase
    end  

    always @(present_state) begin 
        case (present_state)
//            DEFAULT: begin 
//                pc_out <= 0; zlow_out <= 0; mdr_out <= 0;
////                r3_out <= 0; r7_out <= 0; r3_in <= 0; r4_in <= 0; r7_in <= 0;
//					 pc_in <= 0; mdr_in <= 0; ir_in <= 0; y_in <= 0;
//                pc_increment <= 0; mdr_in <= 0;
//                 memRead <= 0; memWrite <=0;
//            end
//				
//				            REG_LOAD1A: begin 
//					 instruction = 32'b00000100000000000000000000000000;
//                read <= 0; mdr_in <= 0;                    
//                memRead <= 1; 
////					 r2_in <= 1;               
//                #15 memRead <= 0; 
////					 r2_in <= 0;  
//		            end 
//
//            
//            REG_LOAD1B: begin                     
//                read <= 1; mdr_in <= 1;               
//                #15 read <= 0; mdr_in <= 0;  
//		            end 
//
//            REG_LOAD1C: begin   
//                mdr_out <= 1;
////					 r3_in <= 1;   
//                #15 mdr_out <= 0;
////					 r3_in <= 0;          
//            end 
		Default: begin
			pc_out <= 0; zlow_out <= 0; mdr_out <= 0; hi_out <= 0; 
			lo_out <= 0; zhigh_out <= 0; c_out <= 0;
//			In_Port_out <= 0;
			lo_in <= 0; hi_in <= 0; MARin <= 0;
			rin_debug <= 0; rout_debug <= 0;
			pc_increment <= 0;

			 MARin <= 0; z_in <= 0; pc_in <= 0; mdr_in <= 0; 
			 ir_in <= 0; y_in <= 0;
			 read <= 0; instruction[31:27] <= 5'd0;
			 clr <= 0; memRead <= 0; memWrite <= 0; 
//			 PC_tb_enable <= 0;

             Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0;
//			 in_enable <= 16'b0; out_enable <= 16'b0; Mdatain <= 32'h00000000;
//             PC <= 32'h0;
		end
        Reg_load1a: begin
//             PC <= 32'b0;
		pc_increment <= 1; pc_out <= 1; alu_control <= 5'd19;
			 #5 z_in <= 1; MARin <= 1;
			 #10 pc_out	 <= 0; 
			 #5 z_in <= 0; alu_control <= 5'd0; MARin <= 0; pc_increment = 0;
		end
		Reg_load1b: begin
			 read <= 1; zlow_out <= 1;
			 #5 memRead <= 1; pc_in <= 1; mdr_in <= 1;
			 
			 #10 zlow_out <= 0; memRead <= 0;
			 pc_out <= 0; read <= 0; pc_in <= 0; mdr_in <= 0;
		end
        Reg_load1c: begin
			 mdr_out <= 1;
			 #5  ir_in <= 1; 
			 #10 mdr_out <= 0;
			   ir_in <= 0;
        end
        Reg_load1d: begin
            Grb <= 1; BAout <= 1;
            #5 y_in <= 1;
			#10 Grb <= 0; BAout <= 0;
            #5 y_in <= 0;
        end
        Reg_load1e: begin
            c_out <= 1; alu_control <= 5'd3;
            #5 z_in <= 1;
            #15 z_in <= 0; c_out <= 0;
        end
        Reg_load1f: begin
            zlow_out <= 1;
			#5  Gra <= 1; 
			 rin_debug <= 16'b0000000000010000;
			instruction[26:23] <= 4'd4;
			#10 zlow_out <= 0;
			#5 Rin <= 0; Gra <= 0;
			rin_debug <= 16'd0;
        end
		T0: begin
			 pc_out <= 1; alu_control <= 5'd19; MARin <= 1;
			 #5 z_in <= 1; MARin <= 1;
			 #10 pc_out <= 0;
			 #5 MARin <= 0; z_in <= 0; alu_control <= 5'd0;
		end
		T1: begin
			 memRead <= 1; zlow_out <= 1;
			 #5 read <= 1; pc_in <= 1; mdr_in <= 1; 
			 #5 //mdr_in <= 1;
			 #5 zlow_out <= 0; memRead <= 0;
			 #5 pc_out <= 0; read <= 0; pc_in <= 0; mdr_in <= 0;
			
		end
        T2: begin
			 mdr_out <= 1;
			 #5 MARin <= 1; ir_in <= 1; 
			 #10 mdr_out <= 0;
			 #5  MARin <= 0; ir_in <= 0;
        end
        T3: begin
            Grb <= 1; BAout <= 1; alu_control <= 5'd3;
            #5 y_in <= 1;
			#10 Grb <= 0;
            #5 y_in <= 0; BAout <= 0;
        end
        T4: begin
            c_out <= 1;
            #5 z_in <= 1;
            #15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
        end
        T5: begin
            #5 zlow_out <= 1; MARin <= 1;
            #15 zlow_out <= 0; MARin <= 0;
        end
        T6: begin
            #5 read <= 1; memRead <= 1; mdr_in <= 1;
            #15 read <= 0; memRead <= 0; mdr_in <= 0;
        end
        T7: begin
				//instruction[26:22] <= 4'd4;
				rin_debug <= 16'b0000000000010000;
            #5 mdr_out <= 1; Gra <=1; Rin <= 1;
            #15 mdr_out <= 0; Gra <=0; Rin <= 0;
				rin_debug <= 16'd0;

//        end
//        endcase
    end	
        endcase 
    end 

endmodule


