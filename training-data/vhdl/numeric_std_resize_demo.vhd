library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity numeric_std_resize_demo is
    port (
        u_in    : in  unsigned(3 downto 0);
        s_in    : in  signed(3 downto 0);
        u_wide  : out unsigned(7 downto 0);
        s_wide  : out signed(7 downto 0);
        s_trunc : out signed(1 downto 0)
    );
end entity;

architecture rtl of numeric_std_resize_demo is
begin
    -- unsigned is zero-extended, signed is sign-extended
    u_wide  <= resize(u_in, 8);
    s_wide  <= resize(s_in, 8);
    -- narrowing keeps the sign bit and the low bits
    s_trunc <= resize(s_in, 2);
end architecture;
