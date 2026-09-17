library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Register_PISO is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n, load : in  STD_LOGIC;
           parallel_in      : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           serial_out       : out STD_LOGIC);
end Shift_Register_PISO;

architecture Behavioral of Shift_Register_PISO is
    signal shift_reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
begin
    serial_out <= shift_reg(WIDTH-1);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            shift_reg <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                shift_reg <= parallel_in;
            else
                shift_reg <= shift_reg(WIDTH-2 downto 0) & '0';
            end if;
        end if;
    end process;
end Behavioral;
