module vowel_counter (
    input  [7:0] ch,
    output       is_vowel
);
    wire [7:0] lower = (ch >= "A" && ch <= "Z") ? ch + 8'd32 : ch;
    assign is_vowel = (lower == "a") || (lower == "e") || (lower == "i") ||
                      (lower == "o") || (lower == "u");
endmodule
