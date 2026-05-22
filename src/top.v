`default_nettype none

module top (
    input  wire CLK,
    input  wire reset_n,

    input  wire SW1,
    input  wire SW2,
    input  wire SW3,
    input  wire SW4,

    input  wire RX,
    output wire TX,

    output wire LED1,
    output wire LED2,
    output wire LED3,
    output wire LED4
);

    wire [1:0] led_bus;

    // UART idle
    assign TX = 1'b1;

    // Example LED pattern
    assign led_bus = 2'b10;

    led my_led (
        .led_bus(led_bus),
        .LED1(LED1),
        .LED2(LED2),
        .LED3(LED3),
        .LED4(LED4)
    );

endmodule