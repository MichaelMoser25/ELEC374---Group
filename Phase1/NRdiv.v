module NRdiv (
	input [31:0] dividend,
	input [31:0] divisor,
	output reg [31:0] quotient,
	output reg [31:0] remainder
);
    
	reg [31:0] A, M, Q;
    
	integer i;
    
	always @(*) begin
		A = 32'b0;
      Q = dividend;
      M = divisor;
        
      for (i = 0; i < 32; i = i + 1) begin
			A = {A[30:0], Q[31]};
         Q = {Q[30:0], 1'b0};
         if (!A[31]) begin // If A >= 0
				A = A - M;
         end else begin	// if A < 0
				A = A + M;
         end
			if (!A[31]) begin
				Q[0] = 1;	// set q0 to 1 if A is positive
			end else begin
				Q[0] = 0;	// set q0 to 0 if A is negative
			end	
       end
        
		 if (A[31]) begin		// Add M to A if negative to get positive remainder
			A = A + M;
		 end
		
       quotient = Q;
       remainder = A;
   end
endmodule
