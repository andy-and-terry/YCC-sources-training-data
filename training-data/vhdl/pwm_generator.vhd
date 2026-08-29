library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWM_Generator is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n : in  STD_LOGIC;
           duty_cycle  : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           pwm_out     : out STD_LOGIC);
end PWM_Generator;

architecture Behavioral of PWM_Generator is
    signal counter : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            counter <= counter + 1;
        end if;
    end process;
    pwm_out <= '1' when counter < unsigned(duty_cycle) else '0';
end Behavioral;
