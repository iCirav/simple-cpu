`default_nettype none
`include "ram.v"

//-- Template for the top entity
module top (
    input   wire        clk,
    input   wire        reset_n,
    input   wire [7:0]  data_in,
    output  wire [12:0] address,
    output  wire [7:0]  data_out,
    output  reg  [7:0]  alu_out,
    output  wire        write_enable,
    output  wire        chip_enable
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

  // Internal buses
  wire [7:0]  instruction   = address[program_counter];
  wire [2:0]  opcode        = instruction[7:5];
  wire        reg_dest      = instruction[5];
  wire        reg_source    = instruction[6];
  wire [7:0]  immediate     ={4'b0000, instruction[3:0]};

  always @(posedge clk) begin
    if (!reset_n) begin
      program_counter  <= 0;
      register_file[0] <= 0;
      register_file[1] <= 0;
      alu_out          <= 0;
      state            <= 0;
      write_enable      <= 0;
      chip_enable       <= 0;
      address           <= 0;
    end
    
    else begin
      case (state)
        0 : begin // fetch  
          chip_enable <=1;
          state <= 1;

        end

        1 : begin // decode
          case (opcode)
            3'b000: alu_out <= opcode;                                              // NOP
            3'b001: alu_out <= register_file[reg_dest] + register_file[reg_source]; // ADD
            3'b010: alu_out <= register_file[reg_dest] - register_file[reg_source]; // SUB
            3'b011: alu_out <= register_file[reg_dest] & register_file[reg_source]; // AND
            3'b100: alu_out <= register_file[reg_dest] | register_file[reg_source]; // OR
            3'b101: alu_out <= register_file[reg_dest] ^ register_file[reg_source]; // XOR
            3'b110: alu_out <= immediate; // LOAD0(Imm)
            3'b111: alu_out <= immediate; // LOAD1(Imm)
          endcase
          state <= 2;

        end
        2 : begin // execute

          state <= 0;
        
        end

      endcase

    end
    
    
    // Increment the Program Counter
    program_counter <= program_counter + 1;

  end

  
  // assign LED1 = 1'b1;

endmodule
