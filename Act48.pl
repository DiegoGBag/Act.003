% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que construye un árbol binario 
%              de búsqueda a partir de una lista de enteros. Un árbol 
%              binario de búsqueda tiene la propiedad de que para cada 
%              nodo, todos los elementos en el subárbol izquierdo son 
%              menores y en el subárbol derecho son mayores.
% ===============================================

% -------- Código en Prolog --------------------
% construct(List, Tree) construye un árbol binario de búsqueda a partir de una lista de enteros.
construct([], nil).  % Un árbol vacío se construye de una lista vacía.
construct([X|Xs], T) :- 
    construct(Xs, T1),  % Construye el árbol a partir del resto de los elementos.
    add(X, T1, T).      % Añade el elemento X al árbol.

% add(X, Tree, NewTree) añade un elemento X a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).  % Si el árbol está vacío, el nuevo nodo es X.
add(X, t(Root, L, R), t(Root, NL, R)) :- 
    X < Root,              % Si X es menor que la raíz, se añade al subárbol izquierdo.
    add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- 
    X >= Root,             % Si X es mayor o igual que la raíz, se añade al subárbol derecho.
    add(X, R, NR).

% Ejemplo de uso:
% ?- construct([5, 3, 7, 2, 4, 6, 8], Tree).
% Tree = t(5, t(3, t(2, nil, nil), t(4, nil, nil)), t(7, t(6, nil, nil), t(8, nil, nil))).

% ?- construct([], Tree).
% Tree = nil.

% ?- construct([10, 5, 15, 2, 7, 12, 20], Tree).
% Tree = t(10, t(5, t(2, nil, nil), t(7, nil, nil)), t(15, t(12, nil, nil), t(20, nil, nil))).

% ?- construct([1, 2, 3, 4, 5], Tree).
% Tree = t(1, nil, t(2, nil, t(3, nil, t(4, nil, t(5, nil, nil))))).
% ----------------------------------------------
