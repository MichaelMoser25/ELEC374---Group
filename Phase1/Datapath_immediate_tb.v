`timescale 1ns/10ps
`define TEST_CASE 3
// 1: addi R5, R6, -7 
// 2: andi R5, R5, 0x95
// 3: ori R5, R6, 0x95


module Datapath_immediate_tb;
    reg clk, clr;
    
    reg mdr_in, mdr_out, y_in, MARin, pc_increment;
    
    reg Gra, Grb, Grc, BAout, Rin, Rout;

    reg hi_in, lo_in, z_in, pc_in, ir_in, inport_in, c_in, read;
    reg [4:0] alu_control;
    
    reg hi_out, lo_out, zhigh_out, zlow_out, pc_out, ir_out, inport_out, c_out;

    // Outputs
    wire [31:0] data_hi, data_lo;

    reg memRead, memWrite;

    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load1c = 4'b0011,
              Reg_load1d = 4'b0100, Reg_load1e = 4'b0101, Reg_load1f = 4'b0110, T0 = 4'b0111,
              T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;

    reg [3:0] present_state = Default;
	 
	 
	 generate 
		if(`TEST_CASE==1) begin
			Datapath #(.MEM_FILE("addi.hex")) DUT (
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
			  .InPortin(inport_in), 
			  .Cin(c_in), 
			  .read(read),
			  .HIout(hi_out), 
			  .LOout(lo_out),
			  .Zhighout(zhigh_out), 
			  .Zlowout(zlow_out),
			  .PCout(pc_out), 
			  .IRout(ir_out), 
			  .InPortout(inport_out), 
			  .Cout(c_out),
			  .alu_control(alu_control),
			  .dataHI(data_hi),
			  .dataLO(data_lo),
			  .memoryRead(memRead),
			  .memoryWrite(memWrite)
			);
		end else if (`TEST_CASE==2) begin
					Datapath #(.MEM_FILE("andi.hex")) DUT (
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
			  .InPortin(inport_in), 
			  .Cin(c_in), 
			  .read(read),
			  .HIout(hi_out), 
			  .LOout(lo_out),
			  .Zhighout(zhigh_out), 
			  .Zlowout(zlow_out),
			  .PCout(pc_out), 
			  .IRout(ir_out), 
			  .InPortout(inport_out), 
			  .Cout(c_out),
			  .alu_control(alu_control),
			  .dataHI(data_hi),
			  .dataLO(data_lo),
			  .memoryRead(memRead),
			  .memoryWrite(memWrite)
			);
		
		
		
		end else if (`TEST_CASE==3) begin
			Datapath #(.MEM_FILE("ori.hex")) DUT (
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
			  .InPortin(inport_in), 
			  .Cin(c_in), 
			  .read(read),
			  .HIout(hi_out), 
			  .LOout(lo_out),
			  .Zhighout(zhigh_out), 
			  .Zlowout(zlow_out),
			  .PCout(pc_out), 
			  .IRout(ir_out), 
			  .InPortout(inport_out), 
			  .Cout(c_out),
			  .alu_control(alu_control),
			  .dataHI(data_hi),
			  .dataLO(data_lo),
			  .memoryRead(memRead),
			  .memoryWrite(memWrite)
			);
		
		end
	 
	 endgenerate

    // Instantiate the Datapath module
    

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 10 ns period
    end
 
    initial begin
        clr = 1;
        Gra = 0; Grb = 0; Grc = 0; Rin = 0; Rout = 0; BAout = 0;
        hi_in = 0; lo_in = 0; z_in = 0; pc_in = 0; ir_in = 0; inport_in = 0; c_in = 0; read = 0;
        hi_out = 0; lo_out = 0; zhigh_out = 0; zlow_out = 0; pc_out = 0; ir_out = 0; inport_out = 0; c_out = 0;
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
            T3 : present_state = T4;
            T4 : present_state = T5;
        endcase
    end  

    always @(present_state) begin 
        case(`TEST_CASE)
            1: begin 
				// addi R5, R6, -7
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
                        Grb <= 1; alu_control <= 5'd3;
                        #5 y_in <= 1; Rout = 1;
                        #10 Grb <= 0;
                        #5 y_in <= 0;  Rout = 0;
                    end
                    T4: begin
                        c_out <= 1;
                        #5 z_in <= 1;
                        #15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
                    end
                    T5: begin
                        #5 zlow_out <= 1; Gra <= 1; Rin <=1;
                        #15 zlow_out <= 0; Gra <= 0; Rin <=0;
                    end

                   
                endcase
            end
				
				 2: begin 
				// andi R5, R6, 0x95
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
                        Grb <= 1; alu_control <= 5'd5;
                        #5 y_in <= 1; Rout = 1;
                        #10 Grb <= 0;
                        #5 y_in <= 0;  Rout = 0;
                    end
                    T4: begin
                        c_out <= 1;
                        #5 z_in <= 1;
                        #15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
                    end
                    T5: begin
                        #5 zlow_out <= 1; Gra <= 1; Rin <=1;
                        #15 zlow_out <= 0; Gra <= 0; Rin <=0;
                    end

                   
                endcase
            end

				
				3: begin 
				// ori R5, R6, 0x95
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
                        Grb <= 1; alu_control <= 5'd6; 
                        #5 y_in <= 1; Rout = 1;
                        #10 Grb <= 0;
                        #5 y_in <= 0;  Rout = 0;
                    end
                    T4: begin
                        c_out <= 1;
                        #5 z_in <= 1;
                        #15 c_out <= 0; z_in <= 0; alu_control <= 5'd0;
                    end
                    T5: begin
                        #5 zlow_out <= 1; Gra <= 1; Rin <=1;
                        #15 zlow_out <= 0; Gra <= 0; Rin <=0;
                    end

                   
                endcase
            end

                endcase


    end

endmodule
