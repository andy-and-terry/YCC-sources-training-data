library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Register is
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           serial_in: in  STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR(3 downto 0));
end Shift_Register;

architecture Behavioral of Shift_Register is
    signal reg : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process (clk, reset)
    begin
        if reset = '1' then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            reg <= reg(2 downto 0) & serial_in;
        end if;
    end process;

    data_out <= reg;
end Behavioral;
