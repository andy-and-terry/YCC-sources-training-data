library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Aggregate_Others_Demo is
end Aggregate_Others_Demo;

architecture Sim of Aggregate_Others_Demo is
    type word_array is array (0 to 7) of std_logic_vector(7 downto 0);
    type int_vec is array (natural range <>) of integer;

    constant zeros   : word_array := (others => (others => '0'));
    constant seeded  : word_array := (0 => x"FF", 3 => x"A5", others => x"00");
    constant ranged  : int_vec(1 to 6) := (1 to 3 => 10, 4 | 5 => 20, others => 0);
begin
    process
        variable v : std_logic_vector(7 downto 0) := (7 => '1', 0 => '1', others => '0');
        variable sum : integer := 0;
    begin
        report "v = " & integer'image(to_integer(unsigned(v)));
        report "seeded(3) = " & integer'image(to_integer(unsigned(seeded(3))));
        report "zeros(5) is zero: " & boolean'image(zeros(5) = x"00");
        for i in ranged'range loop
            sum := sum + ranged(i);
        end loop;
        report "ranged sum = " & integer'image(sum);
        v := (others => '1');
        report "all ones = " & integer'image(to_integer(unsigned(v)));
        wait;
    end process;
end Sim;
