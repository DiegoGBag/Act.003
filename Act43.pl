% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que genera el código Gray de N bits.
%              El código Gray es una secuencia binaria donde dos valores
%              consecutivos difieren en solo un bit.
% ===============================================

% -------- Código en Prolog --------------------
% Caso base: el código Gray de 1 bit es ['0', '1'].
gray(1, ['0', '1']).

% Caso recursivo: genera el código Gray de N bits a partir del de N-1 bits.
gray(N, C) :- 
    N > 1, 
    N1 is N - 1, 
    gray(N1, C1),  % Llama recursivamente para obtener el código Gray de N-1 bits.
    
    % Añade '0' al prefijo de la primera mitad.
    maplist(atom_concat('0'), C1, C0),  
    
    % Invierte la lista y añade '1' al prefijo de la segunda mitad.
    reverse(C1, C1R), 
    maplist(atom_concat('1'), C1R, C1G),  
    
    % Combina ambas mitades para obtener el código Gray de N bits.
    append(C0, C1G, C).  

% Ejemplo de uso:
% ?- gray(3, C).
% C = ['000', '001', '011', '010', '110', '111', '101', '100'].
% ----------------------------------------------
