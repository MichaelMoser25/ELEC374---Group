module con_ff (
    input wire clk,         // Clock signal
    input wire reset,       // Asynchronous reset
    input wire CONin,       // Enable signal from control unit
    input wire [3:0] C2,    // 4-bit Condition field from IR<22:19>
    input wire [31:0] value,   // Value from register Ra
    output reg result          // Condition flag output
);

reg [31:0] temp; // temp variable for sign extension

always @(*) begin
	temp = {{16{value[15]}}, value[15:0]};
end


// Combinational logic to evaluate the condition
wire condition_met;
assign condition_met = ((C2[1:0] == 2'b00) && (temp == 0))  ||  // brzr: branch if zero
                       ((C2[1:0] == 2'b01) && (temp != 0))  ||  // brnz: branch if nonzero
                       ((C2[1:0] == 2'b10) && ((temp[31] == 0) && temp != 0)) || // brpl: branch if positive
                       ((C2[1:0] == 2'b11) && (temp[31] == 1));  // brmi: branch if negative

// Flip-flop to store condition when enabled
always @(*) begin
    if (reset)
        result <= 1'b0;
    else if (CONin)
        result <= condition_met;
end

endmodule
		
	