library ieee;
use ieee.std_logic_1164.all;

entity vowel_counter is
  port (
    ch       : in  character;
    is_vowel : out boolean
  );
end entity;

architecture rtl of vowel_counter is
begin
  with ch select is_vowel <=
    true  when 'a' | 'e' | 'i' | 'o' | 'u' | 'A' | 'E' | 'I' | 'O' | 'U',
    false when others;
end architecture;
