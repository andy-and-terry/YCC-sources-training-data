library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Generates two non-overlapping clock phases from a divide-by-4 sequence.
entity Two_Phase_Clock_Generator is
    Port ( clk, rst_n : in  STD_LOGIC;
           phi1, phi2 : out STD_LOGIC);
end Two_Phase_Clock_Generator;

architecture Behavioral of Two_Phase_Clock_Generator is
    type phase_t is (P1, GAP1, P2, GAP2);
    signal phase : phase_t := P1;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            phase <= P1;
        elsif rising_edge(clk) then
            case phase is
                when P1   => phase <= GAP1;
                when GAP1 => phase <= P2;
                when P2   => phase <= GAP2;
                when GAP2 => phase <= P1;
            end case;
        end if;
    end process;
    phi1 <= '1' when phase = P1 else '0';
    phi2 <= '1' when phase = P2 else '0';
end Behavioral;
