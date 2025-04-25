
% Relationships

parent(richard_evans,    lily_evans).
parent(mrs_evans,        lily_evans).
parent(richard_evans,    petunia_dursley).
parent(mrs_evans,        petunia_dursley).

parent(james_potter,     harry_potter).
parent(lily_evans,       harry_potter).

parent(vernon_dursley,   dudley_dursley).
parent(petunia_dursley,  dudley_dursley).

parent(arthur_weasley,   bill_weasley).
parent(molly_weasley,    bill_weasley).
parent(arthur_weasley,   charlie_weasley).
parent(molly_weasley,    charlie_weasley).
parent(arthur_weasley,   percy_weasley).
parent(molly_weasley,    percy_weasley).
parent(arthur_weasley,   fred_weasley).
parent(molly_weasley,    fred_weasley).
parent(arthur_weasley,   george_weasley).
parent(molly_weasley,    george_weasley).
parent(arthur_weasley,   ron_weasley).
parent(molly_weasley,    ron_weasley).
parent(arthur_weasley,   ginny_weasley).
parent(molly_weasley,    ginny_weasley).

male(richard_evans).
male(james_potter).
male(vernon_dursley).
male(arthur_weasley).
male(bill_weasley).
male(charlie_weasley).
male(percy_weasley).
male(fred_weasley).
male(george_weasley).
male(ron_weasley).
male(dudley_dursley).
male(harry_potter).

female(mrs_evans).
female(lily_evans).
female(petunia_dursley).
female(molly_weasley).
female(ginny_weasley).


% Derived Relationships

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).


sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.


% Recursive Logic

child(C, P) :-
    parent(P, C).

descendant(X, Y) :-
    parent(Y, X).
descendant(X, Y) :-
    parent(Y, Z),
    descendant(X, Z).


% 4. Example Queries
%
% ?- grandparent(G, harry_potter).
%    % Who are Harry’s grandparents?
%    % Expected Output: richard_evans, mrs_evans
%
% ?- sibling(ron_weasley, S).
%    % Who are Ron’s siblings?
%    % Expected Output: bill_weasley, charlie_weasley, percy_weasley, fred_weasley, george_weasley, ginny_weasley
%
% ?- cousin(harry_potter, dudley_dursley).
%    % Is Harry a cousin of Dudley?
%    % Expected Output: true
%
% ?- child(C, molly_weasley).
%    % Who are Molly’s children?
%    % Expected Output: bill_weasley, charlie_weasley, percy_weasley, fred_weasley, george_weasley, ginny_weasley, ron_weasley
%
% ?- descendant(D, arthur_weasley).
%    % List all of Arthur Weasley’s descendants.
%    % Expected Output: bill_weasley, charlie_weasley, percy_weasley, fred_weasley, george_weasley, ginny_weasley, ron_weasley
