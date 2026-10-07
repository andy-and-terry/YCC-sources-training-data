module function_task_demo (
    input wire [7:0] a,
    input wire [7:0] b,
    output reg [7:0] max_val,
    output reg [3:0] ones_in_a
);

// Function: pure combinational computation returning a value
function [7:0] max2;
    input [7:0] x;
    input [7:0] y;
    begin
        max2 = (x > y) ? x : y;
    end
endfunction

// Task: can have multiple outputs
task count_ones;
    input [7:0] value;
    output [3:0] count;
    integer k;
    begin
        count = 4'd0;
        for (k = 0; k < 8; k = k + 1)
            count = count + value[k];
    end
endtask

always @(*) begin
    max_val = max2(a, b);
    count_ones(a, ones_in_a);
end

endmodule
