library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity countdown_timer is
    generic ( WIDTH : positive := 8 );
    port ( clk, rst_n, load : in  std_logic;
           load_value       : in  unsigned(WIDTH-1 downto 0);
           remaining        : out unsigned(WIDTH-1 downto 0);
           expired          : out std_logic );
end countdown_timer;

architecture Behavioral of countdown_timer is
    signal count : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                count <= load_value;
            elsif count /= 0 then
                count <= count - 1;
            end if;
        end if;
    end process;
    remaining <= count;
    expired <= '1' when count = 0 else '0';
end Behavioral;
