`timescale 1ns / 1ps

module CLA_32bit_tb;
    reg [31:0] A, B;
    reg Cin;
    wire [31:0] sum;
    wire Cout;

    CLA_32bit adder (
        .A(A),
        .B(B),
        .Cin(Cin),
        .sum(sum),
        .Cout(Cout)
    );

    initial begin
        A = 32'h00000000; B = 32'h00000000; Cin = 0; #10;
        A = 32'h00000001; B = 32'h00000001; Cin = 0; #10;
        A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0; #10;
        A = 32'h12345678; B = 32'h87654321; Cin = 0; #10;
        A = 32'h00000001; B = 32'h00000001; Cin = 1; #10;
        
        A = 32'h00000000; B = 32'h00000000; Cin = 1; #10;
        A = 32'h00000001; B = 32'h00000001; Cin = 1; #10;
        A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 1; #10;
        A = 32'h12345678; B = 32'h87654321; Cin = 0; #10;
        A = 32'h80000000; B = 32'h00000001; Cin = 1; #10;
        
        $stop;
    end

endmodule