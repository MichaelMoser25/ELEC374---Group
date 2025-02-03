module booth_algorithm (
    input  signed [15:0] multiplicand,
    input  signed [15:0] multiplier,
    output signed [31:0] product
);
    reg signed [15:0] A;
    reg signed [15:0] S;
    reg signed [31:0] P;
    integer i;

    // Initialize registers
    always @(*) begin
        A = multiplicand;
        S = -multiplicand;
        P = {16'b0, multiplier};
    end

    // Booth Algorithm
    always @(*) begin
        for (i = 0; i < 16; i = i + 1) begin
            case (P[1:0])
                2'b01: P[31:16] = P[31:16] + A;    // Add
                2'b10: P[31:16] = P[31:16] + S;    // Subtract
                default: ;                          // Do nothing for 00 or 11
            endcase
            
            // Arithmetic right shift
            P = P >>> 1;
        end
    end

    assign product = P;
    
endmodule

module booth_algorithm_tb;
    reg  signed [15:0] multiplicand;
    reg  signed [15:0] multiplier;
    wire signed [31:0] product;

    // Instantiate the booth algorithm module
    booth_algorithm BA (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // Test stimulus
    initial begin
        // Test case 1: Positive * Positive
        multiplicand = 16'b0000_0000_0000_0011;  // 3
        multiplier   = 16'b0000_0000_0000_0111;  // 7
        #10;
        $display("Test 1: %d * %d = %d", multiplicand, multiplier, product);

        // Test case 2: Negative * Positive
        multiplicand = -16'd2;  // -2
        multiplier   = 16'd5;   // 5
        #10;
        $display("Test 2: %d * %d = %d", multiplicand, multiplier, product);

        // Test case 3: Additional test case for verification
        multiplicand = 16'd10;   // 10
        multiplier   = -16'd3;   // -3
        #10;
        $display("Test 3: %d * %d = %d", multiplicand, multiplier, product);

        $finish;
    end

    // Optional: Add waveform dumping
    initial begin
        $dumpfile("booth_mult.vcd");
        $dumpvars(0, booth_algorithm_tb);
    end

endmodule
