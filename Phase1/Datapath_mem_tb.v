`timescale 1ns/10ps
// USE $readmemh
module Datapath_mem_tb;
    reg clk, clr;
    
    reg mdr_in, mdr_out, y_in,MARin, pc_increment;
    
    reg [4:0] op_code;
    reg [31:0] data_in;

    reg r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, r7_in;
    reg r8_in, r9_in, r10_in, r11_in, r12_in, r13_in, r14_in, r15_in;
    reg hi_in, lo_in, zhigh_in, zlow_in, pc_in, ir_in, inport_in, c_in, read;

    reg r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out;
    reg r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out;
    reg hi_out, lo_out, zhigh_out, zlow_out, pc_out, ir_out, inport_out, c_out;

    // Outputs
    wire [31:0] data_hi, data_lo;
	 reg memRead, memWrite;

    parameter DEFAULT = 4'b0000, REG_LOAD1A = 4'b0001, REG_LOAD1B = 4'b0010, REG_LOAD1C = 4'b0011;  
//              REG_LOAD2B = 4'b0100, REG_LOAD3A = 4'b0101, REG_LOAD3B = 4'b0110, T0 = 4'b0111,  
//              T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;

    reg [3:0] present_state = DEFAULT;

    // Instantiate the Datapath module
    Datapath DUT (
        .clr(clr),
        .clk(clk),
        .MDRin(mdr_in),
        .MDRout(mdr_out),
        .pc_increment(pc_increment),
        .op_code(op_code),
//        .data_in(data_in),

        // Register input enables
        .R0in(r0_in), .R1in(r1_in), .R2in(r2_in), .R3in(r3_in), .R4in(r4_in),
        .R5in(r5_in), .R6in(r6_in), .R7in(r7_in), .R8in(r8_in), .R9in(r9_in),
        .R10in(r10_in), .R11in(r11_in), .R12in(r12_in), .R13in(r13_in),
        .R14in(r14_in), .R15in(r15_in), .RYin(y_in), .MARin(MARin),
        .HIin(hi_in), .LOin(lo_in),
        .Zhighin(zhigh_in), .Zlowin(zlow_in),
        .PCin(pc_in), .IRin(ir_in), .InPortin(inport_in), .Cin(c_in), .read(read),

        // Register output enables
        .R0out(r0_out), .R1out(r1_out), .R2out(r2_out), .R3out(r3_out), .R4out(r4_out),
        .R5out(r5_out), .R6out(r6_out), .R7out(r7_out), .R8out(r8_out), .R9out(r9_out),
        .R10out(r10_out), .R11out(r11_out), .R12out(r12_out), .R13out(r13_out),
        .R14out(r14_out), .R15out(r15_out),
        .HIout(hi_out), .LOout(lo_out),
        .Zhighout(zhigh_out), .Zlowout(zlow_out),
        .PCout(pc_out), .IRout(ir_out), .InPortout(inport_out), .Cout(c_out),

        // Output connections
        .dataHI(data_hi),
        .dataLO(data_lo),
		  .memoryRead(memRead),
		  .memoryWrite(memWrite)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; //10 originally
    end
 
    initial begin
        clr = 1;


        // Initialize Control Signals
    r0_in = 0; r1_in = 0; r2_in = 0; r3_in = 0; r4_in = 0; r5_in = 0; r6_in = 0; r7_in = 0;
    r8_in = 0; r9_in = 0; r10_in = 0; r11_in = 0; r12_in = 0; r13_in = 0; r14_in = 0; r15_in = 0;
    hi_in = 0; lo_in = 0; zhigh_in = 0; zlow_in = 0; pc_in = 0; ir_in = 0; inport_in = 0; c_in = 0; read = 0;

    r0_out = 0; r1_out = 0; r2_out = 0; r3_out = 0; r4_out = 0; r5_out = 0; r6_out = 0; r7_out = 0;
    r8_out = 0; r9_out = 0; r10_out = 0; r11_out = 0; r12_out = 0; r13_out = 0; r14_out = 0; r15_out = 0;
    hi_out = 0; lo_out = 0; zhigh_out = 0; zlow_out = 0; pc_out = 0; ir_out = 0; inport_out = 0; c_out = 0;
	 MARin = 0;
        op_code = 5'b00000; // opcode for AND
        data_in = 32'h00000000;
		          #5 clr = 0; 
    end

	 
	 
    always @(posedge clk) begin 
        case (present_state)
            DEFAULT  : present_state <= REG_LOAD1A;
            REG_LOAD1A : present_state <= REG_LOAD1B;
            REG_LOAD1B : present_state <= REG_LOAD1C;
            
        endcase
    end  

    always @(present_state) begin 
        case (present_state)
            DEFAULT: begin 
                pc_out <= 0; zlow_out <= 0; mdr_out <= 0;
                r3_out <= 0; r7_out <= 0; pc_in <= 0; mdr_in <= 0; ir_in <= 0; y_in <= 0;
                pc_increment <= 0; mdr_in <= 0;
                r3_in <= 0; r4_in <= 0; r7_in <= 0; memRead <= 0; memWrite <=0;
            end
				
				            REG_LOAD1A: begin    
                read <= 0; mdr_in <= 0;                    
                memRead <= 1; r2_in <= 1;               
                #15 memRead <= 0; r2_in <= 0;  
		            end 

            
            REG_LOAD1B: begin                     
                read <= 1; mdr_in <= 1;               
                #15 read <= 0; mdr_in <= 0;  
		            end 

            REG_LOAD1C: begin   
                mdr_out <= 1; r3_in <= 1;   
                #15 mdr_out <= 0; r3_in <= 0;          
            end 
//
//            REG_LOAD2A: begin   
//                data_in <= 32'h00000324; 
//                read <= 1; mdr_in <= 1;   
//                #15 read <= 0; mdr_in <= 0;       
//            end 
//
//            REG_LOAD2B: begin  
//                mdr_out <= 1; r7_in <= 1;   
//                #15 mdr_out <= 0; r7_in <= 0; 
//            end 
//
//            REG_LOAD3A: begin   
//                data_in <= 32'h00000002; 
//                read	 <= 1; mdr_in <= 1;   
//                #15 read <= 0; mdr_in <= 0; 
//            end 
//
//            REG_LOAD3B: begin  
//                mdr_out <= 1; r4_in <= 1;   
//                #15 mdr_out <= 0; r4_in <= 0; 
//            end 
//
//            T0: begin                                                                                  
//                pc_out <= 1; pc_increment <= 1; MARin <=1; zlow_in <= 1; zhigh_in <= 1; // Remove high ?
//					 #15 pc_out <=0; pc_increment <= 0; MARin <=0; zlow_in <= 0; zhigh_in <= 0;
//            end 
//
//            T1: begin 
//                zlow_out <= 1; pc_in <= 1; read <= 1; mdr_in <= 1;   
//                data_in <= 32'h2A2B8000; 
//					 #15 zlow_out <= 0; pc_in <= 0; read <= 0; mdr_in <= 0;
//            end 
//
//            T2: begin 
//                mdr_out <= 1; ir_in <= 1;
//					 #15 mdr_out <= 0; ir_in <= 0;
//
//            end 
//
//            T3: begin 
//                r3_out <= 1; y_in <= 1;
//					 #15 r3_out <= 0; y_in <= 0;
//            end 
//
//            T4: begin 
//                r7_out <= 1; zlow_in <= 1; op_code <= 5'b00101;
//					 #15 r7_out <= 0; zlow_in <= 0; op_code <= 5'b00000;
//            end 
//
//            T5: begin 
//                zlow_out <= 1; r4_in <= 1;
//					 #15 zlow_out <= 0; r4_in <= 0;
//
//            end 
        endcase 
    end 

endmodule


