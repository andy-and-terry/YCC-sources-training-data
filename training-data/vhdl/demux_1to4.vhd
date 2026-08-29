library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1to4 is
    Port ( data_in  : in  STD_LOGIC;
           sel       : in  STD_LOGIC_VECTOR(1 downto 0);
           data_out : out STD_LOGIC_VECTOR(3 downto 0));
end Demux_1to4;

architecture Behavioral of Demux_1to4 is
begin
    process(data_in, sel)
    begin
        data_out <= "0000";
        case sel is
            when "00" => data_out(0) <= data_in;
            when "01" => data_out(1) <= data_in;
            when "10" => data_out(2) <= data_in;
            when others => data_out(3) <= data_in;
        end case;
    end process;
end Behavioral;
