library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 32-bit register with per-byte write enables.
entity Byte_Enable_Register is
    Port ( clk, rst_n : in STD_LOGIC;
           be   : in  STD_LOGIC_VECTOR(3 downto 0);
           din  : in  STD_LOGIC_VECTOR(31 downto 0);
           dout : out STD_LOGIC_VECTOR(31 downto 0));
end Byte_Enable_Register;

architecture Behavioral of Byte_Enable_Register is
    signal r : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            r <= (others => '0');
        elsif rising_edge(clk) then
            for i in 0 to 3 loop
                if be(i) = '1' then
                    r(8*i+7 downto 8*i) <= din(8*i+7 downto 8*i);
                end if;
            end loop;
        end if;
    end process;
    dout <= r;
end Behavioral;
