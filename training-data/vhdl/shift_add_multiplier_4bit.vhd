library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Shift_Add_Multiplier_4bit is
    Port ( clk, rst_n, start          : in  STD_LOGIC;
           multiplicand, multiplier   : in  STD_LOGIC_VECTOR(3 downto 0);
           product                    : out STD_LOGIC_VECTOR(7 downto 0);
           done                       : out STD_LOGIC);
end Shift_Add_Multiplier_4bit;

architecture Behavioral of Shift_Add_Multiplier_4bit is
    signal mcand_reg : unsigned(3 downto 0) := (others => '0');
    signal acc       : unsigned(7 downto 0) := (others => '0');
    signal count     : unsigned(2 downto 0) := (others => '0');
    signal busy      : STD_LOGIC := '0';
    signal done_i    : STD_LOGIC := '0';
    signal product_i : unsigned(7 downto 0) := (others => '0');
    signal add_result : unsigned(4 downto 0);
begin
    add_result <= ('0' & acc(7 downto 4)) + mcand_reg;

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            acc <= (others => '0');
            mcand_reg <= (others => '0');
            count <= (others => '0');
            busy <= '0';
            done_i <= '0';
            product_i <= (others => '0');
        elsif rising_edge(clk) then
            if start = '1' and busy = '0' then
                mcand_reg <= unsigned(multiplicand);
                acc <= "0000" & unsigned(multiplier);
                count <= "100";
                busy <= '1';
                done_i <= '0';
            elsif busy = '1' then
                if acc(0) = '1' then
                    acc <= add_result & acc(3 downto 1);
                else
                    acc <= '0' & acc(7 downto 4) & acc(3 downto 1);
                end if;
                count <= count - 1;
                if count = "001" then
                    busy <= '0';
                    done_i <= '1';
                    if acc(0) = '1' then
                        product_i <= add_result & acc(3 downto 1);
                    else
                        product_i <= '0' & acc(7 downto 4) & acc(3 downto 1);
                    end if;
                end if;
            end if;
        end if;
    end process;

    product <= STD_LOGIC_VECTOR(product_i);
    done <= done_i;
end Behavioral;
