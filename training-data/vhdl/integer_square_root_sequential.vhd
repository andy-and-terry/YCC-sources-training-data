library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Bit-by-bit non-restoring style integer square root of a 16-bit value.
entity Integer_Sqrt is
    Port ( clk, rst_n, start : in STD_LOGIC;
           value : in  unsigned(15 downto 0);
           root  : out unsigned(7 downto 0);
           done  : out STD_LOGIC);
end Integer_Sqrt;

architecture Behavioral of Integer_Sqrt is
    type state_t is (IDLE, RUN, FINISH);
    signal st : state_t := IDLE;
    signal rem_r, res, bit_r : unsigned(15 downto 0);
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            st <= IDLE; done <= '0'; root <= (others => '0');
        elsif rising_edge(clk) then
            done <= '0';
            case st is
                when IDLE =>
                    if start = '1' then
                        rem_r <= value; res <= (others => '0');
                        bit_r <= x"4000"; st <= RUN;
                    end if;
                when RUN =>
                    if bit_r = 0 then
                        st <= FINISH;
                    else
                        if rem_r >= res + bit_r then
                            rem_r <= rem_r - (res + bit_r);
                            res <= shift_right(res, 1) + bit_r;
                        else
                            res <= shift_right(res, 1);
                        end if;
                        bit_r <= shift_right(bit_r, 2);
                    end if;
                when FINISH =>
                    root <= res(7 downto 0); done <= '1'; st <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
