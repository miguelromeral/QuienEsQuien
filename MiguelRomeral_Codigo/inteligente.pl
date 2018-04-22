%----------------------------------------------------
% Diseñado por: Miguel Angel Garcia Romeral
%----------------------------------------------------


%----------------------------------------------------
% Iniciamos el juego con un personaje aleatorio.
%
% juego: genera un nuevo juego cuya solucion es obtenida
% de manera aleatoria. Además, calcula la probabilidad
% de descartes inicial.
%----------------------------------------------------

juego:-
insertarSeleccionables,
seleccionado(Sel),
insertarPreguntas,
assertz(solucion(Sel)),
calc.

%----------------------------------------------------
% Hacemos una nueva pregunta nueva y descartamos
% los personajes de acuerdo a la respuesta en funcion
% de la solucion
%
% preguntar: busca todas las preguntas sin hacer, 
% obtiene una al azar entre las que tienen mayor
% probabilidad de descarte, realiza una acción
% determinada en función de la respuesta de la
% pregunta obtenida con la solución y actualiza la
% probabilidad de cada pregunta aún sin hacer.
%----------------------------------------------------

preguntar:-
findall(X,probabilidad(X,Y),L),
list_max(Prob,L),
%probabilidad(Prob,P),
findall(Y,probabilidad(Prob,Y),Li),
length(Li,Long),
\+Long is 0,
T is Long + 1,
random(1,T,A),
buscar(Li,A,Z),
retract(probabilidad(_,Z)),
solucion(S),
accion(S,Z),
retract(pregunta_sin_hacer(Z)),
retractall(probabilidad(_,_)),
calc.


%----------------------------------------------------
% Obtenemos el valor mas alto de una lista.
% (Esta diseñado para solo comparar numeros).
% Fuente: https://xpasos.wordpress.com/2011/11/
%
% list_max(M, [X|Xs]): Encuentra en la lista [X|Xs]
% el elemento mayor, que es M.
%----------------------------------------------------

list_max(M, [X|Xs]):-
          list_max2(M, X, Xs).

%----------------------------------------------------
% Obtenemos el valor mas alto de una lista.
% (Esta diseñado para solo comparar numeros).
% Fuente: https://xpasos.wordpress.com/2011/11/
%
% list_max2(M, Z, [X|Xs]): Compara el elemento M (el
% mayor por el momento) con Z y sigue buscando el
% mayor en el resto de la lista [X|Xs].
%----------------------------------------------------

list_max2(M, M, []):- !.

list_max2(X, Y, [Z|Zs]):-
          Z >= Y,
          !,
          list_max2(X, Z, Zs).

list_max2(X, Y, [Z|Zs]):-
          Z =< Y,
          list_max2(X, Y, Zs).

%----------------------------------------------------
% Calcula la probabilidad de descarte de cada pregunta.
%
% calc: Obtiene el numero actual de personajes
% seleccionables y calcula la probabilidad de descarte
% de cada pregunta aun sin hacer.
%----------------------------------------------------

calc:-
findall(X,seleccionable(X),LP),
length(LP,Num),
findall(Y,calcular(Y,Num),_).

%----------------------------------------------------
% Calcula la probabilidad de descarte de una pregunta.
%
% calcular(Y,Num): Obtiene la propabilidad de descarte
% de la pregunta Y en funcion del numero actual de
% seleccionables (Num).
% Por la pregunta Y, obtiene una lista con los elementos
% que dan verdadero y con los elementos que dan falso,
% cada longitud es dividida entre Num y ambas
% probabilidades son multiplicados para obtener la prob.
% de quitar el mayor número uniforme de personajes.
%----------------------------------------------------

calcular(Y,Num):-
pregunta_sin_hacer(Y),
findall(X,pregunta(X,Y),L),
findall(X2,seleccionable(X2),L2),
subtract(L2,L,L3),
length(L3,S),
Rest is Num - S,
P1 is S / Num,
P2 is Rest / Num,
Prob is P1 * P2,
cambiar(Prob,Z),
assertz(probabilidad(Z,Y)).

%----------------------------------------------------
% Metodo auxiliar que elimina las probabilidades
% negativas y las pone a 0.
%
% cambiar(Prob,X): Cambia la probabilidad Prob si es
% negativa a X, sino la mantiene.
%----------------------------------------------------

cambiar(Prob,X):-
Prob < 0 -> X is 0 ; X is Prob.

