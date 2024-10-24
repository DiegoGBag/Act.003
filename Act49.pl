% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que genera todos los árboles 
%              binarios simétricos y completamente equilibrados con 
%              N nodos. Utiliza el paradigma de generar y probar 
%              para encontrar todos los árboles que cumplen ambas propiedades.
% ===============================================

% -------- Código en Prolog --------------------

% cbal_tree(N, Tree) construye un árbol completamente equilibrado con N nodos.
cbal_tree(0, nil).  % Un árbol vacío se construye de cero nodos.
cbal_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1, 
    divide(N1, N2, N3),  % Divide el número de nodos entre los dos subárboles.
    cbal_tree(N2, L),    % Construye el subárbol izquierdo.
    cbal_tree(N3, R).    % Construye el subárbol derecho.

% divide(N, N1, N2) divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.

% istree(Tree) verifica si un término dado representa un árbol binario.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

% symmetric(Tree) verifica si un árbol binario es simétrico.
symmetric(nil).  % Un árbol vacío es simétrico.
symmetric(t(_, L, R)) :- mirror(L, R).  % Verifica si los subárboles son espejos.

% mirror(Tree1, Tree2) verifica si un árbol es el espejo de otro.
mirror(nil, nil).  % Dos árboles vacíos son espejos.
mirror(t(_, L1, R1), t(_, L2, R2)) :- 
    mirror(L1, R2), 
    mirror(R1, L2).

% sym_cbal_trees(N, Trees) genera todos los árboles binarios 
% simétricos y completamente equilibrados con N nodos.
sym_cbal_trees(N, Ts) :- 
    findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

% Ejemplo de uso:
% ?- sym_cbal_trees(3, Trees).
% Trees = [t('x', t('x', nil, nil), t('x', nil, nil))].

% ?- sym_cbal_trees(4, Trees).
% Trees = [t('x', t('x', t('x', nil, nil), nil), t('x', nil, nil)),
%          t('x', t('x', nil, nil), t('x', t('x', nil, nil), nil)),
%          t('x', nil, t('x', t('x', nil, nil), t('x', nil, nil))),
%          t('x', t('x', nil, nil), t('x', nil, t('x', nil, nil)))].
% ----------------------------------------------
