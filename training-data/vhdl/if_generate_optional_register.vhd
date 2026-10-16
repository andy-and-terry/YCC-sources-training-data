library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- if-generate chooses between combinational and registered output at elaboration.
entity Optional_Output_Register is
    Generic ( REGISTERED : boolean := true );
    Port ( clk : in STD_LOGIC;
           d   : in STD_LOGIC_VECTOR(7 downto 0);
           q   : out STD_LOGIC_VECTOR(7 downto 0));
end Optional_Output_Register;

architecture Behavioral of Optional_Output_Register is
begin
    g_reg : if REGISTERED generate
        process(clk)
        begin
            if rising_edge(clk) then q <= d; end if;
        end process;
    end generate;

    g_comb : if not REGISTERED generate
        q <= d;
    end generate;
end Behavioral;
