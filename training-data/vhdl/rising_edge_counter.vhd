library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Rising_Edge_Counter is
    generic ( WIDTH : positive := 8 );
    Port ( clk, rst_n, clear, signal_in : in  STD_LOGIC;
           count : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Rising_Edge_Counter;

architecture Behavioral of Rising_Edge_Counter is
    signal sync_0, sync_1, prev : STD_LOGIC := '0';
    signal cnt : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            sync_0 <= '0';
            sync_1 <= '0';
            prev <= '0';
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            sync_0 <= signal_in;
            sync_1 <= sync_0;
            prev <= sync_1;
            if clear = '1' then
                cnt <= (others => '0');
            elsif sync_1 = '1' and prev = '0' then
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    count <= std_logic_vector(cnt);
end Behavioral;
