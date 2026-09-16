library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Priority_Arbiter_Fixed is
    Generic ( NUM_REQ : integer := 4 );
    Port ( request : in  STD_LOGIC_VECTOR(NUM_REQ-1 downto 0);
           grant   : out STD_LOGIC_VECTOR(NUM_REQ-1 downto 0));
end Priority_Arbiter_Fixed;

architecture Behavioral of Priority_Arbiter_Fixed is
begin
    process(request)
        variable granted : boolean;
        variable grant_v : STD_LOGIC_VECTOR(NUM_REQ-1 downto 0);
    begin
        granted := false;
        grant_v := (others => '0');
        for i in 0 to NUM_REQ-1 loop
            if request(i) = '1' and not granted then
                grant_v(i) := '1';
                granted := true;
            end if;
        end loop;
        grant <= grant_v;
    end process;
end Behavioral;
