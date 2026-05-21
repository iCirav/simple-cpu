`default_nettype none

//-- Template for the top entity
module top (
    input   wire        clk,
    input   wire        reset_n,
    output  reg   [7:0] alu_out
);

  // Registers
  reg [7:0] register_file [0:1];    // Two 8-bit registers
  reg [2:0] state;                  // State register for FSM 
  reg [15:0] program_counter;       // Program Counter (PC)
  reg [7:0] sp;                     // Stack Pointer (SP)
  reg [7:0] accumulator;            // Accumulator register
  reg [7:0] index_x;                // Index register X
  reg [7:0] index_y;                // Index register Y
  reg [7:0] status;                 // Status register (flags)

  always @(posedge clk) begin
    if (!reset_n) begin
      program_counter <= 16'd0;
      alu_out <= 8'd0;
    end
    
    else begin
      case (state)
        0 : alu_out <= 8'd0; // NOP

      endcase

    end
    
    
    // Increment the Program Counter
    program_counter <= program_counter + 1;

  end

  
  // assign LED1 = 1'b1;

endmodule
