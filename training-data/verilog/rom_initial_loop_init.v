module init_rom (
    input      [2:0] addr,
    output reg [7:0] data
);
    reg [7:0] mem [0:7];
    integer i;

    initial begin
        for (i = 0; i < 8; i = i + 1)
            mem[i] = i * i + 1;
    end

    always @* data = mem[addr];
endmodule

module tb;
    reg [2:0] addr;
    wire [7:0] data;
    integer i;

    init_rom dut (addr, data);

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            addr = i;
            #1 $display("mem[%0d] = %0d", addr, data);
        end
    end
endmodule
