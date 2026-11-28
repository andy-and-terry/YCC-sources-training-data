module mandelbrot_iter_pixel (
    input  wire               clk, rst, start,
    input  wire signed [15:0] cr, ci,       // Q4.12 fixed point
    output reg  [5:0]         iters,
    output reg                done
);
    reg signed [15:0] zr, zi;
    wire signed [31:0] zr2 = zr * zr;
    wire signed [31:0] zi2 = zi * zi;
    wire signed [31:0] zrzi = zr * zi;
    reg running;

    always @(posedge clk) begin
        if (rst) begin running <= 0; done <= 0; end
        else if (start) begin zr <= 0; zi <= 0; iters <= 0; running <= 1; done <= 0; end
        else if (running) begin
            if (iters == 30 || (zr2 + zi2) > (32'sd4 <<< 24)) begin running <= 0; done <= 1; end
            else begin
                zr <= (zr2 - zi2) >>> 12 + cr;
                zi <= (zrzi >>> 11) + ci;
                iters <= iters + 1;
            end
        end
    end
endmodule
