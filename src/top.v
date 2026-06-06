`default_nettype none

module top (
    output wire LED1_Data,
    output wire LED2_Data,
    output wire LED3_Data,
    output wire LED4_Data,
    output wire LED5_Data,
    output wire LED6_Data,
    output wire LED7_Data,
    output wire LED8_Data,

    output wire LED1_Address,
    output wire LED2_Address,
    output wire LED3_Address,
    output wire LED4_Address,
    output wire LED5_Address,
    output wire LED6_Address,
    output wire LED7_Address,
    output wire LED8_Address,
    output wire LED9_Address,
    output wire LED10_Address,
    output wire LED11_Address,
    output wire LED12_Address,
    output wire LED13_Address,
    output wire LED14_Address,
    output wire LED15_Address,
    output wire LED16_Address
);

    wire [7:0]  led_data_bus;
    wire [15:0] led_address_bus;

    assign led_data_bus    = 8'b1010_0101;
    assign led_address_bus = 16'b1100_0011_1010_0101;

    led led_debug (
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

endmodule