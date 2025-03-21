`timescale 1ns / 1ps

module CLA_4bit_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] sum;
    wire Cout;

    // Instantiate the CLA_4bit module
    CLA_4bit adder (
        .A(A),
        .B(B),
        .Cin(Cin),
        .sum(sum),
        .Cout(Cout)
    );
	 


    initial begin
        // Test cases
        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0001; B = 4'b0001; Cin = 0; #10;
        A = 4'b0011; B = 4'b0011; Cin = 0; #10;
        A = 4'b0101; B = 4'b0011; Cin = 0; #10;
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;
//        A = 4'b1111; B = 4'b1111; Cin = 0; #10;
//        A = 4'b1010; B = 4'b0101; Cin = 1; #10;
//        A = 4'b1100; B = 4'b0110; Cin = 1; #10;
        
        $stop;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b Cin=%b | Sum=%b Cout=%b", 
                 $time, A, B, Cin, sum, Cout);
    end
endmodule
