`default_nettype none

module top (

    // Data LED outputs
    output wire [7:0]  led_data,

    // Address LED outputs
    output wire [15:0] led_address

);

    // Example values for testing
    wire [7:0]  led_data_bus;
    wire [15:0] led_address_bus;

    assign led_data_bus    = 8'b1010_0101;
    assign led_address_bus = 16'b1100_0011_1010_0101;

    led led_debug (
        .led_data_bus(led_data_bus),
        .led_address_bus(led_address_bus),

        .led_data(led_data),
        .led_address(led_address)
    );

endmodule