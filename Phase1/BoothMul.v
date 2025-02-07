module BoothMul (
    input  signed [15:0] multiplicand,
    input  signed [15:0] multiplier,
    output signed [31:0] product
);
    reg signed [31:0] P;
    reg signed [15:0] A, S;
    integer i;

    always @(*) begin
        // Initialize
        A = multiplicand;
        S = (-multiplicand);
        // Initialize P with multiplier in lower half and zero in upper half
        P = {{16{multiplier[15]}}, multiplier};  // Sign extend multiplier
       
         // Booth Algorithm
        for (i = 0; i < 16; i = i + 1) begin
            if (P[0] == 1'b1)     // If LSB is 1
                P[31:16] = P[31:16] + A;  // Add multiplicand to upper half
               
            // Arithmetic right shift
            P = $signed(P) >>> 1;
        end
    end

    assign product = P;
endmodule
