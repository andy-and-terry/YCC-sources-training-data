library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Arbiter_LRU is
    Generic ( NUM_REQ : integer := 4 );
    Port ( clk, rst_n : in  STD_LOGIC;
           request      : in  STD_LOGIC_VECTOR(NUM_REQ-1 downto 0);
           grant        : out STD_LOGIC_VECTOR(NUM_REQ-1 downto 0));
end Arbiter_LRU;

architecture Behavioral of Arbiter_LRU is
    type order_array is array (0 to NUM_REQ-1) of integer range 0 to NUM_REQ-1;
    signal order : order_array;
    signal grant_internal : STD_LOGIC_VECTOR(NUM_REQ-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
        variable found     : boolean;
        variable granted_id : integer range 0 to NUM_REQ-1;
        variable new_order  : order_array;
        variable k          : integer range 0 to NUM_REQ-1;
    begin
        if rst_n = '0' then
            grant_internal <= (others => '0');
            for i in 0 to NUM_REQ-1 loop
                order(i) <= i;
            end loop;
        elsif rising_edge(clk) then
            grant_internal <= (others => '0');
            found := false;
            granted_id := 0;
            for i in 0 to NUM_REQ-1 loop
                if not found and request(order(i)) = '1' then
                    granted_id := order(i);
                    found := true;
                end if;
            end loop;
            if found then
                grant_internal(granted_id) <= '1';
                k := 0;
                for j in 0 to NUM_REQ-1 loop
                    if order(j) /= granted_id then
                        new_order(k) := order(j);
                        k := k + 1;
                    end if;
                end loop;
                new_order(NUM_REQ-1) := granted_id;
                for j in 0 to NUM_REQ-1 loop
                    order(j) <= new_order(j);
                end loop;
            end if;
        end if;
    end process;
    grant <= grant_internal;
end Behavioral;
