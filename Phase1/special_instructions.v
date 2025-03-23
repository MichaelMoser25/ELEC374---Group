// MIPS MFHI and MFLO Implementation
// This module implements the control sequences for MFHI R3 and MFLO R2 instructions

// The mfhi and mflo instructions in MIPS are designed to access the special HI and LO registers that are used for multiplication and division operations.

//MFHI (Move From HI):
// Copies the contents of the special HI register to a general-purpose register
// Format: mfhi Rd (where Rd is the destination register)
//  mfhi R3 moves the contents of HI to register R3

//MFLO (Move From LO):
// Copies the contents of the special LO register to a general-purpose register
// Format: mflo Rd (where Rd is the destination register)
//  mflo R2 moves the contents of LO to register R2

module mips_mfhi_mflo (
    input wire clk,
    input wire reset,
    output wire [31:0] result_mfhi,
    output wire [31:0] result_mflo
);

    // Register file
    reg [31:0] registers [0:31];  // 32 general purpose registers
    reg [31:0] HI;                // Special HI register
    reg [31:0] LO;                // Special LO register
    
    // Control signals
    reg [5:0] state;
    reg [5:0] next_state;
    
    // State definitions
    localparam INIT = 6'd0;
    localparam FETCH = 6'd1;
    localparam DECODE = 6'd2;
    localparam MFHI_EXEC = 6'd3;
    localparam MFLO_EXEC = 6'd4;
    localparam WRITEBACK = 6'd5;
    
    // Instruction format
    reg [31:0] instruction;
    wire [5:0] opcode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] funct;
    
    // Instruction parsing
    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign shamt = instruction[10:6];
    assign funct = instruction[5:0];
    
    // Opcode and function definitions
    localparam R_TYPE = 6'b000000;
    localparam FUNCT_MFHI = 6'b010000; // 0x10
    localparam FUNCT_MFLO = 6'b010010; // 0x12
    
    // Output assignments
    assign result_mfhi = registers[3]; // R3 for MFHI result
    assign result_mflo = registers[2]; // R2 for MFLO result
    
    // State machine for control sequence
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= INIT;
        end else begin
            state <= next_state;
        end
    end
    
    // Next state logic
    always @(*) begin
        case (state)
            INIT: begin
                next_state = FETCH;
            end
            FETCH: begin
                next_state = DECODE;
            end
            DECODE: begin
                if (opcode == R_TYPE) begin
                    if (funct == FUNCT_MFHI)
                        next_state = MFHI_EXEC;
                    else if (funct == FUNCT_MFLO)
                        next_state = MFLO_EXEC;
                    else
                        next_state = FETCH;
                end
                else begin
                    next_state = FETCH;
                end
            end
            MFHI_EXEC, MFLO_EXEC: begin
                next_state = WRITEBACK;
            end
            WRITEBACK: begin
                next_state = FETCH;
            end
            default: begin
                next_state = INIT;
            end
        endcase
    end
    
    // State actions
    always @(posedge clk) begin
        case (state)
            INIT: begin
                // Initialize registers
                registers[0] <= 32'h00000000; // $zero
                registers[2] <= 32'h00000000; // R2
                registers[3] <= 32'h00000000; // R3
                HI <= 32'h12345678;          // Preload HI register
                LO <= 32'h87654321;          // Preload LO register
                instruction <= 32'h00000000;
            end
            
            FETCH: begin
                // Fetch instruction - simulate fetching either MFHI R3 or MFLO R2
                if (instruction == 32'h00000000) 
                    instruction <= {R_TYPE, 15'b0, 5'd3, 5'b0, FUNCT_MFHI}; // MFHI $3
                else
                    instruction <= {R_TYPE, 15'b0, 5'd2, 5'b0, FUNCT_MFLO}; // MFLO $2
            end
            
            DECODE: begin
                // Decoding happens in next state logic
            end
            
            MFHI_EXEC: begin
                // Execute MFHI - move HI register to destination register (rd)
                // move to R3
                registers[3] <= HI;
            end
            
            MFLO_EXEC: begin
                // Execute MFLO - move LO register to destination register (rd)
                // move to R2
                registers[2] <= LO;
            end
            
            WRITEBACK: begin
                // Nothing to do in writeback as register has already been updated
            end
            
            default: begin
                // Do nothing
            end
        endcase
    end

endmodule



/*
Initial States:
At time 5, both R3 and R2 are initialized to 0x00000000
The HI register was preloaded with 0x12345678
The LO register was preloaded with 0x87654321
*/

/*
MFHI Execution (States 1-5):
At time 35, State 3 represents MFHI_EXEC state
At time 45, State 5 is WRITEBACK
At this point, R3 has changed from 0x00000000 to 0x12345678
This confirms that the content of HI register was successfully moved to R3
*/

/*
MFLO Execution (States 55-85):
At time 75, State 4 represents MFLO_EXEC state
At time 85, State 5 is WRITEBACK
At this point, R2 has changed from 0x00000000 to 0x87654321
This confirms that the content of LO register was successfully moved to R2
*/

/*
Verification:
R3 contains 0x12345678 (value from HI)
R2 contains 0x87654321 (value from LO)
*/

/* CONTROL SEQUENCE
MFHI R3:
FETCH → DECODE → MFHI_EXEC → WRITEBACK
States 1 → 2 → 3 → 5

MFLO R2:
FETCH → DECODE → MFLO_EXEC → WRITEBACK
States 1 → 2 → 4 → 5
*/
