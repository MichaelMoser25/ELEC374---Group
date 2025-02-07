module boothMul_tb;
    reg  signed [15:0] multiplicand;
    reg  signed [15:0] multiplier;
    wire signed [31:0] product;

    // Instantiate the booth algorithm module
    BoothMul BA (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

 // Test stimulus
    initial begin
        // Test case 1: Positive * Positive
        multiplicand = 16'd3;   // 3
        multiplier   = 16'd7;   // 7
        #10;
        $display("Test 1: %d * %d = %d (Expected: 21)", multiplicand, multiplier, product);
       
        // Test case 2: Negative * Positive
        multiplicand = -16'd2;  // -2
        multiplier   = 16'd5;   // 5
        #10;
        $display("Test 2: %d * %d = %d (Expected: -10)", multiplicand, multiplier, product);
       
        // Test case 3: Positive * Negative
        multiplicand = 16'd10;  // 10
        multiplier   = -16'd3;  // -3
        #10;
        $display("Test 3: %d * %d = %d (Expected: -30)", multiplicand, multiplier, product);
       
        $finish;
    end

    // Optional: Add waveform dumping
    initial begin
        $dumpfile("booth_mult.vcd");
        $dumpvars(0, boothMul_tb);
    end
endmodule
