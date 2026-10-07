book(dune, herbert, scifi, 1965).
book(foundation, asimov, scifi, 1951).
book(neuromancer, gibson, scifi, 1984).
book(sherlock_holmes, doyle, mystery, 1887).
book(murder_orient_express, christie, mystery, 1934).
book(pride_and_prejudice, austen, romance, 1813).

by_author(Author, Titles) :- findall(Title, book(Title, Author, _, _), Titles).

by_genre(Genre, Titles) :- findall(Title, book(Title, _, Genre, _), Titles).

published_before(Year, Titles) :- findall(Title, (book(Title, _, _, Y), Y < Year), Titles).

oldest_book(Title) :-
    findall(Y-T, book(T, _, _, Y), Pairs),
    sort(Pairs, [_-Title|_]).

count_by_genre(Genre, Count) :- aggregate_all(count, book(_, _, Genre, _), Count).

:- by_genre(scifi, SciFi), writeln(SciFi).
:- by_author(asimov, Books), writeln(Books).
:- published_before(1950, Old), writeln(Old).
:- oldest_book(Title), writeln(Title).
:- count_by_genre(mystery, Count), writeln(Count).
