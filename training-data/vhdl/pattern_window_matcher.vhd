library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pattern_Window_Matcher is
    generic ( WIDTH : positive := 8 );
    Port ( clk, rst_n, valid : in  STD_LOGIC;
           data_in, pattern, mask : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           match       : out STD_LOGIC;
           match_count : out STD_LOGIC_VECTOR(15 downto 0));
end Pattern_Window_Matcher;

architecture Behavioral of Pattern_Window_Matcher is
    signal hit : STD_LOGIC;
    signal match_r : STD_LOGIC := '0';
    signal cnt : unsigned(15 downto 0) := (others => '0');
begin
    hit <= '1' when ((data_in xor pattern) and mask) = (WIDTH-1 downto 0 => '0') else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            match_r <= '0';
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            match_r <= valid and hit;
            if valid = '1' and hit = '1' then
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    match <= match_r;
    match_count <= std_logic_vector(cnt);
end Behavioral;
