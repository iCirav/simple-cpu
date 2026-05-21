`default_nettype none `timescale 100 ns / 10 ns

module ram_tb;
    reg CLK;
    reg address;
    reg data_in;
    reg write_enable;
    reg data_out;

main dut(
    .CLK(CLK),
    .write_enable(SW2)
);

always #5 clk = ~clk;

initial begin
    $dumpvars(0, ram_tb):
    CLK = 0;
    SW2 = 0;
    write_enable = 0;
    data_in = 0;
    data_out = 0;
    address = 0;

    #0 write_enable = 1;
    #0 address = 13'h0;
    #0 data_in = 8'd50;
    #100 
end


