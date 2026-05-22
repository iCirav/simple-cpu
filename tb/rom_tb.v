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

        $display("\nHex Viewer:");
        $display("------------------------------------------------");

        for (i = 0; i < 2048; i = i + 1) begin

            address = i;

            // Wait for synchronous ROM read
            #10;

            // New row every 16 bytes
            if ((i % 16) == 0) begin
                if (i != 0)
                    $write("\n");

                $write("%04h: ", i);
            end

            $write("%02h ", data_out);

        end

        $write("\n");
        $display("------------------------------------------------");

        #10;
        $finish;
    end

endmodule

