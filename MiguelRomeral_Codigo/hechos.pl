%----------------------------------------------------
% Diseñado por: Miguel Angel Garcia Romeral
%----------------------------------------------------


% ------ Hechos -------------------------

% ---------------------------------------
% - genero(X,Y): Y es de genero X.
% ---------------------------------------

% - Hombres

genero(hombre, albert).
genero(hombre, paul).
genero(hombre, tom).
genero(hombre, derek).
genero(hombre, richard).
genero(hombre, louis).
genero(hombre, michael).
genero(hombre, charles).
genero(hombre, sam).
genero(hombre, steve).
genero(hombre, will).
genero(hombre, anthony).
genero(hombre, billy).
genero(hombre, henry).

% - Mujeres

genero(mujer, tiffany).
genero(mujer, natalie).
genero(mujer, roxanne).
genero(mujer, sarah).
genero(mujer, sabrina).
genero(mujer, cindy).
genero(mujer, emma).

% ---------------------------------------
% - color_de_pelo(X,Y): Y tiene el color de pelo X.
% ---------------------------------------

% - Pelo negro

color_de_pelo(negro,albert).
color_de_pelo(negro,tom).
color_de_pelo(negro,derek).
color_de_pelo(negro,richard).
color_de_pelo(negro,louis).
color_de_pelo(negro,charles).
color_de_pelo(negro,steve).
color_de_pelo(negro,henry).
color_de_pelo(negro,tiffany).
color_de_pelo(negro,sarah).
color_de_pelo(negro,sabrina).
color_de_pelo(negro,cindy).

% - Pelo rubio

color_de_pelo(rubio,paul).
color_de_pelo(rubio,michael).
color_de_pelo(rubio,sam).
color_de_pelo(rubio,will).
color_de_pelo(rubio,anthony).
color_de_pelo(rubio,billy).
color_de_pelo(rubio,natalie).
color_de_pelo(rubio,roxanne).
color_de_pelo(rubio,emma).

% ---------------------------------------
% - color_de_ropa(X,Y): Y lleva ropa de color X.
% ---------------------------------------

% - Ropa roja

color_de_ropa(roja,albert).
color_de_ropa(roja,paul).
color_de_ropa(roja,richard).
color_de_ropa(roja,louis).
color_de_ropa(roja,sam).
color_de_ropa(roja,steve).
color_de_ropa(roja,anthony).
color_de_ropa(roja,henry).
color_de_ropa(roja,natalie).
color_de_ropa(roja,sarah).
color_de_ropa(roja,cindy).

% - Ropa verde

color_de_ropa(verde,tom).
color_de_ropa(verde,derek).
color_de_ropa(verde,michael).
color_de_ropa(verde,charles).
color_de_ropa(verde,will).
color_de_ropa(verde,billy).
color_de_ropa(verde,tiffany).
color_de_ropa(verde,roxanne).
color_de_ropa(verde,sabrina).
color_de_ropa(verde,emma).

% ---------------------------------------
% - estado_de_animo(X,Y): Y tiene de estado de ánimo X.
% ---------------------------------------

% - Feliz

estado_de_animo(feliz,albert).
estado_de_animo(feliz,tom).
estado_de_animo(feliz,richard).
estado_de_animo(feliz,michael).
estado_de_animo(feliz,charles).
estado_de_animo(feliz,steve).
estado_de_animo(feliz,will).
estado_de_animo(feliz,anthony).
estado_de_animo(feliz,tiffany).
estado_de_animo(feliz,natalie).
estado_de_animo(feliz,roxanne).
estado_de_animo(feliz,sabrina).
estado_de_animo(feliz,cindy).
estado_de_animo(feliz,emma).

% - Triste

estado_de_animo(triste,paul).
estado_de_animo(triste,derek).
estado_de_animo(triste,louis).
estado_de_animo(triste,sam).
estado_de_animo(triste,billy).
estado_de_animo(triste,henry).
estado_de_animo(triste,sarah).

% ---------------------------------------
% - lleva_gafas(X): X lleva gafas.
% ---------------------------------------

lleva_gafas(albert).
lleva_gafas(michael).
lleva_gafas(charles).
lleva_gafas(anthony).
lleva_gafas(natalie).
lleva_gafas(sabrina).


% ---------------------------------------
% - color_de_ojos(X,Y): Y tiene color de ojos X.
% ---------------------------------------

% - Azules

color_de_ojos(azules,albert).
color_de_ojos(azules,richard).
color_de_ojos(azules,louis).
color_de_ojos(azules,sam).
color_de_ojos(azules,will).
color_de_ojos(azules,billy).
color_de_ojos(azules,natalie).
color_de_ojos(azules,roxanne).
color_de_ojos(azules,sabrina).

% - Marrones

color_de_ojos(marrones,paul).
color_de_ojos(marrones,tom).
color_de_ojos(marrones,derek).
color_de_ojos(marrones,michael).
color_de_ojos(marrones,charles).
color_de_ojos(marrones,steve).
color_de_ojos(marrones,anthony).
color_de_ojos(marrones,henry).
color_de_ojos(marrones,tiffany).
color_de_ojos(marrones,sarah).
color_de_ojos(marrones,cindy).
color_de_ojos(marrones,emma).

% ------------------------------------------
% pregunta(X,Y): X es la respuesta a la pregunta Y.
% ------------------------------------------


pregunta(X,esChico):-genero(hombre,X).
pregunta(X,esChica):-genero(mujer,X).
pregunta(X,llevaGafas):-lleva_gafas(X).
pregunta(X,esRubio):-color_de_pelo(rubio,X).
pregunta(X,esMoreno):-color_de_pelo(negro,X).
pregunta(X,estaFeliz):-estado_de_animo(feliz,X).
pregunta(X,estaTriste):-estado_de_animo(triste,X).
pregunta(X,ropaRoja):-color_de_ropa(roja,X).
pregunta(X,ropaVerde):-color_de_ropa(verde,X).
pregunta(X,ojosAzules):-color_de_ojos(azules,X).
pregunta(X,ojosMarrones):-color_de_ojos(marrones,X).

pregunta(esChico).
pregunta(esChica).
pregunta(llevaGafas).
pregunta(esRubio).
pregunta(esMoreno).
pregunta(estaFeliz).
pregunta(estaTriste).
pregunta(ropaRoja).
pregunta(ropaVerde).
pregunta(ojosAzules).
pregunta(ojosMarrones).

personaje(albert).
personaje(paul).
personaje(tom).
personaje(derek).
personaje(richard).
personaje(louis).
personaje(michael).
personaje(charles).
personaje(sam).
personaje(steve).
personaje(will).
personaje(anthony).
personaje(billy).
personaje(henry).
personaje(tiffany).
personaje(natalie).
personaje(roxanne).
personaje(sarah).
personaje(sabrina).
personaje(cindy).
personaje(emma).