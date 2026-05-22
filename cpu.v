`default_nettype none

module cpu(
    input   wire            CLK,
    input   wire            reset_n,
    output  reg     [7:0]   alu_out,
    output  wire            LED1,
    output  wire            LED2,
    output  wire            LED3,
    output  wire            LED4
);

    // Memory
    reg [7:0] ram [256:0];
    reg [7:0] rom [256:0];

    // Registers
    reg [7:0] pc;
    reg [2:0] state;
    reg [7:0] instruction;
    reg [1:0] opcode;
    reg [5:0] data;

    // Flags
    reg [0:0] halt_flag;

    // LED pattern
    // LED1 = CPU Running
    // LED2 = CPU Halted
    // LED3 = CPU in Reset
    // LED4 = Unused

    always @(posedge CLK) begin
        if (!reset_n) begin
            pc <= 0;
            state <= 0;
            halt_flag <= 0;
            LED1 <= 0;
            LED2 <= 0;
            LED3 <= 1;
            LED4 <= 0;

        end else begin
            if (!halt_flag) begin
                LED1 <= 1;
                LED2 <= 0;
                LED3 <= 0;
                LED4 <= 0;
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
                            2'b00 : begin
                                pc <= pc + 1;       // NOP
                                LED1 <= 1;
                            end 

                            2'b01 : pc <= data;         // JMP
                            2'b10 : halt_flag <= 1;     // Halt
                            2'b11 : pc <= 0;            // Reset PC counter for lulz
                        endcase
                        state <= 0;
                    end
                endcase
            end else begin
                LED1 <= 0;
                LED2 <= 2;
                LED3 <= 0;
                LED4 <= 0;
            end
        end
    end
endmodule
