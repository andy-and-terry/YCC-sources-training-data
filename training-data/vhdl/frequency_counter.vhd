library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Counts rising edges of an input during a fixed gate window.
entity Frequency_Counter is
    Generic ( GATE_CYCLES : positive := 1000 );
    Port ( clk, rst_n : in  STD_LOGIC;
           sig_in     : in  STD_LOGIC;
           freq_count : out unsigned(15 downto 0));
end Frequency_Counter;

architecture Behavioral of Frequency_Counter is
    signal gate_cnt : integer range 0 to GATE_CYCLES-1 := 0;
    signal edges    : unsigned(15 downto 0) := (others => '0');
    signal sync     : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            gate_cnt <= 0; edges <= (others => '0'); sync <= "000"; freq_count <= (others => '0');
        elsif rising_edge(clk) then
            sync <= sync(1 downto 0) & sig_in;
            if sync(2 downto 1) = "01" then
                edges <= edges + 1;
            end if;
            if gate_cnt = GATE_CYCLES-1 then
                gate_cnt <= 0;
                freq_count <= edges;
                edges <= (others => '0');
            else
                gate_cnt <= gate_cnt + 1;
            end if;
        end if;
    end process;
end Behavioral;
