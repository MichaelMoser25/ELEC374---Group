`timescale 1ns/10ps
<<<<<<< Updated upstream
`define TEST_CASE 12
=======
`define TEST_CASE 8
>>>>>>> Stashed changes

module con_ff_tb;
    reg clk, clr;
    
    reg mdr_in, mdr_out, y_in, MARin, pc_increment;
    
    reg Gra, Grb, Grc, BAout, Rin, Rout;

    reg hi_in, lo_in, z_in, pc_in, ir_in, outport_write, c_in, read;
    reg [4:0] alu_control;
    
    reg hi_out, lo_out, zhigh_out, zlow_out, pc_out, ir_out, inport_read, c_out;
	 
	 reg CON_in;
	 wire CON_flag;
	 
	 
    // Outputs
    wire [31:0] data_hi, data_lo;

    reg memRead, memWrite;

    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load1c = 4'b0011,
              Reg_load1d = 4'b0100, Reg_load1e = 4'b0101, Reg_load1f = 4'b0110, T0 = 4'b0111,
              T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101;
          
    reg [3:0] present_state = Default;
	 
	 generate 
		if(`TEST_CASE==1) begin
			Datapath #(.MEM_FILE("brzrCase1.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
		end else if (`TEST_CASE ==2) begin
			Datapath #(.MEM_FILE("brzrCase2.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
		
		
		end else if (`TEST_CASE==3) begin
			Datapath #(.MEM_FILE("brnzCase1.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
		
		end else if (`TEST_CASE==4) begin
				Datapath #(.MEM_FILE("brnzCase2.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
		
		
		end else if (`TEST_CASE==5) begin
				Datapath #(.MEM_FILE("brplCase1.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
		
		
		end else if (`TEST_CASE==6) begin
				Datapath #(.MEM_FILE("brplCase2.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
			
			end else if (`TEST_CASE==7) begin
				Datapath #(.MEM_FILE("brmiCase1.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
			
			end else if (`TEST_CASE==8) begin
				Datapath #(.MEM_FILE("brmiCase2.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
			end else if (`TEST_CASE==9) begin
				Datapath #(.MEM_FILE("jrCase.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
			end else if (`TEST_CASE==10) begin
				Datapath #(.MEM_FILE("jalCase.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
			end else if (`TEST_CASE==11) begin
<<<<<<< Updated upstream
				 Datapath #(.MEM_FILE("mfhiCase.hex")) DUT (
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
					.OutPort_write(inport_in),  
					.Cin(c_in), 
					.read(read),
					.HIout(hi_out), 
					.LOout(lo_out),
					.Zhighout(zhigh_out), 
					.Zlowout(zlow_out),
					.PCout(pc_out), 
					.IRout(ir_out), 
					.InPort_read(inport_out),  
					.Cout(c_out),
					.alu_control(alu_control),
					.dataHI(data_hi),
					.dataLO(data_lo),
					.memoryRead(memRead),
					.memoryWrite(memWrite)
			 );
				end else if (`TEST_CASE==12) begin
					 Datapath #(.MEM_FILE("mfloCase.hex")) DUT (
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
						.OutPort_write(inport_in), 
						.Cin(c_in), 
						.read(read),
						.HIout(hi_out), 
						.LOout(lo_out),
						.Zhighout(zhigh_out), 
						.Zlowout(zlow_out),
						.PCout(pc_out), 
						.IRout(ir_out), 
						.InPort_read(inport_out),  
						.Cout(c_out),
						.alu_control(alu_control),
						.dataHI(data_hi),
						.dataLO(data_lo),
						.memoryRead(memRead),
						.memoryWrite(memWrite)
				 );
				 
				 end
=======
				Datapath #(.MEM_FILE("specialCase.hex")) DUT (
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
			  .memoryWrite(memWrite),
			  .CON_FF_in(CON_in),
			  .CON_FF_result(CON_flag)
			);
		
		end
>>>>>>> Stashed changes
	 
	 endgenerate
	 
	 // Clock generation
    reg sim_end;
	 initial begin
		  clk = 0;
		  sim_end = 0;
		  #10000 sim_end = 1; // Auto-terminate after 10000 time units
	 end

	 always #10 if (!sim_end) clk = ~clk;
 
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
            T3 : present_state = T4;
            T4 : present_state = T5;
            T5 : present_state = T6;
        endcase
    end
	 
	 always @(present_state) begin 
        case(`TEST_CASE)
            1: begin 
				// brzr R1, 27 where R1 = 0x0
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
								Gra <= 1; Rout <= 1; CON_in <= 1;
								#10 Gra <= 0; Rout <= 0; CON_in <= 0;
						  end
						  T4: begin
								pc_out <= 1; y_in <= 1;
								#10 pc_out <= 0; y_in <= 0;
						  end
						  T5: begin
								c_out <= 1; // ADD ??;
								z_in <= 1;
								#10 c_out <= 0; z_in <= 0;
								end
						  T6: begin
<<<<<<< Updated upstream
								zlow_out <= 1; // evaluate CON FF result and PC if necessary
								#10 zlow_out <= 0;
=======
								zlow_out <= 1; pc_in <= (CON_flag == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
								#15 zlow_out <= 0; pc_in <= 0;
						  end
					  
				  endcase
				end
				2: begin 
				// brzr R1, 27 where R1 = 0x44
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
								Gra <= 1; Rout <= 1; CON_in <= 1;
								#10 Gra <= 0; Rout <= 0; CON_in <= 0;
						  end
						  T4: begin
								pc_out <= 1; y_in <= 1;
								#10 pc_out <= 0; y_in <= 0;
						  end
						  T5: begin
								c_out <= 1; alu_control <= 5'b00011;
								z_in <= 1;
								#15 c_out <= 0; z_in <= 0;
								end
						  T6: begin
								zlow_out <= 1; pc_in <= (CON_flag == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
								#15 zlow_out <= 0; pc_in <= 0;
						  end
					  
				  endcase
				end
				3: begin 
				// brnz R1, 27 where R1 = 0xFF
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
								Gra <= 1; Rout <= 1; CON_in <= 1;
								#10 Gra <= 0; Rout <= 0; CON_in <= 0;
						  end
						  T4: begin
								pc_out <= 1; y_in <= 1;
								#10 pc_out <= 0; y_in <= 0;
						  end
						  T5: begin
								c_out <= 1; alu_control <= 5'b00011;
								z_in <= 1;
								#15 c_out <= 0; z_in <= 0;
								end
						  T6: begin
								zlow_out <= 1; pc_in <= (CON_flag == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
								#15 zlow_out <= 0; pc_in <= 0;
						  end
					  
				  endcase
				end
				4: begin 
				// brnz R1, 27 where R1 = 0x0
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
								Gra <= 1; Rout <= 1; CON_in <= 1;
								#10 Gra <= 0; Rout <= 0; CON_in <= 0;
						  end
						  T4: begin
								pc_out <= 1; y_in <= 1;
								#10 pc_out <= 0; y_in <= 0;
						  end
						  T5: begin
								c_out <= 1; alu_control <= 5'b00011;
								z_in <= 1;
								#15 c_out <= 0; z_in <= 0;
								end
						  T6: begin
								zlow_out <= 1; pc_in <= (CON_flag == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
								#15 zlow_out <= 0; pc_in <= 0;
						  end
					  
				  endcase
				end
				5: begin 
				// brpl R1, 27 where R1 = 0x10
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
								Gra <= 1; Rout <= 1; CON_in <= 1;
								#10 Gra <= 0; Rout <= 0; CON_in <= 0;
						  end
						  T4: begin
								pc_out <= 1; y_in <= 1;
								#10 pc_out <= 0; y_in <= 0;
						  end
						  T5: begin
								c_out <= 1; alu_control <= 5'b00011;
								z_in <= 1;
								#15 c_out <= 0; z_in <= 0;
								end
						  T6: begin
								zlow_out <= 1; pc_in <= (CON_flag == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
								#15 zlow_out <= 0; pc_in <= 0;
						  end
					  
				  endcase
				end
				6: begin 
				// brpl R1, 27 where R1 = 0xFFFFF01
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
								Gra <= 1; Rout <= 1; CON_in <= 1;
								#10 Gra <= 0; Rout <= 0; CON_in <= 0;
						  end
						  T4: begin
								pc_out <= 1; y_in <= 1;
								#10 pc_out <= 0; y_in <= 0;
						  end
						  T5: begin
								c_out <= 1; alu_control <= 5'b00011;
								z_in <= 1;
								#15 c_out <= 0; z_in <= 0;
								end
						  T6: begin
								zlow_out <= 1; pc_in <= (CON_flag == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
								#15 zlow_out <= 0; pc_in <= 0;
						  end
					  
				  endcase
				end
				7: begin 
				// brmi R1, 27 where R1 = 0xFFFFFF99
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
								Gra <= 1; Rout <= 1; CON_in <= 1;
								#10 Gra <= 0; Rout <= 0; CON_in <= 0;
						  end
						  T4: begin
								pc_out <= 1; y_in <= 1;
								#10 pc_out <= 0; y_in <= 0;
						  end
						  T5: begin
								c_out <= 1; alu_control <= 5'b00011;
								z_in <= 1;
								#15 c_out <= 0; z_in <= 0;
								end
						  T6: begin
								zlow_out <= 1; pc_in <= (CON_flag == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
								#15 zlow_out <= 0; pc_in <= 0;
						  end
					  
				  endcase
				end
				8: begin 
				// brmi R1, 27 where R1 = 0x0
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
								Gra <= 1; Rout <= 1; CON_in <= 1;
								#10 Gra <= 0; Rout <= 0; CON_in <= 0;
						  end
						  T4: begin
								pc_out <= 1; y_in <= 1;
								#10 pc_out <= 0; y_in <= 0;
						  end
						  T5: begin
								c_out <= 1; alu_control <= 5'b00011;
								z_in <= 1;
								#15 c_out <= 0; z_in <= 0;
								end
						  T6: begin
								zlow_out <= 1; pc_in <= (CON_flag == 1) ? 1 : 0; // evaluate CON FF result and PC if necessary
								#15 zlow_out <= 0; pc_in <= 0;
>>>>>>> Stashed changes
						  end
					  
				  endcase
				end
				
				
				10: begin 
				// jr R2, where R2 = 0x8000
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
                        zlow_out <= 1; Gra <= 1;
                        #5 Rin = 1;
                        #10 zlow_out <= 0;
                        #5 Rin <= 0; Gra <= 0;
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
								Gra <= 1; Rout <= 1; pc_in <= 1;
								#10 Gra <= 0; Rout <= 0; pc_in <= 0;
						  end
				  endcase
				end
				
				
				9: begin 
				// jal R3, where R3 = 0x1000
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
                        zlow_out <= 1; Gra <= 1;
                        #5 Rin = 1;
                        #10 zlow_out <= 0;
                        #5 Rin <= 0; Gra <= 0;
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
								Gra <= 1; Rout <= 1; pc_in <= 1;
								#10 Gra <= 0; Rout <= 0; pc_in <= 0;
                    end

					  endcase
					end
					11: begin 
					 case (present_state)
						  Default: begin
								// Reset all signals
								pc_out <= 0; zlow_out <= 0; mdr_out <= 0; hi_out <= 0; 
								lo_out <= 0; zhigh_out <= 0; c_out <= 0;
								lo_in <= 0; hi_in <= 0; MARin <= 0;
								pc_increment <= 0; BAout <= 0; alu_control <= 5'd0;
								Rin <= 0; Rout <= 0;
								MARin <= 0; z_in <= 0; pc_in <= 0; mdr_in <= 0; 
								ir_in <= 0; y_in <= 0;
								read <= 0; 
								clr <= 0; memRead <= 0; memWrite <= 0; 
								Gra <= 0; Grb <= 0; Grc <= 0; BAout <= 0;
						  end
						  
						  Reg_load1a: begin
								pc_increment <= 1; pc_out <= 1; alu_control <= 5'd19;
								#5 z_in <= 1;
								#10 pc_out <= 0; 
								#5 z_in <= 0; alu_control <= 5'd0; MARin <= 0;
						  end
						  
						  Reg_load1b: begin
								read <= 1; zlow_out <= 1; pc_in <= 1;
								#5 memRead <= 1; mdr_in <= 1;
								#10 zlow_out <= 0; memRead <= 0;
								pc_out <= 0; read <= 0; mdr_in <= 0; pc_in <= 0; pc_increment <= 0;
						  end
						  
						  Reg_load1c: begin
								mdr_out <= 1;
								#5 ir_in <= 1; 
								#10 mdr_out <= 0;
								ir_in <= 0;
						  end
						  
						  Reg_load1d: begin
								// Initialize HI register with test value 0x12345678
								hi_in <= 1;
								c_out <= 1;  // If this puts the immediate value on the bus
								#10 hi_in <= 0; c_out <= 0;
						  end
						  
						  Reg_load1e: begin
								c_out <= 1; alu_control <= 5'd3;
								#5 z_in <= 1;
								#15 z_in <= 0; c_out <= 0;
						  end
						  
						  Reg_load1f: begin
								zlow_out <= 1; Gra <= 1;
								#5 Rin = 1;
								#10 zlow_out <= 0;
								#5 Rin <= 0; Gra <= 0;
						  end

						  // Fetch first instruction (LDI R0, 0x1234)
						  T0: begin
								pc_out <= 1; alu_control <= 5'd19; MARin <= 1; pc_increment <= 1;
								#5 z_in <= 1; 
								#10 pc_out <= 0;
								#5 MARin <= 0; z_in <= 0; alu_control <= 5'd0;
						  end
						  
						  T1: begin
								memRead <= 1; zlow_out <= 1; pc_in <= 1;
								#5 read <= 1; mdr_in <= 1; 
								#10 zlow_out <= 0; memRead <= 0;
								#5 read <= 0; pc_in <= 0; mdr_in <= 0; pc_increment <= 0;
						  end
						  
						  T2: begin
								mdr_out <= 1;
								#5 ir_in <= 1; 
								#10 mdr_out <= 0;
								ir_in <= 0;
						  end
						  
						  T3: begin
								// For LDI instruction
								hi_out <= 1; Gra <= 1; Rin <= 1;
								#10 hi_out <= 0; Gra <= 0; Rin <= 0;
						  end
						  
						  T4: begin
								// Empty state for first instruction
						  end
						  
						  T5: begin
								// Empty state for first instruction
						  end
						  
						  T6: begin
								// Empty state for first instruction
								// After this, we return to T0 for the second instruction (MFHI)
						  end
					 endcase
				end
					
					12: begin 
					 case (present_state)
						  Default: begin
								// Reset all signals
								pc_out <= 0; zlow_out <= 0; mdr_out <= 0; hi_out <= 0; 
								lo_out <= 0; zhigh_out <= 0; c_out <= 0;
								lo_in <= 0; hi_in <= 0; MARin <= 0;
								pc_increment <= 0; BAout <= 0; alu_control <= 5'd0;
								Rin <= 0; Rout <= 0;
								MARin <= 0; z_in <= 0; pc_in <= 0; mdr_in <= 0; 
								ir_in <= 0; y_in <= 0;
								read <= 0; 
								clr <= 0; memRead <= 0; memWrite <= 0; 
								Gra <= 0; Grb <= 0; Grc <= 0; BAout <= 0;
						  end
						  
						  Reg_load1a: begin
								pc_increment <= 1; pc_out <= 1; alu_control <= 5'd19;
								#5 z_in <= 1;
								#10 pc_out <= 0; 
								#5 z_in <= 0; alu_control <= 5'd0; MARin <= 0;
						  end
						  
						  Reg_load1b: begin
								read <= 1; zlow_out <= 1; pc_in <= 1;
								#5 memRead <= 1; mdr_in <= 1;
								#10 zlow_out <= 0; memRead <= 0;
								pc_out <= 0; read <= 0; mdr_in <= 0; pc_in <= 0; pc_increment <= 0;
						  end
						  
						  Reg_load1c: begin
								mdr_out <= 1;
								#5 ir_in <= 1; 
								#10 mdr_out <= 0;
								ir_in <= 0;
						  end
						  
						  Reg_load1d: begin
								// Load a specific value (0x87654321) into the LO register
								// First put a value on the bus (using immediate value circuit)
								c_out <= 1; alu_control <= 5'd0;  // Pass through immediate value
								#5 lo_in <= 1; // Now enable writing to LO
								#10 c_out <= 0; lo_in <= 0;
						  end
						  
						  Reg_load1e: begin
								c_out <= 1; alu_control <= 5'd3;
								#5 z_in <= 1;
								#15 z_in <= 0; c_out <= 0;
						  end
						  
						  Reg_load1f: begin
								zlow_out <= 1; Gra <= 1;
								#5 Rin = 1;
								#10 zlow_out <= 0;
								#5 Rin <= 0; Gra <= 0;
						  end

						  // Fetch and execute first instruction (LDI R1, 0x5678)
						  T0: begin
								pc_out <= 1; alu_control <= 5'd19; MARin <= 1; pc_increment <= 1;
								#5 z_in <= 1; 
								#10 pc_out <= 0;
								#5 MARin <= 0; z_in <= 0; alu_control <= 5'd0;
						  end
						  
						  T1: begin
								memRead <= 1; zlow_out <= 1; pc_in <= 1;
								#5 read <= 1; mdr_in <= 1; 
								#10 zlow_out <= 0; memRead <= 0;
								#5 read <= 0; pc_in <= 0; mdr_in <= 0; pc_increment <= 0;
						  end
						  
						  T2: begin
								mdr_out <= 1;
								#5 ir_in <= 1; 
								#10 mdr_out <= 0;
								ir_in <= 0;
						  end
						  
						  T3: begin
								// For the first instruction cycle - LDI R1, 0x5678
								c_out <= 1; Gra <= 1; Rin <= 1;
								#10 c_out <= 0; Gra <= 0; Rin <= 0;
						  end
						  
						  T4: begin
								// Return to T0 to fetch MFLO instruction
								pc_out <= 1; alu_control <= 5'd19; MARin <= 1; pc_increment <= 1;
								#5 z_in <= 1; 
								#10 pc_out <= 0;
								#5 MARin <= 0; z_in <= 0; alu_control <= 5'd0;
						  end
						  
						  T5: begin
								// Fetch MFLO instruction
								memRead <= 1; zlow_out <= 1; pc_in <= 1;
								#5 read <= 1; mdr_in <= 1; 
								#10 zlow_out <= 0; memRead <= 0;
								#5 read <= 0; pc_in <= 0; mdr_in <= 0; pc_increment <= 0;
						  end
						  
						  T6: begin
								// Load MFLO instruction into IR
								mdr_out <= 1;
								#5 ir_in <= 1; 
								#10 mdr_out <= 0;
								ir_in <= 0;
								
								// Now execute the MFLO instruction in the next cycle
								#5 lo_out <= 1; Gra <= 1; Rin <= 1;
								#10 lo_out <= 0; Gra <= 0; Rin <= 0;
						  end
					 endcase
				end
					
					
                endcase


    end

endmodule

						  
						  
						  
						  
						  
						  
				
