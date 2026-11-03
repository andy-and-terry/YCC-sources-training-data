module swap_case_manual (
    input  [7:0] ch,
    output [7:0] swapped
);
    wire is_upper = (ch >= "A") && (ch <= "Z");
    wire is_lower = (ch >= "a") && (ch <= "z");
    assign swapped = is_upper ? ch + 8'd32 :
                     is_lower ? ch - 8'd32 : ch;
endmodule
