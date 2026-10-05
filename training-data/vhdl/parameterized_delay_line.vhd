library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Parameterized_Delay_Line is
    Generic ( WIDTH : integer := 8;
              DELAY : integer := 4 );
    Port ( clk  : in  STD_LOGIC;
           en   : in  STD_LOGIC;
           din  : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           dout : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Parameterized_Delay_Line;

architecture Behavioral of Parameterized_Delay_Line is
    type pipe_t is array (0 to DELAY-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal pipe : pipe_t := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                pipe(0) <= din;
                for i in 1 to DELAY-1 loop
                    pipe(i) <= pipe(i-1);
                end loop;
            end if;
        end if;
    end process;
    dout <= pipe(DELAY-1);
end Behavioral;
