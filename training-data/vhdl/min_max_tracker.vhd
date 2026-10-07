library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Min_Max_Tracker is
    generic ( WIDTH : positive := 8 );
    Port ( clk, rst_n, clear, valid : in  STD_LOGIC;
           sample    : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           min_value : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           max_value : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           seen_any  : out STD_LOGIC);
end Min_Max_Tracker;

architecture Behavioral of Min_Max_Tracker is
    signal min_r : unsigned(WIDTH-1 downto 0) := (others => '1');
    signal max_r : unsigned(WIDTH-1 downto 0) := (others => '0');
    signal seen  : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            min_r <= (others => '1');
            max_r <= (others => '0');
            seen <= '0';
        elsif rising_edge(clk) then
            if clear = '1' then
                min_r <= (others => '1');
                max_r <= (others => '0');
                seen <= '0';
            elsif valid = '1' then
                seen <= '1';
                if unsigned(sample) < min_r then
                    min_r <= unsigned(sample);
                end if;
                if unsigned(sample) > max_r then
                    max_r <= unsigned(sample);
                end if;
            end if;
        end if;
    end process;
    min_value <= std_logic_vector(min_r);
    max_value <= std_logic_vector(max_r);
    seen_any <= seen;
end Behavioral;
