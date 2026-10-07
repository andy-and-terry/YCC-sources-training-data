library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit_Stuffer is
    Port ( clk, rst_n, in_bit, in_valid : in  STD_LOGIC;
           out_bit, out_valid           : out STD_LOGIC;
           stalled                      : out STD_LOGIC);
end Bit_Stuffer;

architecture Behavioral of Bit_Stuffer is
    signal ones         : integer range 0 to 5 := 0;
    signal pending_zero : STD_LOGIC := '0';
begin
    -- HDLC-style stuffing: after five consecutive 1s insert a 0
    stalled <= pending_zero;

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            ones <= 0;
            pending_zero <= '0';
            out_bit <= '0';
            out_valid <= '0';
        elsif rising_edge(clk) then
            if pending_zero = '1' then
                out_bit <= '0';
                out_valid <= '1';
                pending_zero <= '0';
                ones <= 0;
            elsif in_valid = '1' then
                out_bit <= in_bit;
                out_valid <= '1';
                if in_bit = '1' then
                    if ones = 4 then
                        pending_zero <= '1';
                        ones <= 5;
                    else
                        ones <= ones + 1;
                    end if;
                else
                    ones <= 0;
                end if;
            else
                out_valid <= '0';
            end if;
        end if;
    end process;
end Behavioral;
