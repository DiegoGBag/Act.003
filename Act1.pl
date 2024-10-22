```c#
% ===============================================
% Autor: Diego Samuel Garcia Bagnis 
% Fecha: 17 de octubre de 2024
% Descripción: Programa en C# que determina 
%              el último elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referncia. 
% ===============================================
%------------------------------------------------------------------------------
using System;
using System.Collections.Generic;

class Program
{
    /// <summary>
    /// Función para encontrar el último elemento de una lista en C#.
    /// </summary>
    /// <typeparam name="T">El tipo de elementos de la lista.</typeparam>
    /// <param name="list">La lista de la cual se quiere obtener el último elemento.
    /// La lista debe tener al menos un elemento.</param>
    /// <returns>El último elemento de la lista.</returns>
    /// <exception cref="ArgumentException">Lanza una excepción si la lista está vacía.</exception>
    static T MyLast<T>(List<T> list)
    {
        if (list == null || list.Count == 0)
            throw new ArgumentException("La lista no puede estar vacía.");
        
        return list[list.Count - 1];  // Devuelve el último elemento.
    }

    static void Main()
    {
        List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
        char ultimoElemento = MyLast(lista);
        
        Console.WriteLine($"El último elemento es: {ultimoElemento}");
    }
}
