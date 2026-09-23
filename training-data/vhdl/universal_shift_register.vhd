library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Universal_Shift_Register is
    Generic ( WIDTH : integer := 4 );
    Port ( clk             : in  STD_LOGIC;
           rst_n           : in  STD_LOGIC;
           mode            : in  STD_LOGIC_VECTOR(1 downto 0); -- 00 hold, 01 shift right, 10 shift left, 11 load
           serial_in_right : in  STD_LOGIC;
           serial_in_left  : in  STD_LOGIC;
           parallel_in     : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           data_out        : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Universal_Shift_Register;

architecture Behavioral of Universal_Shift_Register is
    signal reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            case mode is
                when "00" => reg <= reg;
                when "01" => reg <= serial_in_right & reg(WIDTH-1 downto 1);
                when "10" => reg <= reg(WIDTH-2 downto 0) & serial_in_left;
                when others => reg <= parallel_in;
            end case;
        end if;
    end process;

    data_out <= reg;
end Behavioral;
