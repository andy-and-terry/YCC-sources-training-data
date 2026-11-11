\ Every value appears twice except one; XOR of everything is the odd one
: single ( n1 n2 n3 n4 n5 -- x ) xor xor xor xor ;

4 1 2 1 2 single . cr   \ 4
