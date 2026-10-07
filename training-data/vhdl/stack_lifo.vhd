library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Stack_LIFO is
    Generic ( DEPTH : integer := 8;
              WIDTH : integer := 8 );
    Port ( clk, rst_n, push, pop : in  STD_LOGIC;
           data_in                : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           data_out               : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           full, empty            : out STD_LOGIC);
end Stack_LIFO;

architecture Behavioral of Stack_LIFO is
    type mem_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal mem : mem_array;
    signal sp  : integer range 0 to DEPTH := 0;
begin
    full  <= '1' when sp = DEPTH else '0';
    empty <= '1' when sp = 0 else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            sp <= 0;
        elsif rising_edge(clk) then
            if push = '1' and sp < DEPTH then
                mem(sp) <= data_in;
                sp <= sp + 1;
            elsif pop = '1' and sp > 0 then
                sp <= sp - 1;
            end if;
        end if;
    end process;

    data_out <= mem(sp - 1) when sp > 0 else (others => '0');
end Behavioral;
