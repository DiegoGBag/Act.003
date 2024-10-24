% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 23 de octubre de 2024 
% Descripción: Programa en Prolog que genera una tabla de verdad
%              para una expresión lógica en dos variables.
% ===============================================

% -------- Código en Prolog --------------------
% Predicado table/3 que genera una tabla de verdad para una expresión lógica.
% A y B son las variables lógicas, y Expr es la expresión lógica que se evalúa.

table(A, B, Expr) :- 
    % Para cada combinación de A y B (true/false), escribe la fila de la tabla.
    (   A = true, B = true, call(Expr)
    ;   A = true, B = false, call(Expr)
    ;   A = false, B = true, call(Expr)
    ;   A = false, B = false, call(Expr)
    ), 
    write(A), write(' '), write(B), write(' '), nl, fail.

table(_, _, _).

% Ejemplo de uso con una expresión lógica:
% ?- table(A, B, (A -> B; \+ B)).  % Evalúa la expresión A implica B o B es falso.
