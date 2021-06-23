using ReservApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReservApp.Services
{
    public interface IReservStatusService
    {
        Task<string> GetReservStatusById(int ID);
        Task<Réservation> GetReservStatusDetails(int ID);
    }
}
