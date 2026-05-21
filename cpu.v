`default_nettype none

module cpu(
    input   wire            CLK,
    input   wire            reset_n,
    output  reg     [7:0]   alu_out
);

    // Memory
    reg [7:0] ram [511:0];
    reg [7:0] rom [511:0];

    // Registers
    reg [7:0] pc;
    reg [2:0] state;
    reg [7:0] instruction;
    reg [1:0] opcode;
    reg [5:0] data;

    // Flags
    reg [0:0] halt_flag;

    always @(posedge CLK) begin
        if (!reset_n & !halt_flag) begin
            pc <= 0;
            state <= 0;
            halt_flag <= 0;

        end else begin
            case (state)
                0 : begin // fetch
                    instruction <= rom[pc];
                    state <= 1;
                end

                1 : begin // decode
                    opcode <= instruction[7:6];
                    data <= instruction[5:0];

                    state <= 2;
                end

                2 : begin // execute
                    case (opcode)
                        1'b00 : pc <= pc + 1;   // NOP
                        1'b01 : pc <= data;     // JMP
                        1'b10 : halt_flag <= 1;   // Halt
                    endcase
                    state <= 0;
                end
            endcase
        end
    end
endmodule
