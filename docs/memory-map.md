simple-cpu Memory Map
Target FPGA: Lattice iCE40 HX1K (Nandland Go Board)
Total Embedded RAM Available: 8KB (8192 bytes)

Address Bus Width: 13-bit
Data Bus Width:    8-bit

============================================================
Memory Layout
============================================================

Address Range        Size      Type    Description
------------------------------------------------------------
0x0000 - 0x07FF      2KB       ROM     Program ROM
0x0800 - 0x1FFF      6KB       RAM     System RAM

============================================================
Detailed Layout
============================================================

ROM REGION
------------------------------------------------------------
Start Address : 0x0000
End Address   : 0x07FF
Size          : 2048 bytes

Purpose:
- Program storage
- Boot code
- Instruction fetches

Verilog:
    reg [7:0] rom [0:2047];

Address Translation:
    rom[address]

------------------------------------------------------------

RAM REGION
------------------------------------------------------------
Start Address : 0x0800
End Address   : 0x1FFF
Size          : 6144 bytes

Purpose:
- Stack
- Variables
- Buffers
- Runtime data

Verilog:
    reg [7:0] ram [0:6143];

Address Translation:
    ram[address - 13'h0800]

============================================================
Address Decoder Logic
============================================================

wire rom_select;
wire ram_select;

assign rom_select = (address < 13'h0800);

assign ram_select = (
    address >= 13'h0800 &&
    address <= 13'h1FFF
);

============================================================
System Limits
============================================================

Maximum Addressable Memory:
    8192 bytes (8KB)

Address Width Required:
    13 bits

Maximum Address:
    0x1FFF

============================================================
Future Expansion Ideas
============================================================

Possible MMIO Region Example:

0x1F00 - 0x1F0F   GPIO
0x1F10 - 0x1F1F   UART
0x1F20 - 0x1F2F   TIMER

This would reduce RAM slightly but allows
memory-mapped peripherals.

============================================================
Notes
============================================================

- ROM and RAM both consume FPGA block RAM resources.
- HX1K has limited BRAM, so avoid large framebuffers.
- Distributed LUT RAM can supplement tiny buffers/registers.
- Consider external SRAM/SDRAM later for larger systems.
- This layout is ideal for:
    * Learning CPU design
    * Tiny interpreters
    * Retro-style systems
    * Monitor ROMs
    * Small games
    * Simple operating environments

============================================================