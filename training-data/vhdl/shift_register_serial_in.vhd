library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Register_Serial_In is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst, din : in  STD_LOGIC;
           q             : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Shift_Register_Serial_In;

architecture Behavioral of Shift_Register_Serial_In is
    signal reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                reg <= (others => '0');
            else
                reg <= reg(WIDTH-2 downto 0) & din;
            end if;
        end if;
    end process;
    q <= reg;
end Behavioral;
