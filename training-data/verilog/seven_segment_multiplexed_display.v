module seven_segment_multiplexed_display (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] digit0,
    input  wire [3:0] digit1,
    output reg  [6:0] seg_out,
    output reg        digit_select
);

reg [15:0] refresh_counter;
reg [3:0] active_digit;

function [6:0] hex_to_seg(input [3:0] value);
    case (value)
        4'h0: hex_to_seg = 7'b1000000;
        4'h1: hex_to_seg = 7'b1111001;
        4'h2: hex_to_seg = 7'b0100100;
        4'h3: hex_to_seg = 7'b0110000;
        4'h4: hex_to_seg = 7'b0011001;
        4'h5: hex_to_seg = 7'b0010010;
        4'h6: hex_to_seg = 7'b0000010;
        4'h7: hex_to_seg = 7'b1111000;
        4'h8: hex_to_seg = 7'b0000000;
        4'h9: hex_to_seg = 7'b0010000;
        default: hex_to_seg = 7'b1111111;
    endcase
endfunction

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        refresh_counter <= 16'd0;
        digit_select    <= 1'b0;
    end else begin
        refresh_counter <= refresh_counter + 1'b1;
        if (refresh_counter == 16'd0) begin
            digit_select <= ~digit_select;
        end
    end
end

always @(*) begin
    active_digit = digit_select ? digit1 : digit0;
    seg_out = hex_to_seg(active_digit);
end

endmodule
