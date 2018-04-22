%----------------------------------------------------
% Diseñado por: Miguel Angel Garcia Romeral
%----------------------------------------------------



%----------------------------------------------------
% Iniciamos el juego con un personaje aleatorio.
%
% juego: genera un nuevo juego cuya solucion es obtenida
% de manera aleatoria.
%----------------------------------------------------

juego:-
insertarSeleccionables,
seleccionado(Sel),
insertarPreguntas,
assertz(solucion(Sel)).

%----------------------------------------------------
% Hacemos una nueva pregunta nueva y descartamos
% los personajes de acuerdo a la respuesta en funcion
% de la solucion
%
% preguntar: busca todas las preguntas sin hacer, 
% obtiene una al azar, la elimina de perguntas por
% hacer, obtiene la solución y realiza  acción de
% acuerdo a la respuesta de la pregunta.
%----------------------------------------------------

preguntar:-
findall(E,pregunta_sin_hacer(E),L),
buscarAzar(P,L),
retract(pregunta_sin_hacer(P)),
solucion(S),
accion(S,P).

