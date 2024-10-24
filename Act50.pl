% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que construye un árbol binario
%              equilibrado en altura con una altura dada. 
%              Un árbol equilibrado en altura tiene subárboles 
%              cuya diferencia de altura es como máximo 1.
% ===============================================

% -------- Código en Prolog --------------------

% hbal_tree(H, Tree) construye un árbol binario equilibrado en altura con altura H.
hbal_tree(0, nil).  % Un árbol vacío se construye de altura 0.
hbal_tree(H, t('x', L, R)) :- 
    H > 0, 
    H1 is H - 1,              % Altura del subárbol izquierdo.
    H2 is H1 - 1,             % Altura del subárbol derecho (puede ser menor).
    hbal_tree(H1, L),         % Construye el subárbol izquierdo.
    hbal_tree(H2, R).         % Construye el subárbol derecho.

% Ejemplo de uso:
% ?- hbal_tree(3, Tree).
% Tree = t('x', t('x', t('x', nil, nil), nil), t('x', nil, nil)).
% ----------------------------------------------
