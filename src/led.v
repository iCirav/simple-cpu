`default_nettype none

module led(
    input   wire [1:0]  led_bus,
    output  reg         LED1,
    output  reg         LED2,
    output  reg         LED3,
    output  reg         LED4
);

    always @(*) begin
        // Initialize the LEDs
        LED1 = 1'b0;
        LED2 = 1'b0;
        LED3 = 1'b0;
        LED4 = 1'b0;

        case (led_bus)
            2'b00 : LED1 = 1'b1;
            2'b01 : LED2 = 1'b1;
            2'b10 : LED3 = 1'b1;
            2'b11 : LED4 = 1'b1;  
        endcase
    end
endmodule