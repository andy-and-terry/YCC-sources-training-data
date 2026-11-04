| isToeplitz |
isToeplitz := [:m |
    (2 to: m size) allSatisfy: [:i |
        (2 to: (m at: i) size) allSatisfy: [:j |
            ((m at: i) at: j) = ((m at: i - 1) at: j - 1)]]].
(isToeplitz value: #(#(1 2 3) #(4 1 2) #(5 4 1))) printNl.
(isToeplitz value: #(#(1 2) #(2 2))) printNl.
