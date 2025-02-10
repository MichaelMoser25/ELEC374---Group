`timescale 1ns/1ps

module NRdiv_tb;
    reg [31:0] dividend;
    reg [31:0] divisor;
    wire [31:0] quotient;
    wire [31:0] remainder;
    
    NRdiv uut (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder)
    );
    
    initial begin
	 
        // Test Case 1: 100 / 5
        dividend = 100;
        divisor = 5;
        #50;
        
        // Test Case 2: 200 / 7
        dividend = 200;
        divisor = 7;
        #50;
        
        // Test Case 3: 255 / 15
        dividend = 255;
        divisor = 15;
        #50;
        
        // Test Case 4: 1024 / 32
        dividend = 1024;
        divisor = 32;
        #50;
        
        // Test Case 5: 37 / 6
        dividend = 37;
        divisor = 6;
        #50;
        
        // Test Case 6: Edge case 1 / 1
        dividend = 1;
        divisor = 1;
        #50;
        
        // Test Case 7: Large number division
        dividend = 32'h7FFFFFFF;
        divisor = 32'h0000FFFF;
        #50;
        
        // Test Case 8: Division by zero (should handle appropriately)
        dividend = 50;
        divisor = 0;
        #50;
        
        #150;
    end
    
endmodule
