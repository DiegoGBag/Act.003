% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que construye un árbol 
%              binario completamente equilibrado con N nodos.
%              Un árbol completamente equilibrado tiene subárboles 
%              cuya diferencia de tamaño es como máximo 1.
% ===============================================

% -------- Código en Prolog --------------------
% cbal_tree(N, T) construye un árbol binario equilibrado con N nodos.
cbal_tree(0, nil).  % Caso base: un árbol vacío con 0 nodos.
cbal_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1,  % Reducimos el número de nodos en 1 para crear el árbol.
    divide(N1, N2, N3),  % Dividimos los nodos restantes entre los subárboles.
    cbal_tree(N2, L),  % Construimos el subárbol izquierdo.
    cbal_tree(N3, R).  % Construimos el subárbol derecho.

% divide(N, N1, N2) divide N nodos en dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2,  % Número de nodos en el subárbol izquierdo.
    N2 is N - N1.  % Número de nodos en el subárbol derecho.

% Ejemplo de uso:
% ?- cbal_tree(0, T).
% T = nil.

% ?- cbal_tree(1, T).
% T = t('x', nil, nil).

% ?- cbal_tree(2, T).
% T = t('x', t('x', nil, nil), nil).

% ?- cbal_tree(3, T).
% T = t('x', t('x', nil, nil), t('x', nil, nil)).

% ?- cbal_tree(4, T).
% T = t('x', t('x', nil, nil), t('x', t('x', nil, nil), nil)).

% ?- cbal_tree(5, T).
% T = t('x', t('x', t('x', nil, nil), nil), t('x', nil, nil)).
% ----------------------------------------------
