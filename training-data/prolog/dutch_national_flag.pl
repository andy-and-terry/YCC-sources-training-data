% Dutch national flag partitioning: split a list of 0/1/2 values into
% three groups and recombine them in sorted order, three-way quicksort
% style without ever comparing two elements of the same bucket.
partition3([], [], [], []).
partition3([0|T], [0|Zeros], Ones, Twos) :- !, partition3(T, Zeros, Ones, Twos).
partition3([1|T], Zeros, [1|Ones], Twos) :- !, partition3(T, Zeros, Ones, Twos).
partition3([2|T], Zeros, Ones, [2|Twos]) :- partition3(T, Zeros, Ones, Twos).

dutch_flag_sort(List, Sorted) :-
    partition3(List, Zeros, Ones, Twos),
    append(Zeros, Ones, Front),
    append(Front, Twos, Sorted).

:- dutch_flag_sort([2, 0, 1, 2, 1, 0, 0, 2, 1], Sorted), writeln(Sorted).
