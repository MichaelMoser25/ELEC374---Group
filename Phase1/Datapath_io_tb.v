`timescale 1ns/10ps
`define TEST_CASE 2
// 1: out R6
// 2: in R3 


module Datapath_io_tb;
    reg clk, clr;
    
    reg mdr_in, mdr_out, y_in, MARin, pc_increment;
    
    reg Gra, Grb, Grc, BAout, Rin, Rout;

    reg hi_in, lo_in, z_in, pc_in, ir_in, outport_write, c_in, read;
    reg [4:0] alu_control;
    
    reg hi_out, lo_out, zhigh_out, zlow_out, pc_out, ir_out, inport_read, c_out;

    // Outputs
    wire [31:0] data_hi, data_lo;

    reg memRead, memWrite;

    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load1c = 4'b0011,
              Reg_load1d = 4'b0100, Reg_load1e = 4'b0101, Reg_load1f = 4'b0110, T0 = 4'b0111,
              T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010;

    reg [3:0] present_state = Default;
	 
	 
	 generate 
		if(`TEST_CASE==1) begin
			Datapath #(.MEM_FILE("outCase.hex")) DUT (
			  .clr(clr),
			  .clk(clk),
			  .MDRin(mdr_in),
			  .MDRout(mdr_out),
			  .pc_increment(pc_increment),
			  .Gra(Gra),
			  .Grb(Grb),
			  .Grc(Grc),
			  .Rin(Rin),
			  .Rout(Rout),
			  .BAout(BAout),
			  .RYin(y_in), 
			  .MARin(MARin),
			  .HIin(hi_in), 
			  .LOin(lo_in),
			  .Zhighin(z_in), 
			  .Zlowin(z_in),
			  .PCin(pc_in), 
			  .IRin(ir_in), 
			  .OutPort_write(outport_write), 
			  .Cin(c_in), 
			  .read(read),
			  .HIout(hi_out), 
			  .LOout(lo_out),
			  .Zhighout(zhigh_out), 
			  .Zlowout(zlow_out),
			  .PCout(pc_out), 
			  .IRout(ir_out), 
			  .InPort_read(inport_read), 
			  .Cout(c_out),
			  .alu_control(alu_control),
			  .dataHI(data_hi),
			  .dataLO(data_lo),
			  .memoryRead(memRead),
			  .memoryWrite(memWrite)
			);
		end else if (`TEST_CASE ==2) begin
			Datapath #(.MEM_FILE("inCase.hex")) DUT (
			  .clr(clr),
			  .clk(clk),
			  .MDRin(mdr_in),
			  .MDRout(mdr_out),
			  .pc_increment(pc_increment),
			  .Gra(Gra),
			  .Grb(Grb),
			  .Grc(Grc),
			  .Rin(Rin),
			  .Rout(Rout),
			  .BAout(BAout),
			  .RYin(y_in), 
			  .MARin(MARin),
			  .HIin(hi_in), 
			  .LOin(lo_in),
			  .Zhighin(z_in), 
			  .Zlowin(z_in),
			  .PCin(pc_in), 
			  .IRin(ir_in), 
			  .OutPort_write(outport_write), 
			  .Cin(c_in), 
			  .read(read),
			  .HIout(hi_out), 
			  .LOout(lo_out),
			  .Zhighout(zhigh_out), 
			  .Zlowout(zlow_out),
			  .PCout(pc_out), 
			  .IRout(ir_out), 
			  .InPort_read(inport_read), 
			  .Cout(c_out),
			  .alu_control(alu_control),
			  .dataHI(data_hi),
			  .dataLO(data_lo),
			  .memoryRead(memRead),
			  .memoryWrite(memWrite)
			);
		end
	endgenerate
			
// Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 10 ns period
    end
 
    initial begin
        clr = 1;
        Gra = 0; Grb = 0; Grc = 0; Rin = 0; Rout = 0; BAout = 0;
        hi_in = 0; lo_in = 0; z_in = 0; pc_in = 0; ir_in = 0; outport_write = 0; c_in = 0; read = 0;
        hi_out = 0; lo_out = 0; zhigh_out = 0; zlow_out = 0; pc_out = 0; ir_out = 0; inport_read = 0; c_out = 0;
        MARin = 0; 
        alu_control <= 5'd0;
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
        endcase
    end  

    always @(present_state) begin 
        case(`TEST_CASE)
            1: begin 
				// out r6
                case (present_state)

                    Default: begin
                        pc_out <= 0; zlow_out <= 0; mdr_out <= 0; hi_out <= 0; 
                        lo_out <= 0; zhigh_out <= 0; c_out <= 0;
                        lo_in <= 0; hi_in <= 0; MARin <= 0;
                        pc_increment <= 0;
                        Rin <= 0; Rout <= 0;
                        MARin <= 0; z_in <= 0; pc_in <= 0; mdr_in <= 0; 
                        ir_in <= 0; y_in <= 0;
                        read <= 0; 
                        clr <= 0; memRead <= 0; memWrite <= 0; 
                        Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0;
                    end
						  
						   Reg_load1a: begin
                        pc_increment <= 1; pc_out <= 1; alu_control <= 5'd19;
                        #5 z_in <= 1;
                        #10 pc_out <= 0; 
                        #5 z_in <= 0; alu_control <= 5'd0; MARin <= 0;
                    end
                    Reg_load1b: begin
                        read <= 1; zlow_out <= 1;  pc_in <= 1;
                        #5 memRead <= 1;  mdr_in <= 1;
                        #10 zlow_out <= 0; memRead <= 0;
                        pc_out <= 0; read <= 0; mdr_in <= 0; pc_in <= 0;   pc_increment <= 0;
                    end
                    Reg_load1c: begin
                        mdr_out <= 1;
                        #5 ir_in <= 1; 
                        #10 mdr_out <= 0;
                        ir_in <= 0;
                    end
                    Reg_load1d: begin
                        Gra <= 1; c_out <=1;
                        #5 Rin <= 1;
                        #10 Gra <= 0;
                        #5 Rin <= 0; c_out <= 0;
                    end

                    T0: begin
                        pc_out <= 1; alu_control <= 5'd19; MARin <= 1; pc_increment <= 1;
                        #5 z_in <= 1; 
                        #10 pc_out <= 0;
                        #5 MARin <= 0; z_in <= 0; alu_control <= 5'd0;
                    end
                    T1: begin
                        memRead <= 1; zlow_out <= 1;  pc_in <=1;
                        #5 read <= 1; pc_in <= 1; mdr_in <= 1; 
                        #5 //mdr_in <= 1;
                        #5 zlow_out <= 0; memRead <= 0;
                        #5 pc_out <= 0; read <= 0; pc_in <= 0; mdr_in <= 0;   pc_in <=0; pc_increment <= 0;
                    end
                    T2: begin
                        mdr_out <= 1;
                        #5 ir_in <= 1; 
                        #10 mdr_out <= 0;
                        #5 MARin <= 0; ir_in <= 0;
                    end
                    T3: begin
                        Gra <= 1; Rout <= 1; outport_write<= 1;
                        #15 Gra <= 0; Rout <= 0; outport_write = 0;
                    end
                endcase
            end
				2: begin 
				// in r3
					case (present_state)

                    Default: begin
                        pc_out <= 0; zlow_out <= 0; mdr_out <= 0; hi_out <= 0; 
                        lo_out <= 0; zhigh_out <= 0; c_out <= 0;
                        lo_in <= 0; hi_in <= 0; MARin <= 0;
                        pc_increment <= 0;
                        Rin <= 0; Rout <= 0;
                        MARin <= 0; z_in <= 0; pc_in <= 0; mdr_in <= 0; 
                        ir_in <= 0; y_in <= 0;
                        read <= 0; 
                        clr <= 0; memRead <= 0; memWrite <= 0; 
                        Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0;
                    end
                    T0: begin
                        pc_out <= 1; alu_control <= 5'd19; MARin <= 1; pc_increment <= 1;
                        #5 z_in <= 1; 
                        #10 pc_out <= 0;
                        #5 MARin <= 0; z_in <= 0; alu_control <= 5'd0;
                    end
                    T1: begin
                        memRead <= 1; zlow_out <= 1;  pc_in <=1;
                        #5 read <= 1; pc_in <= 1; mdr_in <= 1; 
                        #5 //mdr_in <= 1;
                        #5 zlow_out <= 0; memRead <= 0;
                        #5 pc_out <= 0; read <= 0; pc_in <= 0; mdr_in <= 0;   pc_in <=0; pc_increment <= 0;
                    end
                    T2: begin
                        mdr_out <= 1;
                        #5 ir_in <= 1; 
                        #10 mdr_out <= 0;
                        #5 MARin <= 0; ir_in <= 0;
                    end
                    T3: begin
                        Gra <= 1; Rin <= 1; 
								#5 inport_read <= 1;
                        #15 Gra <= 0; Rin <= 0; inport_read = 0;
                    end
						  
					  endcase
					end
		  endcase
	end
endmodule
	