using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace ReservApp.Models
{
    public class Apprenant : IdentityUser
    {

        [Required(ErrorMessage = "Saisir un nom !")]
        [Display(Name = "Nom")]
        public string nom { get; set; }

        [Required(ErrorMessage = "Saisir un prénom !")]
        [Display(Name = "Prénom")]
        public string prenom { get; set; }

        [Display(Name = "Classe")]
        public string classe { get; set; }

        [Display(Name = "Nombre de Réservation")]
        public int reservCount { get; set; }

        //[Display(Name = "Nombre de Réservation")]
        public string FullName { get; set; }
    }
}
