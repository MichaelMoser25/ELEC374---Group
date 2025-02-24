module NRdiv (
    input [31:0] dividend,
    input [31:0] divisor,
    output reg [31:0] quotient,
    output reg [31:0] remainder
);
    reg [31:0] A, M, Q;
    reg dividend_sign, divisor_sign;
    integer i;

    always @(*) begin
        // Determine signs and work with absolute values
        dividend_sign = dividend[31]; // Extract sign bits
        divisor_sign = divisor[31];

        Q = dividend_sign ? -dividend : dividend; // Take absolute value
        M = divisor_sign ? -divisor : divisor; // Take absolute value
        A = 32'b0; // Clear A register

        // Non-Restoring Division Algorithm
        for (i = 0; i < 32; i = i + 1) begin
            A = {A[30:0], Q[31]}; // Left shift A and Q
            Q = {Q[30:0], 1'b0};

            if (!A[31]) // If A is positive or zero
                A = A - M;
            else
                A = A + M;

            if (!A[31])
                Q[0] = 1; // Set q0 to 1 if A is positive
            else
                Q[0] = 0; // Set q0 to 0 if A is negative
        end

        // Adjust remainder if needed
        if (A[31]) // If remainder is negative
            A = A + M;

        // Restore correct signs
        quotient = (dividend_sign ^ divisor_sign) ? -Q : Q; // Apply correct sign to quotient
        remainder = dividend_sign ? -A : A; // Ensure remainder has same sign as dividend
    end
endmodule
