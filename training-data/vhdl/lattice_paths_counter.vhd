library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Lattice path counts for a 3x3 grid computed with a constant function.
entity Lattice_Paths_Counter is
    Port ( paths : out UNSIGNED(7 downto 0));
end Lattice_Paths_Counter;

architecture Behavioral of Lattice_Paths_Counter is
    type row_t is array (0 to 3) of natural;
    function lattice(n : natural) return natural is
        variable row : row_t := (others => 1);
    begin
        for k in 1 to n loop
            for j in 1 to n loop
                row(j) := row(j) + row(j - 1);
            end loop;
        end loop;
        return row(n);
    end function;
begin
    paths <= to_unsigned(lattice(3), 8);
end Behavioral;
