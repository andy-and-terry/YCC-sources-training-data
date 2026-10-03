library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Interval_Timer_Countdown is
    Port ( clk         : in  STD_LOGIC;
           rst_n       : in  STD_LOGIC;
           load        : in  STD_LOGIC;
           enable      : in  STD_LOGIC;
           auto_reload : in  STD_LOGIC;
           load_value  : in  STD_LOGIC_VECTOR(15 downto 0);
           count       : out STD_LOGIC_VECTOR(15 downto 0);
           timeout     : out STD_LOGIC);
end Interval_Timer_Countdown;

architecture Behavioral of Interval_Timer_Countdown is
    signal count_reg : unsigned(15 downto 0) := (others => '0');
    signal timeout_reg : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count_reg   <= (others => '0');
            timeout_reg <= '0';
        elsif rising_edge(clk) then
            if load = '1' then
                count_reg   <= unsigned(load_value);
                timeout_reg <= '0';
            elsif enable = '1' then
                if count_reg = 0 then
                    timeout_reg <= '1';
                    if auto_reload = '1' then
                        count_reg <= unsigned(load_value);
                    else
                        count_reg <= (others => '0');
                    end if;
                else
                    timeout_reg <= '0';
                    count_reg   <= count_reg - 1;
                end if;
            else
                timeout_reg <= '0';
            end if;
        end if;
    end process;

    count   <= std_logic_vector(count_reg);
    timeout <= timeout_reg;
end Behavioral;
