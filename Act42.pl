% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que define operadores lógicos
%              y genera tablas de verdad para expresiones lógicas.
% ===============================================

% -------- Código en Prolog --------------------
% Definición de los operadores básicos
and(A, B) :- A, B.  % AND: verdadero si ambos son verdaderos.
or(A, _) :- A.      % OR: verdadero si A es verdadero.
or(_, B) :- B.      % OR: verdadero si B es verdadero.
nand(A, B) :- \+ (A, B).  % NAND: verdadero si no son ambos verdaderos.
nor(A, B) :- \+ (A; B).    % NOR: verdadero si ambos son falsos.
xor(A, B) :- A, \+ B; \+ A, B.  % XOR: verdadero si exactamente uno es verdadero.
impl(A, B) :- \+ A; B.   % IMPLICACIÓN: verdadero si A es falso o B es verdadero.
equ(A, B) :- A, B; \+ A, \+ B.  % EQUIVALENCIA: verdadero si ambos son iguales.

% Predicado para generar la tabla de verdad.
table(A, B, Expr) :- 
    % Para cada combinación de A y B, evalúa la expresión.
    (   A = true, B = true, call(Expr)
    ;   A = true, B = false, call(Expr)
    ;   A = false, B = true, call(Expr)
    ;   A = false, B = false, call(Expr)
    ), 
    write(A), write(' '), write(B), write(' '), nl, fail.

table(_, _, _).

% Ejemplo de uso con una expresión lógica:
% ?- table(A, B, and(A, B)).  % Evalúa A AND B.
