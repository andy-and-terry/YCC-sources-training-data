library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pulse_Width_Measurer is
    Port ( clk, rst_n : in  STD_LOGIC;
           sig_in     : in  STD_LOGIC;
           width      : out STD_LOGIC_VECTOR(15 downto 0);
           valid      : out STD_LOGIC);
end Pulse_Width_Measurer;

architecture Behavioral of Pulse_Width_Measurer is
    signal cnt  : unsigned(15 downto 0) := (others => '0');
    signal prev : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            cnt <= (others => '0'); prev <= '0'; valid <= '0'; width <= (others => '0');
        elsif rising_edge(clk) then
            prev <= sig_in;
            valid <= '0';
            if sig_in = '1' then
                cnt <= cnt + 1;
            elsif prev = '1' then
                width <= std_logic_vector(cnt);
                valid <= '1';
                cnt <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;
