module BoothMul_tb;
    // Testbench signals
    reg  signed [31:0] multiplicand;
    reg  signed [31:0] multiplier;
    wire signed [63:0] product;

    // Instantiate the Booth multiplier
    BoothMul BA (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // Helper task to verify multiplication
    task verify_multiplication;
        input signed [31:0] a;
        input signed [31:0] b;
        input string test_name;
        begin
            multiplicand = a;
            multiplier = b;
            #10; // Wait for computation
            $display("\nTest Case: %s", test_name);
            $display("Multiplicand: %d (0x%h)", multiplicand, multiplicand);
            $display("Multiplier  : %d (0x%h)", multiplier, multiplier);
            $display("Product     : %d (0x%h)", product, product);
            $display("Expected    : %d", $signed(multiplicand) * $signed(multiplier));
            if (product === $signed(multiplicand) * $signed(multiplier))
                $display("Status: PASSED ✓");
            else
                $display("Status: FAILED ✗");
        end
    endtask

    // Test stimulus
    initial begin
        $display("\n=== Starting 32-bit Booth Multiplier Tests ===\n");

        // Test Case 1: Small positive numbers
        verify_multiplication(32'd123, 32'd456, "Small Positive Numbers");

        // Test Case 2: Small negative * positive
        verify_multiplication(-32'd55, 32'd13, "Small Negative * Positive");

        // Test Case 3: Positive * negative
        verify_multiplication(32'd789, -32'd321, "Positive * Negative");

        // Test Case 4: Negative * negative
        verify_multiplication(-32'd444, -32'd333, "Negative * Negative");

        // Test Case 5: Zero cases
        verify_multiplication(32'd0, 32'd12345, "Zero * Positive");
        verify_multiplication(32'd67890, 32'd0, "Positive * Zero");

        // Test Case 6: Powers of 2
        verify_multiplication(32'd1 << 15, 32'd1 << 16, "Powers of 2");

        // Test Case 7: Large numbers
        verify_multiplication(32'h7FFFFFFF, 32'd2, "Max Positive * 2");
        
        // Test Case 8: Negative powers of 2
        verify_multiplication(-32'd1 << 20, 32'd1 << 10, "Negative Power of 2 * Positive");

        // Test Case 9: Max negative number
        verify_multiplication(32'h80000000, 32'd2, "Max Negative * 2");

        // Test Case 10: Identity multiplication
        verify_multiplication(32'd1234567, 32'd1, "Identity Multiplication");

        $display("\n=== Completed 32-bit Booth Multiplier Tests ===\n");
        $finish;
    end

    // Generate VCD file
    initial begin
        $dumpfile("booth_mult_32bit.vcd");
        $dumpvars(0, BoothMul_tb);
    end

    // Optional: Add timeout to catch hanging simulations
    initial begin
        #1000; // Timeout after 1000 time units
        $display("Simulation timeout!");
        $finish;
    end
endmodule
