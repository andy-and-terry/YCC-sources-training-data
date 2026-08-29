library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Generic_Shift_Register_Serial_In is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n, serial_in : in  STD_LOGIC;
           parallel_out            : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Generic_Shift_Register_Serial_In;

architecture Behavioral of Generic_Shift_Register_Serial_In is
    signal shift_reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            shift_reg <= (others => '0');
        elsif rising_edge(clk) then
            shift_reg <= shift_reg(WIDTH-2 downto 0) & serial_in;
        end if;
    end process;
    parallel_out <= shift_reg;
end Behavioral;
