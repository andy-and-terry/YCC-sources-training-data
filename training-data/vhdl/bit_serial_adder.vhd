library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit_serial_adder is
    Port ( clk, rst_n : in  STD_LOGIC;
           clear      : in  STD_LOGIC;
           a, b       : in  STD_LOGIC;
           sum        : out STD_LOGIC);
end bit_serial_adder;

architecture Behavioral of bit_serial_adder is
    signal carry : STD_LOGIC := '0';
begin
    -- One full adder plus a carry flip-flop: LSB-first serial addition
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            carry <= '0';
            sum <= '0';
        elsif rising_edge(clk) then
            if clear = '1' then
                carry <= '0';
                sum <= '0';
            else
                sum <= a xor b xor carry;
                carry <= (a and b) or (carry and (a xor b));
            end if;
        end if;
    end process;
end Behavioral;
