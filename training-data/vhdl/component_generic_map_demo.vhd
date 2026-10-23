library ieee;
use ieee.std_logic_1164.all;

entity inv_vec is
    generic (WIDTH : positive := 4);
    port (
        a : in  std_logic_vector(WIDTH - 1 downto 0);
        y : out std_logic_vector(WIDTH - 1 downto 0)
    );
end entity;

architecture rtl of inv_vec is
begin
    y <= not a;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity top is
    port (
        x  : in  std_logic_vector(7 downto 0);
        nx : out std_logic_vector(7 downto 0)
    );
end entity;

architecture structural of top is
    component inv_vec is
        generic (WIDTH : positive := 4);
        port (
            a : in  std_logic_vector(WIDTH - 1 downto 0);
            y : out std_logic_vector(WIDTH - 1 downto 0)
        );
    end component;
begin
    u0 : inv_vec
        generic map (WIDTH => 8)
        port map (a => x, y => nx);
end architecture;
