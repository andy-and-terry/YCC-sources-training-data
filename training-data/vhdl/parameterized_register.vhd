library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Parameterized_Register is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n, enable : in  STD_LOGIC;
           d                    : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           q                    : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Parameterized_Register;

architecture Behavioral of Parameterized_Register is
    signal q_internal : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            q_internal <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                q_internal <= d;
            end if;
        end if;
    end process;
    q <= q_internal;
end Behavioral;
