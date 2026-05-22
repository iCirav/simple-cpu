`default_nettype none

module rom (
    input wire          CLK,
    input wire  [12:0]  address,
    input wire          chip_enable,
    output reg  [7:0]   data_out
);
    // 2KB of ROM
    reg [7:0] memory [0:2047];

    integer i;

    initial begin
        for (i = 0; i < 2048; i = i + 1) begin
            memory[i] = 8'h00;
        end

        $readmemh("program.hex", memory);
    end

    always @(posedge CLK) begin
        if (chip_enable) begin
            data_out <= memory[address[10:0]];
        end
    end
endmodule
