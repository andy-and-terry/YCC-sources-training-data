module interval_timer_countdown (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        load,
    input  wire        enable,
    input  wire        auto_reload,
    input  wire [15:0] load_value,
    output reg  [15:0] count,
    output reg         timeout
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count   <= 16'd0;
        timeout <= 1'b0;
    end else if (load) begin
        count   <= load_value;
        timeout <= 1'b0;
    end else if (enable) begin
        if (count == 16'd0) begin
            timeout <= 1'b1;
            count   <= auto_reload ? load_value : 16'd0;
        end else begin
            timeout <= 1'b0;
            count   <= count - 1'b1;
        end
    end else begin
        timeout <= 1'b0;
    end
end

endmodule
