library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Jaccard_Counts is
    Port ( a, b       : in  STD_LOGIC_VECTOR(7 downto 0);
           inter, uni : out INTEGER range 0 to 8);
end Jaccard_Counts;

architecture Behavioral of Jaccard_Counts is
begin
    process (a, b)
        variable i_cnt, u_cnt : INTEGER range 0 to 8;
    begin
        i_cnt := 0; u_cnt := 0;
        for k in 0 to 7 loop
            if a(k) = '1' and b(k) = '1' then i_cnt := i_cnt + 1; end if;
            if a(k) = '1' or  b(k) = '1' then u_cnt := u_cnt + 1; end if;
        end loop;
        inter <= i_cnt;
        uni   <= u_cnt;
    end process;
end Behavioral;
