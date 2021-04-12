using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ReservApp.Models;

namespace ReservApp.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext()
        {
        }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Apprenant> Apprenants { get; set; }
        public virtual DbSet<Réservation> Réservations { get; set; }
        public DbSet<ReservApp.Models.RéservationViewmodel> RéservationViewmodel { get; set; }

    }
}
