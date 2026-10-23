// Brings an asynchronous input into the clk domain through two flops
module two_flop_synchronizer (
    input  clk,
    input  rst_n,
    input  async_in,
    output sync_out
);
    reg meta, stable;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            meta   <= 1'b0;
            stable <= 1'b0;
        end else begin
            meta   <= async_in;
            stable <= meta;
        end
    end

    assign sync_out = stable;
endmodule

module tb;
    reg clk = 0, rst_n = 0, d = 0;
    wire q;

    two_flop_synchronizer dut (clk, rst_n, d, q);
    always #5 clk = ~clk;

    initial begin
        #12 rst_n = 1;
        #3  d = 1;
        #30 d = 0;
        #30 $finish;
    end

    always @(posedge clk) $display("t=%0t d=%b q=%b", $time, d, q);
endmodule
