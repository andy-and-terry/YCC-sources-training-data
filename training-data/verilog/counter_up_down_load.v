module updown_counter #(parameter W = 4) (
    input  wire clk, rst_n, up, load,
    input  wire [W-1:0] load_val,
    output reg  [W-1:0] count,
    output wire at_max, at_min
);
    assign at_max = &count;
    assign at_min = ~|count;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)      count <= 0;
        else if (load)   count <= load_val;
        else if (up)     count <= count + 1'b1;
        else             count <= count - 1'b1;
    end
endmodule
