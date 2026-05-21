`default_nettype none

module ram (
    input wire CLK,
    input wire [12:0] address,
    input wire [7:0] data_in,
    input wire write_enable,
    input wire chip_enable,
    output reg [7:0] data_out
);

    // 8kb of RAM
    reg [7:0] memory [0:8191];

    always @(posedge CLK) begin
        if (chip_enable) begin
            if (write_enable)
                memory[address] <= data_in; 
        
            data_out <= memory[address];
        end
    end
endmodule

