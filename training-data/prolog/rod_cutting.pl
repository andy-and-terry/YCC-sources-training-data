% Rod cutting: given a price for every cut length, find the maximum
% total revenue obtainable by cutting a rod of length N into pieces.
% Prices is 1-indexed (Prices' first element is the price of length 1).
rod_cutting(_, 0, 0) :- !.
rod_cutting(Prices, Length, MaxRevenue) :-
    Length > 0,
    findall(
        Revenue,
        ( nth1(CutLen, Prices, Price),
          CutLen =< Length,
          Remaining is Length - CutLen,
          rod_cutting(Prices, Remaining, RemRevenue),
          Revenue is Price + RemRevenue
        ),
        Revenues
    ),
    max_list(Revenues, MaxRevenue).

:- rod_cutting([1, 5, 8, 9, 10, 17, 17, 20], 8, Revenue),
   writeln(Revenue).

:- rod_cutting([1, 5, 8, 9, 10, 17, 17, 20], 4, Revenue),
   writeln(Revenue).
