% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que verifica si un 
%              árbol binario es simétrico. Un árbol es 
%              simétrico si sus subárboles izquierdo y 
%              derecho son espejos entre sí.
% ===============================================

% -------- Código en Prolog --------------------
% symmetric(Tree) comprueba si el árbol binario es simétrico.
symmetric(nil).  % Un árbol vacío es simétrico.
symmetric(t(_, L, R)) :- mirror(L, R).  % Verifica si los subárboles son espejos.

% mirror(Tree1, Tree2) verifica si Tree1 es el espejo de Tree2.
mirror(nil, nil).  % Dos árboles vacíos son espejos.
mirror(t(_, L1, R1), t(_, L2, R2)) :- 
    mirror(L1, R2),  % El subárbol izquierdo de Tree1 es espejo del derecho de Tree2.
    mirror(R1, L2).  % El subárbol derecho de Tree1 es espejo del izquierdo de Tree2.

% Ejemplo de uso:
% ?- symmetric(nil).
% true.

% ?- symmetric(t(1, t(2, nil, nil), t(2, nil, nil))).
% true.

% ?- symmetric(t(1, t(2, nil, nil), t(3, nil, nil))).
% false.

% ?- symmetric(t(1, t(2, t(3, nil, nil), nil), t(2, nil, t(3, nil, nil)))).
% true.

% ?- symmetric(t(1, t(2, nil, nil), nil)).
% false.

% ?- symmetric(t(1, t(2, t(3, nil, nil), nil), t(2, nil, t(3, nil, nil)))).
% false.
% ----------------------------------------------

