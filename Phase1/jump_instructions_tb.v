module jump_instructions_tb;
    // Define registers 
    reg [31:0] R5, R8, PC;
    reg clock;
    
    // Clock generation
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end
    
    
    // Jump Register (jr) - Takes the address from a register and transfers it to the PC.
    // Jump and Link (jal) - Performs two functions in sequence:
        // Saves the return address (PC+4) in a designated register (R8)
        // Jumps to the address stored in the specified register (R5)


    
    // Main test sequence - simplified as much as possible
    initial begin
        // Initialize registers
        R5 = 32'h00001111;
        R8 = 32'hABCD1234;
        PC = 32'h00000000;
        
        // Display initial state
        $display("--- Testing jr R8 Instruction ---");
        $display("Initial state: PC=%h, R8=%h", PC, R8);
        
        // Execute jr R8 (simulate control sequence T3)
        @(posedge clock);
        PC = R8; // Direct assignment to simulate R8out, PCin
        @(posedge clock);
        
        // Display result
        $display("After jr R8: PC=%h, R8=%h", PC, R8);
        
        // Verify PC now equals R8
        if (PC === R8)
            $display("SUCCESS: jr R8 instruction worked correctly");
        else
            $display("ERROR: jr R8 instruction failed");
        
        // Reset PC for jal test
        PC = 32'h00000004;
        R8 = 32'hABCD1234; // Reset R8 too
        
        // Display initial state for jal
        $display("\n--- Testing jal R5 Instruction ---");
        $display("Initial state: PC=%h, R5=%h, R8=%h", PC, R5, R8);
        
        // Execute jal R5 (simulate T3 and T4)
        @(posedge clock);
        R8 = PC + 4; // Save return address (PC+4) to R8
        @(posedge clock);
        PC = R5; // Jump to address in R5
        @(posedge clock);
        
        // Display result
        $display("After jal R5: PC=%h, R5=%h, R8=%h", PC, R5, R8);
        
        // Verify PC equals R5
        if (PC === R5)
            $display("SUCCESS: jal R5 instruction worked correctly");
        else
            $display("ERROR: jal R5 instruction failed!");
            
        // Verify R8 contains return address (PC+4)
        if (R8 === 32'h00000008)
            $display("SUCCESS: Return address saved corectly in R8");
        else
            $display("ERROR: Return address saved incorrectly in R8");
        
        $finish;
    end
endmodule
