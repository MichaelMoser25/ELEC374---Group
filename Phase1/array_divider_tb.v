`timescale 1ns / 1ps

module array_divider_tb;
    reg [6:0] a;
    reg [3:0] b;
    reg mode;
    wire [3:0] q;
    wire [3:0] r;
    
    // Instantiate the array_divider module
    array_divider uut (
        .a(a),
        .b(b),
        .mode(mode),
        .q(q),
        .r(r)
    );
    
    initial begin
        
        // Test cases
        a = 7'b1001010; b = 4'b0011; mode = 1; #50;
//        a = 7'b0110110; b = 4'b0101; mode = 1; #50;
//        a = 7'b1111111; b = 4'b0001; mode = 1; #50;
//        a = 7'b1010101; b = 4'b0010; mode = 1; #50;
//        a = 7'b0000001; b = 4'b0001; mode = 1; #50;
//        a = 7'b1101100; b = 4'b0110; mode = 1; #50;
//        a = 7'b1010111; b = 4'b0100; mode = 1; #50;
//        a = 7'b0111111; b = 4'b0011; mode = 1; #50;
//        
//        // Edge cases
//        a = 7'b0000000; b = 4'b0001; mode = 1; #50;
//        a = 7'b1111111; b = 4'b1111; mode = 1; #50;
        
        // Finish simulation after 500ns
        #50;
    end
    
endmodule
