`default_nettype none
`timescale 100ns / 10ns

module led_tb;
    reg  [1:0]  led_bus;
    reg  [7:0]  data_in;
    reg         write_enable;
    reg         chip_enable;
    wire [7:0]  data_out;

    led dut (
        .led_bus(led_bus),
        .address(address),
        .data_in(data_in),
        .write_enable(write_enable),
        .chip_enable(chip_enable),
        .data_out(data_out)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpvars(0, led_tb);

        #10;
        led_bus = 2'b01;



        #10;
        $finish;
    end

endmodule

