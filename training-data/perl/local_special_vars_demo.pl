use strict;
use warnings;

my @a = (1, 2, 3);
{
  local $, = "-";
  local $\ = "!\n";
  print @a;
}
{
  local $" = ":";
  print "@a\n";
}
print "@a\n";
