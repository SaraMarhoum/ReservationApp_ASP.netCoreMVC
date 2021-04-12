namespace ReservApp.Models
{
    public class UserViewModel
    {
        public int Id { get; set; }
        public string nom { get; set; }
        public string prenom { get; set; }
        public string roleName { get; set; }
        public string classe { get; set; }
        public int reservCount { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
