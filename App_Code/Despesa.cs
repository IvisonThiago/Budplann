using System.Collections.Generic;

using System;



public class Pessoa
{

    public int Id { get; set; }

    public string Nome { get; set; }

    public decimal Valor { get; set; }

    public DateTime Data { get; set; }



    public static List<Pessoa> Get()
    {

        List<Pessoa> lista = new List<Pessoa>();

        lista.Add(new Pessoa() { Id = 1, Nome = "Junior", Valor = (decimal)10.02, Data = Convert.ToDateTime("01/01/2010") });

        lista.Add(new Pessoa() { Id = 2, Nome = "Flavio", Valor = (decimal)98.10, Data = Convert.ToDateTime("01/01/2009") });

        lista.Add(new Pessoa() { Id = 3, Nome = "Mario", Valor = (decimal)43.45, Data = Convert.ToDateTime("01/01/1990") });

        lista.Add(new Pessoa() { Id = 4, Nome = "Luidi", Valor = (decimal)99.25, Data = Convert.ToDateTime("01/01/1992") });

        lista.Add(new Pessoa() { Id = 5, Nome = "Peach", Valor = (decimal)76.44, Data = Convert.ToDateTime("01/01/1977") });

        lista.Add(new Pessoa() { Id = 6, Nome = "Toad", Valor = (decimal)98.30, Data = Convert.ToDateTime("01/01/1980") });

        lista.Add(new Pessoa() { Id = 7, Nome = "Rosalina", Valor = (decimal)25.12, Data = Convert.ToDateTime("01/01/2003") });

        lista.Add(new Pessoa() { Id = 8, Nome = "Inara", Valor = (decimal)78.99, Data = Convert.ToDateTime("01/01/2007") });

        return lista;

    }

}