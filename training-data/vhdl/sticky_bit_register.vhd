library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Each bit latches high on an event and stays set until explicitly cleared.
entity Sticky_Bit_Register is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n : in  STD_LOGIC;
           events     : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           clear      : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           status     : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Sticky_Bit_Register;

architecture Behavioral of Sticky_Bit_Register is
    signal q : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            q <= (others => '0');
        elsif rising_edge(clk) then
            q <= (q or events) and not clear;
        end if;
    end process;
    status <= q;
end Behavioral;
