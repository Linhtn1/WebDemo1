﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebDemo.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DBEntities : DbContext
    {
        public DBEntities()
            : base("name=DBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<tblCategory> tblCategories { get; set; }
        public DbSet<tblContent> tblContents { get; set; }
        public DbSet<tblImage> tblImages { get; set; }
        public DbSet<tblPermision> tblPermisions { get; set; }
        public DbSet<tblRole> tblRoles { get; set; }
        public DbSet<tblUser> tblUsers { get; set; }
        public DbSet<tblContent_Image> tblContent_Image { get; set; }
    }
}
