module con_ff (
    input wire clk,         // Clock signal
    input wire reset,       // Asynchronous reset
    input wire CONin,       // Enable signal from control unit
    input wire [3:0] C2,    // 4-bit Condition field from IR<22:19>
    input wire [31:0] value,   // Value from register Ra
    output reg result          // Condition flag output
);

// Combinational logic to evaluate the condition
wire condition_met;
assign condition_met = ((C2[1:0] == 2'b00) && (value == 0))  ||  // brzr: branch if zero
                       ((C2[1:0] == 2'b01) && (value != 0))  ||  // brnz: branch if nonzero
                       ((C2[1:0] == 2'b10) && ((value[31] == 0) && value != 0)) || // brpl: branch if positive
                       ((C2[1:0] == 2'b11) && (value[31] == 1));  // brmi: branch if negative

// Flip-flop to store condition when enabled
always @(posedge clk or posedge reset) begin
    if (reset)
        result <= 1'b0;
    else if (CONin)
        result <= condition_met;
end

endmodule
		
	