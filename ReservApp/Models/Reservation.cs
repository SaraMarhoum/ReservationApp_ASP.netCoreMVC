using System;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ReservApp.Models
{
    public partial class Reservation
    {
        public int ID { get; set; }
        public DateTime Date { get; set; } = System.DateTime.Now;
        public string Type { get; set; }
        public string Status { get; set; }
        public string Cause { get; set; }
        public Apprenant Apprenants { get; set; }

        [ForeignKey("ApprenantsId")]
        public string ApprenantsId { get; set; }


    }
}
