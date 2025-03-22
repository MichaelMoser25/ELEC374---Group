module tb_mips_mfhi_mflo();
    reg clk;
    reg reset;
    wire [31:0] result_mfhi;
    wire [31:0] result_mflo;
    
    // Instantiate the module
    mips_mfhi_mflo uut (
        .clk(clk),
        .reset(reset),
        .result_mfhi(result_mfhi),
        .result_mflo(result_mflo)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        $display("Starting simulation of MFHI and MFLO instructions");
        
        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        
        // Run for a while to process both instructions
        #100;
        
        // Display results
        $display("After MFHI R3: R3 = %h", result_mfhi);
        $display("After MFLO R2: R2 = %h", result_mflo);
        
        // Verify correctness
        if (result_mfhi == 32'h12345678 && result_mflo == 32'h87654321)
            $display("Test PASSED: Both MFHI and MFLO instructions worked correctly");
        else
            $display("Test FAILED: Incorrect results");
            
        $finish;
    end
    
    // Monitor states and registers
    initial begin
        $monitor("Time: %t, State: %d, R3: %h, R2: %h", 
                 $time, uut.state, result_mfhi, result_mflo);
    end
endmodule
