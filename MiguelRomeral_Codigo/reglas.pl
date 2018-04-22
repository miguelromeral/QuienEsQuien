%----------------------------------------------------
% Diseñado por: Miguel Angel Garcia Romeral
%----------------------------------------------------


%----------------------------------------------------
% insertarSeleccionablesAux([X|L]): pone X como
% seleccionable y hace los mismo con el resto
% de la lista L.
%----------------------------------------------------

% Si la lista está vacía no hacemos nada.
insertarSeleccionablesAux([]).

insertarSeleccionablesAux([X|L]):-
assertz(seleccionable(X)),
insertarSeleccionablesAux(L).

%----------------------------------------------------
% insertarSeleccionables: añade todos los personajes
% de la base de conocimiento como seleccionables.
%----------------------------------------------------

insertarSeleccionables:-
findall(X,personaje(X),L),
insertarSeleccionablesAux(L).

%----------------------------------------------------
% insertarPreguntasAux([X|L]): añade todas las preguntas
% que se puedan hacer como preguntas a realizar en
% la memoria activa.
%----------------------------------------------------

insertarPreguntasAux([]).
insertarPreguntasAux([X|L]):-
assertz(pregunta_sin_hacer(X)),
insertarPreguntasAux(L).

%----------------------------------------------------
% insertarPreguntas: añade todas las preguntas
% que se puedan hacer como preguntas a realizar.
%----------------------------------------------------

insertarPreguntas:-
findall(X,pregunta(X),L),
insertarPreguntasAux(L).

%----------------------------------------------------
% Borramos un elemento de una lista
% Fuente: http://xpasos.blogspot.com.es/2011/05/prolog-borra-elemento-de-una-lista.html
%
% borrarDeLista(Y, [Y|Xs], Zs): borra el elemento Y de
% la lista [Y|Xs] y la almacena en Zs.
%----------------------------------------------------

borrarDeLista(_, [], []).
borrarDeLista(Y, [Y|Xs], Zs):- borrarDeLista(Y, Xs, Zs), !.
borrarDeLista(X, [Y|Xs], [Y|Zs]):- borrarDeLista(X, Xs, Zs).

%----------------------------------------------------
% Hallar el enesimo elemento de una lista
% Fuente: http://jc-info.blogspot.com.es/
%
% buscar([Y|Xs], N, X): busca en la lista [Y|Xs] la
% posicion N y devuelve el elemento X.
%----------------------------------------------------

buscar([Y|_], 1, Y).
buscar([_|Xs], N, Y):-
          N2 is N - 1,
          buscar(Xs, N2, Y).

%----------------------------------------------------
% Obtiene un personaje al azar de entre todos los
% seleccionables.
%
% seleccionado(Y): genera una lista de todos los
% personajes seleccionables y busca un elemento al
% azar de dicha lista.
%----------------------------------------------------

seleccionado(Y):- 
findall(X,seleccionable(X),L),
buscarAzar(Y,L).

%----------------------------------------------------
% Buscamos un elemento al azar de una lista.
%
% buscarAzar(X, L): Obtiene el elemento de X de la
% lista L cuyo índice en dicha lista es aleatorio.
%----------------------------------------------------

buscarAzar(Elem, Lista):-
length(Lista,Long),
\+Long is 0,
T is Long + 1,
random(1,T,X),
buscar(Lista,X,Elem).

%----------------------------------------------------
% Acción que se ejecuta cuando la respuesta a la
% pregunta es falsa.
%
% accion(S,P): como la respuesta a si S (la solucion)
% a la pregunta (P) es falsa, elimina de la lista de
% seleccionables a los que la respuesta sea verdadera.
%----------------------------------------------------

accion(S,P):-
\+pregunta(S,P),
findall(X,pregunta(X,P),LCor),
assertz(pregunta_hecha(P,false)),
eliminarDeLista(LCor).

%----------------------------------------------------
% Acción que se ejecuta cuando la respuesta a la
% pregunta es correcta.
%
% accion(S,P): como la respuesta a si S (la solucion)
% a la pregunta (P) es correcta, elimina de la lista de
% seleccionables a los que la respuesta sea falsa.
%----------------------------------------------------

accion(S,P):-
pregunta(S,P),
assertz(pregunta_hecha(P,true)),
findall(X,pregunta(X,P),LCor),
findall(Y,seleccionable(Y),LTod),
subtract(LTod,LCor,LFalso),
eliminarDeLista(LFalso).

%----------------------------------------------------
% Eliminamos los elementos de la lista que recibe de
% los descartables (o seleccionables) por parte de
% accion(S,P).
%
% eliminarDeLista([X|L]): elimina X de la lista de
% seleccionables y hace lo mismo con L.
%----------------------------------------------------

eliminarDeLista([]).
eliminarDeLista([X|L]):-
eliminarDeLista(L),
seleccionable(X) ->
retract(seleccionable(X))
;
true.


%----------------------------------------------------
% Comprobamos si el juego esta resuelto.
%
% resuelto: obtiene la lista de todos los seleccionables,
% además de la solución (en forma de lista) y si
% son iguales las listas es que está resuelto.
%----------------------------------------------------

resuelto:-
findall(X,seleccionable(X),L),
findall(Y,solucion(Y),LS),
iguales(L,LS).

%----------------------------------------------------
% Determina si dos listas son iguales.
%
% iguales([X|L],[Y|M]): comprueba si X es igual a Y
% y sigue comparando las listas L y M.
%----------------------------------------------------

iguales([],[]).
iguales([X|L],[Y|M]):-
X == Y,
iguales(L,M).

%----------------------------------------------------
% Reiniciamos el juego con un personaje aleatorio.
%
% reiniciar(S): borra todos los seleccionables que
% queden, todas las preguntas sin hacer, la solucion,
% las preguntas hechas y genera un nuevo juego con
% una solucion aleatoria.
%----------------------------------------------------

reiniciar:-
retractall(seleccionable(_)),
retractall(pregunta_sin_hacer(_)),
retractall(solucion(_)),
retractall(pregunta_hecha(_,_)),
juego.

%----------------------------------------------------
% Muestra las preguntas hechas.
%
% mostrarPreguntasHechas: Muestra las preguntas hechas.
% Si no se ha hecho ninguna, se muestra un aviso.
%----------------------------------------------------

mostrarPreguntasHechas:-
assertz(pregunta_hecha(debug,true)),
retract(pregunta_hecha(debug,true)),
\+pregunta_hecha(_,_),
writeln("Aun no has hecho ninguna pregunta: \"?- preguntar.\"").

mostrarPreguntasHechas:-
assertz(pregunta_hecha(debug,true)),
retract(pregunta_hecha(debug,true)),
pregunta_hecha(_,_),
listing(pregunta_hecha).

%----------------------------------------------------
% Muestra una lista de las posibles acciones por
% parte del usuario.
%----------------------------------------------------

ayuda:-
writeln(""),
writeln("Las reglas a aplicar son:"),
writeln(""),
writeln("?- \"juego.\": Crea un juego con solución aleatoria."),
writeln("?- \"preguntar.\": Realiza una pregunta y descarta personajes."),
writeln("?- \"resuelto.\": Indica si el juego ya está resuelto."),
writeln("?- \"reiniciar.\": Reinicia el juego cuya solución será aleatoria."),
writeln("?- \"listing(seleccionable).\": Muestra la lista de personajes que aún no han sido descartados."),
writeln("?- \"listing(pregunta_sin_hacer).\": Muestra la lista de preguntas que aún no se han realizado."),
writeln("?- \"solucion(X).\": Muestra la solución al juego en la variable X."),
writeln("?- \"listing(probabilidad).\" [SOLO PARA EL MODO INTELIGENTE]: Muestra la lista de preguntas que aún no se han realizado y la probabilidad de descarte."),
writeln("?- \"mostrarPreguntasHechas.\": Muestra una lista con las preguntas realizadas junto a sus respuestas.").