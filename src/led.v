`default_nettype none

module led(
    // 8 bit data bus
    // 16 bit address bus
    input  wire [7:0]   led_data_bus,
    input  wire [15:0]  led_address_bus,

    // LED Data bus 
    output wire LED1_Data,
    output wire LED2_Data,
    output wire LED3_Data,
    output wire LED4_Data,
    output wire LED5_Data,
    output wire LED6_Data,
    output wire LED7_Data,
    output wire LED8_Data,

    // LED Address bus
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
    // Data bus assignments
    assign LED1_Data = led_data_bus[0];
    assign LED2_Data = led_data_bus[1];
    assign LED3_Data = led_data_bus[2];
    assign LED4_Data = led_data_bus[3];
    assign LED5_Data = led_data_bus[4];
    assign LED6_Data = led_data_bus[5];
    assign LED7_Data = led_data_bus[6];
    assign LED8_Data = led_data_bus[7];

    // Address bus assignments
    assign LED1_Address = led_address_bus[0];
    assign LED2_Address = led_address_bus[1];
    assign LED3_Address = led_address_bus[2];
    assign LED4_Address = led_address_bus[3];
    assign LED5_Address = led_address_bus[4];
    assign LED6_Address = led_address_bus[5];
    assign LED7_Address = led_address_bus[6];
    assign LED8_Address = led_address_bus[7];
    assign LED9_Address = led_address_bus[8];
    assign LED10_Address = led_address_bus[9];
    assign LED11_Address = led_address_bus[10];
    assign LED12_Address = led_address_bus[11];
    assign LED13_Address = led_address_bus[12];
    assign LED14_Address = led_address_bus[13];
    assign LED15_Address = led_address_bus[14];
    assign LED16_Address = led_address_bus[15];
endmodule