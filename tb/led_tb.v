`default_nettype none
`timescale 100ns / 10ns

module led_tb;

    reg  [7:0]  led_data_bus;
    reg  [15:0] led_address_bus;

    wire [7:0]  led_data;
    wire [15:0] led_address;

    led dut (
        .led_data_bus(led_data_bus),
        .led_address_bus(led_address_bus),

        .led_data(led_data),
        .led_address(led_address)
    );

    initial begin
        $dumpvars(0, led_tb);
        led_address_bus = 16'h0000;
        led_data_bus    = 8'h00;   // NULL instruction
        #10

        led_address_bus = 16'h0000;
        led_data_bus    = 8'hA9;   // LDA immediate

        #10;

        led_address_bus = 16'h0001;
        led_data_bus    = 8'h42;   // operand

        #10;

        led_address_bus = 16'h0002;
        led_data_bus    = 8'h8D;   // STA absolute

        #10
        $finish;
    end

endmodule