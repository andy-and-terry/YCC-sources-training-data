// Lattice path DP for a 3x3 grid, filled combinationally with generate loops.
module lattice_paths_counter (output wire [7:0] paths);
    wire [7:0] f [0:3][0:3];
    genvar r, c;
    generate
        for (r = 0; r < 4; r = r + 1) begin : rows
            for (c = 0; c < 4; c = c + 1) begin : cols
                if (r == 0 || c == 0) assign f[r][c] = 8'd1;
                else assign f[r][c] = f[r-1][c] + f[r][c-1];
            end
        end
    endgenerate
    assign paths = f[3][3];
endmodule
