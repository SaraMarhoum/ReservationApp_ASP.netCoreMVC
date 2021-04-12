using System;

namespace ReservApp.Models
{
    public class RéservationViewmodel
    {
        public int ID { get; set; }
        public DateTime Date { get; set; }
        public string nom { get; set; }
        public string prenom { get; set; }
        public string classe { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public string Cause { get; set; }
    }
}
