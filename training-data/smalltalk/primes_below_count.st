| countPrimesBelow |
countPrimesBelow := [:n | | composite count |
    composite := Array new: n withAll: false.
    count := 0.
    2 to: n - 1 do: [:i |
        (composite at: i) ifFalse: [
            count := count + 1.
            (i * i) to: n - 1 by: i do: [:j | composite at: j put: true]]].
    count].

(countPrimesBelow value: 100) printNl.
