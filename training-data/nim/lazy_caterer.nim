proc pieces(cuts: int): int = (cuts * cuts + cuts + 2) div 2

for n in 0 .. 9: stdout.write pieces(n), " "
echo "" # 1 2 4 7 11 16 22 29 37 46
