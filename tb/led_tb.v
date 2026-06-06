`default_nettype none
`timescale 100ns / 10ns

module led_tb;

    reg  [7:0]  led_data_bus;
    reg  [15:0] led_address_bus;

    wire LED1_Data;
    wire LED2_Data;
    wire LED3_Data;
    wire LED4_Data;
    wire LED5_Data;
    wire LED6_Data;
    wire LED7_Data;
    wire LED8_Data;

    wire LED1_Address;
    wire LED2_Address;
    wire LED3_Address;
    wire LED4_Address;
    wire LED5_Address;
    wire LED6_Address;
    wire LED7_Address;
    wire LED8_Address;
    wire LED9_Address;
    wire LED10_Address;
    wire LED11_Address;
    wire LED12_Address;
    wire LED13_Address;
    wire LED14_Address;
    wire LED15_Address;
    wire LED16_Address;

    led dut (
        .led_data_bus(led_data_bus),
        .led_address_bus(led_address_bus),

        .LED1_Data(LED1_Data),
        .LED2_Data(LED2_Data),
        .LED3_Data(LED3_Data),
        .LED4_Data(LED4_Data),
        .LED5_Data(LED5_Data),
        .LED6_Data(LED6_Data),
        .LED7_Data(LED7_Data),
        .LED8_Data(LED8_Data),

        .LED1_Address(LED1_Address),
        .LED2_Address(LED2_Address),
        .LED3_Address(LED3_Address),
        .LED4_Address(LED4_Address),
        .LED5_Address(LED5_Address),
        .LED6_Address(LED6_Address),
        .LED7_Address(LED7_Address),
        .LED8_Address(LED8_Address),
        .LED9_Address(LED9_Address),
        .LED10_Address(LED10_Address),
        .LED11_Address(LED11_Address),
        .LED12_Address(LED12_Address),
        .LED13_Address(LED13_Address),
        .LED14_Address(LED14_Address),
        .LED15_Address(LED15_Address),
        .LED16_Address(LED16_Address)
    );

    initial begin
        $dumpvars(0, led_tb);

        led_data_bus    = 8'b00000000;
        led_address_bus = 16'b0000000000000000;
        #10;

        led_data_bus    = 8'b10101010;
        led_address_bus = 16'b0000000011111111;
        #10;

        led_data_bus    = 8'b01010101;
        led_address_bus = 16'b1111111100000000;
        #10;

        led_data_bus    = 8'b11111111;
        led_address_bus = 16'b1010101010101010;
        #10;

        led_data_bus    = 8'b00000001;
        led_address_bus = 16'b0000000000000001;
        #10;

        led_data_bus    = 8'b10000000;
        led_address_bus = 16'b1000000000000000;
        #10;

        $finish;
    end

endmodule