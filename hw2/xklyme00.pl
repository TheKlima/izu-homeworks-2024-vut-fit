% Zadбnн c. 44:
% Napiste program resici ukol dany predikatem u44(LIN,VOUT), kde LIN je vstupni 
% serazeny ciselny seznam s nejmene jednim prvkem a VOUT je promenna, ve ktere 
% se vraci hodnota medianu seznamu LIN.

% Testovaci predikaty:                                             % VOUT
u44_1:- u44([5,7,9,10,23],VOUT),write(VOUT).		               % 9
u44_2:- u44([1,2,3,5],VOUT),write(VOUT).     			           % 2.5
u44_3:- u44([1,2.3,4.7,9.6,10.1,12],VOUT),write(VOUT).             % 7.15
u44_r:- write('Zadej LIN: '),read(LIN),u44(LIN,VOUT),write(VOUT).

% Help predicates

list_length([], 0).
list_length([_|Tail], Length) :-
    list_length(Tail, Tail_length),
    Length is Tail_length + 1.

acess_list_element([X|_], 0, X).
acess_list_element([_|Tail], Idx, Current_element) :-
    Next_idx is Idx - 1,
    acess_list_element(Tail, Next_idx, Current_element).

% case when a list has an odd number of the elements
median(LIN, List_length, VOUT) :-
    List_length mod 2 =:= 1,
    Median_idx is (List_length - 1) // 2,
    acess_list_element(LIN, Median_idx, VOUT).

% case when a list has an even number of the elements
median(LIN, List_length, VOUT) :-
    List_length mod 2 =:= 0,
    Upper_median_idx is List_length // 2,
    Lower_median_idx is Upper_median_idx - 1,
    acess_list_element(LIN, Lower_median_idx, Lower_median),
    acess_list_element(LIN, Upper_median_idx, Upper_median),
    VOUT is (Lower_median + Upper_median) / 2.

u44(LIN, VOUT) :-
    list_length(LIN,  List_length),
    median(LIN, List_length, VOUT).
