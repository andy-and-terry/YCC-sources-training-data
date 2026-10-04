library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Countdown_Timer is
    generic ( WIDTH : positive := 8 );
    Port ( clk, rst_n, load, enable : in  STD_LOGIC;
           load_value : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           remaining  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           expired    : out STD_LOGIC);
end Countdown_Timer;

architecture Behavioral of Countdown_Timer is
    signal cnt : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                cnt <= unsigned(load_value);
            elsif enable = '1' and cnt /= 0 then
                cnt <= cnt - 1;
            end if;
        end if;
    end process;
    remaining <= std_logic_vector(cnt);
    expired <= '1' when cnt = 0 else '0';
end Behavioral;
