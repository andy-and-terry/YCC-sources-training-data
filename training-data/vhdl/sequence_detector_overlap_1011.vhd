library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Shift-register based detector for "1011" with overlap allowed.
entity Seq_Detector_1011 is
    Port ( clk, rst_n, din : in STD_LOGIC;
           hit : out STD_LOGIC);
end Seq_Detector_1011;

architecture Behavioral of Seq_Detector_1011 is
    signal sh : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            sh <= "0000";
        elsif rising_edge(clk) then
            sh <= sh(2 downto 0) & din;
        end if;
    end process;
    hit <= '1' when sh = "1011" else '0';
end Behavioral;
