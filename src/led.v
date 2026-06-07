`default_nettype none

module led (
    input  wire [7:0]  led_data_bus,
    input  wire [15:0] led_address_bus,

    output wire [7:0]  led_data,
    output wire [15:0] led_address
);

    assign led_data    = led_data_bus;
    assign led_address = led_address_bus;

endmodule