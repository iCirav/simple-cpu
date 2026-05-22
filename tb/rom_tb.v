`default_nettype none
`timescale 100ns / 10ns

module rom_tb;

    reg         CLK;
    reg  [12:0] address;
    reg         chip_enable;
    wire [7:0]  data_out;

    integer i;

    rom dut (
        .CLK(CLK),
        .address(address),
        .chip_enable(chip_enable),
        .data_out(data_out)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpvars(0, rom_tb);

        // Initialize
        CLK = 0;
        chip_enable = 1;

        for (i = 0; i < 16 ; i = i +1) begin
            address = i;
            #10;

            if ((i % 8) == 0)
                $write("\n%04h: ", i);
            $write("%02h ", data_out);

        end
        $write("\n");

        #10;
        $finish;
    end

endmodule

