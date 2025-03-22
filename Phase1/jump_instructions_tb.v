module jump_instructions_tb;
    // Testbench signals
    reg clock;
    reg reset;
    
    // Control signals
    reg jr_execute;
    reg jal_execute;
    
    // Register values
    reg [31:0] source_reg;
    reg [31:0] pc_current;
    wire [31:0] pc_next;
    wire [31:0] link_reg_value;
    
    // Instantiate the jump_instructions module
    jump_instructions jump_inst (
        .clock(clock),
        .reset(reset),
        .jr_execute(jr_execute),
        .jal_execute(jal_execute),
        .source_reg(source_reg),
        .pc_current(pc_current),
        .pc_next(pc_next),
        .link_reg_value(link_reg_value)
    );
    
    // Clock generation
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end
    
    // Main test sequence
    initial begin
        // Initialize signals
        reset = 1;
        jr_execute = 0;
        jal_execute = 0;
        source_reg = 32'h00000000;
        pc_current = 32'h00000000;
        
        // Apply reset
        #20 reset = 0;
        
        // Test jr instruction
        $display("--- Testing jr Instruction ---");
        $display("Initial state: PC=%h, Source Reg=%h", pc_current, source_reg);
        
        source_reg = 32'hABCD1234;  // Jump target address
        pc_current = 32'h00000004;
        jr_execute = 1;
        
        @(posedge clock);
        #1; // Small delay to let signals propagate
        
        $display("After jr: PC_next=%h", pc_next);
        
        // Verify PC now equals source_reg
        if (pc_next === source_reg)
            $display("SUCCESS: jr instruction worked correctly");
        else
            $display("ERROR: jr instruction failed");
            
        // Reset control signals
        jr_execute = 0;
        #20;
        
        // Test jal instruction
        $display("\n--- Testing jal Instruction ---");
        $display("Initial state: PC=%h, Source Reg=%h", pc_current, source_reg);
        
        source_reg = 32'h00001111;  // Jump target address
        pc_current = 32'h00000100;
        jal_execute = 1;
        
        @(posedge clock);
        #1; // Small delay to let signals propagate
        
        $display("After jal: PC_next=%h, Link Reg Value=%h", pc_next, link_reg_value);
        
        // Verify PC equals source_reg
        if (pc_next === source_reg)
            $display("SUCCESS: jal instruction jump worked correctly");
        else
            $display("ERROR: jal instruction jump failed!");
            
        // Verify link_reg_value contains return address (PC+4)
        if (link_reg_value === (pc_current + 4))
            $display("SUCCESS: Return address saved correctly");
        else
            $display("ERROR: Return address saved incorrectly");
            
        // Reset control signals
        jal_execute = 0;
        
        #20 $finish;
    end
endmodule
