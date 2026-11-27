| lah |
lah := [:n :k | ((n - 1) factorial / ((k - 1) factorial * (n - k) factorial)) * n factorial / k factorial].
1 to: 5 do: [:n |
    Transcript showCr: (((1 to: n) collect: [:k | lah value: n value: k]) inject: '' into: [:acc :v | acc, v printString, ' '])].
