using System;

class Program
{
    static string[] videojuegos = new string[10];
    static double[] precios = new double[10];
    static string[] rareza = new string[10];

    static void Main()
    {
        int opcion;

        do
        {
            Console.Clear();
            MostrarMenu();

            try
            {
                opcion = Convert.ToInt32(Console.ReadLine());

                switch (opcion)
                {
                    case 1:
                        RegistrarVideojuegos();
                        break;

                    case 2:
                        RegistrarPrecios();
                        break;

                    case 3:
                        MostrarCatalogo();
                        break;

                    case 4:
                        BuscarVideojuego();
                        break;

                    case 5:
                        MostrarEstadisticas();
                        break;

                    case 6:
                        Console.WriteLine("\nGracias por usar Arcade Vault.");
                        break;

                    default:
                        Console.WriteLine("Opción no válida.");
                        break;
                }
            }
            catch
            {
                Console.WriteLine("Error: Debe ingresar un número.");
                opcion = 0;
            }

            if (opcion != 6)
            {
                Console.WriteLine("\nPresione una tecla para continuar...");
                Console.ReadKey();
            }

        } while (opcion != 6);
    }

    static void MostrarMenu()
    {
        Console.WriteLine("╔══════════════════════════════════════╗");
        Console.WriteLine("║      🎮 ARCADE VAULT SYSTEM 🎮       ║");
        Console.WriteLine("╠══════════════════════════════════════╣");
        Console.WriteLine("║ 1. Registrar videojuegos             ║");
        Console.WriteLine("║ 2. Registrar precios                 ║");
        Console.WriteLine("║ 3. Mostrar catálogo                  ║");
        Console.WriteLine("║ 4. Buscar videojuego                 ║");
        Console.WriteLine("║ 5. Estadísticas                      ║");
        Console.WriteLine("║ 6. Salir                             ║");
        Console.WriteLine("╚══════════════════════════════════════╝");
        Console.Write("Seleccione una opción: ");
    }

    static void RegistrarVideojuegos()
    {
        Console.WriteLine("\n=== REGISTRO DE VIDEOJUEGOS ===");

        for (int i = 0; i < videojuegos.Length; i++)
        {
            Console.Write($"Nombre del videojuego #{i + 1}: ");
            videojuegos[i] = Console.ReadLine();

            Console.Write("Rareza (Común/Raro/Épico/Legendario): ");
            rareza[i] = Console.ReadLine();
        }

        Console.WriteLine("\nVideojuegos registrados correctamente.");
    }

    static void RegistrarPrecios()
    {
        Console.WriteLine("\n=== REGISTRO DE PRECIOS ===");

        for (int i = 0; i < precios.Length; i++)
        {
            try
            {
                Console.Write($"Precio de {videojuegos[i]}: $");
                precios[i] = Convert.ToDouble(Console.ReadLine());
            }
            catch
            {
                Console.WriteLine("Precio inválido. Se registró $0.");
                precios[i] = 0;
            }
        }

        Console.WriteLine("\nPrecios registrados correctamente.");
    }

    static void MostrarCatalogo()
    {
        Console.WriteLine("\n══════════ CATÁLOGO ARCADE ══════════");

        for (int i = 0; i < videojuegos.Length; i++)
        {
            if (!string.IsNullOrEmpty(videojuegos[i]))
            {
                Console.WriteLine($"\n🎮 {videojuegos[i]}");
                Console.WriteLine($"   Rareza: {rareza[i]}");
                Console.WriteLine($"   Precio: ${precios[i]:F2}");
            }
        }
    }

    static void BuscarVideojuego()
    {
        Console.Write("\nIngrese el nombre del videojuego: ");
        string buscar = Console.ReadLine();

        bool encontrado = false;

        for (int i = 0; i < videojuegos.Length; i++)
        {
            if (videojuegos[i] != null &&
                videojuegos[i].ToLower() == buscar.ToLower())
            {
                Console.WriteLine("\n✓ Videojuego encontrado");
                Console.WriteLine($"Nombre: {videojuegos[i]}");
                Console.WriteLine($"Rareza: {rareza[i]}");
                Console.WriteLine($"Precio: ${precios[i]:F2}");

                encontrado = true;
                break;
            }
        }

        if (!encontrado)
        {
            Console.WriteLine("\n✗ Videojuego no encontrado.");
        }
    }

    static void MostrarEstadisticas()
    {
        double mayor = precios[0];
        double menor = precios[0];
        double suma = 0;

        string juegoMayor = videojuegos[0];
        string juegoMenor = videojuegos[0];

        for (int i = 0; i < precios.Length; i++)
        {
            suma += precios[i];

            if (precios[i] > mayor)
            {
                mayor = precios[i];
                juegoMayor = videojuegos[i];
            }

            if (precios[i] < menor)
            {
                menor = precios[i];
                juegoMenor = videojuegos[i];
            }
        }

        double promedio = suma / precios.Length;

        Console.WriteLine("\n══════ ESTADÍSTICAS ══════");

        Console.WriteLine($"\nJuego más caro:");
        Console.WriteLine($"{juegoMayor} - ${mayor:F2}");

        Console.WriteLine($"\nJuego más barato:");
        Console.WriteLine($"{juegoMenor} - ${menor:F2}");

        Console.WriteLine($"\nPrecio promedio:");
        Console.WriteLine($"{promedio:F2}");
    }
}