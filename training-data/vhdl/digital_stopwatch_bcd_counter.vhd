library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Digital_Stopwatch_BCD_Counter is
    Port ( clk_1hz      : in  STD_LOGIC;
           rst_n        : in  STD_LOGIC;
           enable       : in  STD_LOGIC;
           seconds_ones : out STD_LOGIC_VECTOR(3 downto 0);
           seconds_tens : out STD_LOGIC_VECTOR(3 downto 0));
end Digital_Stopwatch_BCD_Counter;

architecture Behavioral of Digital_Stopwatch_BCD_Counter is
    signal ones_reg : unsigned(3 downto 0) := (others => '0');
    signal tens_reg : unsigned(3 downto 0) := (others => '0');
begin
    process(clk_1hz, rst_n)
    begin
        if rst_n = '0' then
            ones_reg <= (others => '0');
            tens_reg <= (others => '0');
        elsif rising_edge(clk_1hz) then
            if enable = '1' then
                if ones_reg = 9 then
                    ones_reg <= (others => '0');
                    if tens_reg = 5 then
                        tens_reg <= (others => '0');
                    else
                        tens_reg <= tens_reg + 1;
                    end if;
                else
                    ones_reg <= ones_reg + 1;
                end if;
            end if;
        end if;
    end process;

    seconds_ones <= std_logic_vector(ones_reg);
    seconds_tens <= std_logic_vector(tens_reg);
end Behavioral;
