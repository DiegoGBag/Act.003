% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que compara los dos métodos
%              para calcular la función totiente de Euler.
%              El primer método es el básico, que cuenta cuántos 
%              números son coprimos con N.
%              El segundo método es el mejorado, que utiliza los 
%              factores primos con multiplicidad.
% ===============================================

% -------- Código en Prolog --------------------
% Predicado compare_totient/1 que compara los dos métodos
% para calcular la función totiente de un número N.

compare_totient(N) :- 
    totient(N, Phi1),               % Calcula el totiente usando el método básico.
    totient_improved(N, Phi2),       % Calcula el totiente usando el método mejorado.
    write('Phi (método básico): '),  % Imprime el resultado del método básico.
    write(Phi1), nl,                 % Nueva línea.
    write('Phi (método mejorado): '), % Imprime el resultado del método mejorado.
    write(Phi2), nl.                 % Nueva línea.

% Ejemplo de uso:
% ?- compare_totient(315).
% Phi (método básico): 144
% Phi (método mejorado): 144
% true.

% -------------------------------------------------
