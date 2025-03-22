module jump_instructions (
    input wire clock,                  // System clock
    input wire reset,                  // Reset signal
    
    // Control signals
    input wire jr_execute,             // Execute jr instruction
    input wire jal_execute,            // Execute jal instruction
    
    // Register values
    input wire [31:0] source_reg,      // Source register for jump address
    input wire [31:0] pc_current,      // Current PC value
    output reg [31:0] pc_next,         // Updated PC value
    output reg [31:0] link_reg_value   // Value to be stored in link register
);

    // Jump Register (jr) instruction logic
    // Takes the address from source register and transfers it to the PC
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            pc_next <= 32'h0;
            link_reg_value <= 32'h0;
        end
        else begin
            if (jr_execute) begin
                // Jump to the address in the source register
                pc_next <= source_reg;
            end
            else if (jal_execute) begin
                // Save return address (PC+4) for link register
                link_reg_value <= pc_current + 4;
                // Jump to the address specified
                pc_next <= source_reg;
            end
        end
    end

endmodule
