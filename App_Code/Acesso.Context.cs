﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class BudplannEntities : DbContext
{
    public BudplannEntities()
        : base("name=BudplannEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<tb_usuario> tb_usuario { get; set; }
    public virtual DbSet<tb_cartao> tb_cartao { get; set; }
    public virtual DbSet<tb_segmento> tb_segmento { get; set; }
    public virtual DbSet<tb_parcelas> tb_parcelas { get; set; }
    public virtual DbSet<tb_lancamento_despesas> tb_lancamento_despesas { get; set; }
}
