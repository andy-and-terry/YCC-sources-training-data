library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Slow-rate sample chain: data shifts only when a strobe is asserted.
entity Strobed_Delay_Chain is
    Generic ( DEPTH : positive := 4; W : positive := 8 );
    Port ( clk, strobe : in STD_LOGIC;
           din  : in  STD_LOGIC_VECTOR(W-1 downto 0);
           dout : out STD_LOGIC_VECTOR(W-1 downto 0));
end Strobed_Delay_Chain;

architecture Behavioral of Strobed_Delay_Chain is
    type chain_t is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(W-1 downto 0);
    signal chain : chain_t := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) and strobe = '1' then
            chain(0) <= din;
            for i in 1 to DEPTH-1 loop
                chain(i) <= chain(i-1);
            end loop;
        end if;
    end process;
    dout <= chain(DEPTH-1);
end Behavioral;
