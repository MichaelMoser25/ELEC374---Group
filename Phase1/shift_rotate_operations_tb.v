`timescale 1ns / 1ps
	module sr_tb;
	//shift right
	reg [31:0] din;
	reg [31:0] shift;
	wire [31:0] dout;

	shift_right s_right (
			.data_in(din),
			.shift_val(shift),
			.data_out(dout)
	);
	 


    initial begin
        // Test cases
		din = 32'h08888888; shift = 32'd2; #10
       
        $stop;
    end


endmodule
