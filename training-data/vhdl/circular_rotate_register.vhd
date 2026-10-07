library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Circular_Rotate_Register is
    Generic ( WIDTH : integer := 8 );
    Port ( clk       : in  STD_LOGIC;
           rst_n     : in  STD_LOGIC;
           enable    : in  STD_LOGIC;
           rotate_left : in STD_LOGIC;
           data_out  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Circular_Rotate_Register;

architecture Behavioral of Circular_Rotate_Register is
    signal reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (0 => '1', others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            reg <= (0 => '1', others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                if rotate_left = '1' then
                    reg <= reg(WIDTH-2 downto 0) & reg(WIDTH-1);
                else
                    reg <= reg(0) & reg(WIDTH-1 downto 1);
                end if;
            end if;
        end if;
    end process;

    data_out <= reg;
end Behavioral;
