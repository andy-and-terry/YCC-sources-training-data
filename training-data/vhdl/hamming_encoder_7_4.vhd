library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Hamming_Encoder_7_4 is
    Port ( data : in  STD_LOGIC_VECTOR(3 downto 0);  -- {d4, d3, d2, d1}
           code : out STD_LOGIC_VECTOR(6 downto 0)); -- {d4, d3, d2, p3, d1, p2, p1}
end Hamming_Encoder_7_4;

architecture Behavioral of Hamming_Encoder_7_4 is
    signal d1, d2, d3, d4 : STD_LOGIC;
    signal p1, p2, p3     : STD_LOGIC;
begin
    d1 <= data(0);
    d2 <= data(1);
    d3 <= data(2);
    d4 <= data(3);

    p1 <= d1 xor d2 xor d4;
    p2 <= d1 xor d3 xor d4;
    p3 <= d2 xor d3 xor d4;

    code <= d4 & d3 & d2 & p3 & d1 & p2 & p1;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Hamming_Decoder_7_4 is
    Port ( code  : in  STD_LOGIC_VECTOR(6 downto 0); -- {d4, d3, d2, p3, d1, p2, p1}
           data  : out STD_LOGIC_VECTOR(3 downto 0); -- corrected {d4, d3, d2, d1}
           error : out STD_LOGIC);
end Hamming_Decoder_7_4;

architecture Behavioral of Hamming_Decoder_7_4 is
begin
    process(code)
        variable c1, c2, c3, c4, c5, c6, c7 : STD_LOGIC;
        variable s1, s2, s3 : STD_LOGIC;
        variable syndrome : STD_LOGIC_VECTOR(2 downto 0);
        variable corrected : STD_LOGIC_VECTOR(6 downto 0);
        variable flip_index : integer;
    begin
        c1 := code(0);
        c2 := code(1);
        c3 := code(2);
        c4 := code(3);
        c5 := code(4);
        c6 := code(5);
        c7 := code(6);

        s1 := c1 xor c3 xor c5 xor c7;
        s2 := c2 xor c3 xor c6 xor c7;
        s3 := c4 xor c5 xor c6 xor c7;
        syndrome := s3 & s2 & s1;

        corrected := code;
        if syndrome /= "000" then
            flip_index := to_integer(unsigned(syndrome)) - 1;
            corrected(flip_index) := not code(flip_index);
        end if;

        error <= '0' when syndrome = "000" else '1';
        data <= corrected(6) & corrected(5) & corrected(4) & corrected(2);
    end process;
end Behavioral;
