library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR_Galois is
    Generic ( WIDTH : integer := 8;
              TAPS  : STD_LOGIC_VECTOR(7 downto 0) := X"B4" );
    Port ( clk     : in  STD_LOGIC;
           rst_n   : in  STD_LOGIC;
           enable  : in  STD_LOGIC;
           lfsr_out: out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end LFSR_Galois;

architecture Behavioral of LFSR_Galois is
    signal reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (0 => '1', others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            reg <= (0 => '1', others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                if reg(0) = '1' then
                    reg <= ('0' & reg(WIDTH-1 downto 1)) xor TAPS;
                else
                    reg <= '0' & reg(WIDTH-1 downto 1);
                end if;
            end if;
        end if;
    end process;

    lfsr_out <= reg;
end Behavioral;
