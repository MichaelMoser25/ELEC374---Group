module BoothMul (
    input [31:0] multiplicand,  // First input number
    input [31:0] multiplier,    // Second input number
    output reg [63:0] product   // Output product
);
    reg signed [63:0] A,Q,M;    // Internal registers for computation
    reg prev;                   // Previous bit
    integer i;                  // Loop counter
    
    always @(*) begin
        A = 64'b0;             // Initialize accumulator
        Q = {32'b0, multiplier}; // Initialize Q with multiplier
        
        // Sign extend multiplicand based on its MSB
        if (multiplicand[31])
            M = {32'hFFFFFFFF, multiplicand};
        else
            M = {32'b0, multiplicand};
            
        prev = 1'b0;           // Initialize previous bit
        
        // Process 2 bits at a time for radix-4 Booth algorithm
        for (i = 0; i < 32; i = i + 2) begin
            case ({Q[i+1], Q[i], prev})
                3'b001, 3'b010: A = A + M;      // +M
                3'b011: A = A + (M << 1);       // +2M
                3'b100: A = A - (M << 1);       // -2M
                3'b101, 3'b110: A = A - M;      // -M
                default: ;                       // No operation for 000 and 111
            endcase
            prev = Q[i+1];                      // Update previous bit
            M = M << 2;                         // Shift M left by 2 for next iteration
        end 
        product = A;                            // Assign final result to product
    end 
endmodule
