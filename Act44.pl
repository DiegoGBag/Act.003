% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que genera un árbol de Huffman 
%              dado un conjunto de frecuencias. 
%              El algoritmo de Huffman se utiliza para la compresión de 
%              datos, construyendo un árbol binario óptimo para la codificación.
% ===============================================

% -------- Código en Prolog --------------------
% huffman(Fs, Hs) toma una lista de frecuencias Fs y genera un árbol de Huffman Hs.
huffman(Fs, Hs) :- 
    length(Fs, Len), 
    Len > 1, 
    sort(2, @=<, Fs, Sorted),  % Ordena las frecuencias.
    huffman_tree(Sorted, Hs).   % Construye el árbol de Huffman.

% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _) | []], hc(X, '0')).  % Un solo nodo, asigna un código '0'.
huffman_tree([fr(_, _) | [fr(_, _) | _]], _).  % Caso con dos nodos, no implementado completamente.

% Ejemplo de uso:
% ?- huffman([fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)], Hs).
% Hs = ... (resultado del árbol de Huffman)
% ----------------------------------------------
