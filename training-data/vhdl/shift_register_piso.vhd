library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Register_PISO is
    Port ( clk, rst_n, load : in  STD_LOGIC;
           parallel_in       : in  STD_LOGIC_VECTOR(3 downto 0);
           serial_out        : out STD_LOGIC);
end Shift_Register_PISO;

architecture Behavioral of Shift_Register_PISO is
    signal reg : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                reg <= parallel_in;
            else
                reg <= reg(2 downto 0) & '0';
            end if;
        end if;
    end process;

    serial_out <= reg(3);
end Behavioral;
