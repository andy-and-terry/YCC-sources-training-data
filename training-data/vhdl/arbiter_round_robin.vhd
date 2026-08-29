library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Arbiter_Round_Robin is
    Generic ( NUM_REQ : integer := 4 );
    Port ( clk, rst_n : in  STD_LOGIC;
           request      : in  STD_LOGIC_VECTOR(NUM_REQ-1 downto 0);
           grant        : out STD_LOGIC_VECTOR(NUM_REQ-1 downto 0));
end Arbiter_Round_Robin;

architecture Behavioral of Arbiter_Round_Robin is
    signal pointer : integer range 0 to NUM_REQ-1 := 0;
    signal grant_internal : STD_LOGIC_VECTOR(NUM_REQ-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
        variable idx : integer;
        variable found : boolean;
    begin
        if rst_n = '0' then
            pointer <= 0;
            grant_internal <= (others => '0');
        elsif rising_edge(clk) then
            grant_internal <= (others => '0');
            found := false;
            for i in 0 to NUM_REQ-1 loop
                if not found then
                    idx := (pointer + i) mod NUM_REQ;
                    if request(idx) = '1' then
                        grant_internal(idx) <= '1';
                        pointer <= (idx + 1) mod NUM_REQ;
                        found := true;
                    end if;
                end if;
            end loop;
        end if;
    end process;
    grant <= grant_internal;
end Behavioral;
