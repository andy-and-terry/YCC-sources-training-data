library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port (a, b, cin : in std_logic; s, cout : out std_logic);
end full_adder;

architecture dataflow of full_adder is
begin
    s <= a xor b xor cin;
    cout <= (a and b) or (cin and (a xor b));
end dataflow;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    generic (N : positive := 8);
    port (a, b : in std_logic_vector(N - 1 downto 0); cin : in std_logic;
          sum : out std_logic_vector(N - 1 downto 0); cout : out std_logic);
end ripple_adder;

architecture structural of ripple_adder is
    signal c : std_logic_vector(N downto 0);
begin
    c(0) <= cin;
    gen : for i in 0 to N - 1 generate
        fa : entity work.full_adder port map (a(i), b(i), c(i), sum(i), c(i + 1));
    end generate;
    cout <= c(N);
end structural;
