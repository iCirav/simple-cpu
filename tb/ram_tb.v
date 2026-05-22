`default_nettype none
`timescale 100ns / 10ns

module ram_tb;

    reg         CLK;
    reg  [12:0] address;
    reg  [7:0]  data_in;
    reg         write_enable;
    reg         chip_enable;
    wire [7:0]  data_out;

    ram dut (
        .CLK(CLK),
        .address(address),
        .data_in(data_in),
        .write_enable(write_enable),
        .chip_enable(chip_enable),
        .data_out(data_out)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpvars(0, ram_tb);

        CLK = 0;
        address = 13'd0;
        data_in = 8'd0;
        write_enable = 0;
        chip_enable = 0;

        // Enable RAM
        #10;
        chip_enable = 1;

        // Write decimal 50 to address 0
        #10;
        address = 13'd0;
        data_in = 8'h50;
        write_enable = 1;

        // Wait for clock edge to perform write
        #10;
        write_enable = 0;

        // Read from address 0
        #10;
        address = 13'd0;

        // Wait for clock edge to update data_out
        #10;

        $display("data_out = %d", data_out);

        #10;
        $finish;
    end

endmodule

