library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity delannoy_cell is
    generic (W : positive := 16);
    port (
        up, left, diag : in  unsigned(W - 1 downto 0);
        d_out          : out unsigned(W - 1 downto 0)
    );
end delannoy_cell;

architecture Behavioral of delannoy_cell is
begin
    d_out <= up + left + diag;
end Behavioral;
