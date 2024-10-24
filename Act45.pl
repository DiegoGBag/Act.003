% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que verifica si un término 
%              dado representa un árbol binario. 
%              Un árbol binario está compuesto por un nodo raíz 
%              y dos subárboles.
% ===============================================

% -------- Código en Prolog --------------------
% istree(Term) verifica si el término dado es un árbol binario.
istree(nil).  % Caso base: un árbol vacío es un árbol binario.
istree(t(_, L, R)) :-  % Caso recursivo: un nodo raíz con subárboles izquierdo y derecho.
    istree(L),  % Verifica si el subárbol izquierdo es un árbol binario.
    istree(R).  % Verifica si el subárbol derecho es un árbol binario.

% Ejemplo de uso:
% ?- istree(t(a, t(b, nil, nil), t(c, nil, nil))).
% true.
% ?- istree(t(a, t(b, nil, nil), nil)).
% true.
% ?- istree(t(a, t(b, nil, nil), t(c, t(d, nil, nil), nil))).
% true.
% ?- istree(t(a, t(b, nil, nil), c)).
% false. (c no es un árbol binario)
% ?- istree(t(a, t(b, nil, nil), t(c, t(d, nil, nil), nil))).
% true.
% ----------------------------------------------
