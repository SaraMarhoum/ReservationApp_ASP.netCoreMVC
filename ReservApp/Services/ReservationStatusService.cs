using Microsoft.EntityFrameworkCore;
using ReservApp.Data;
using ReservApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReservApp.Services
{
    public class ReservationStatusService : IReservStatusService
    {

        private readonly ApplicationDbContext _appDbContext;
 
        public ReservationStatusService(ApplicationDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }
    

        public async Task<string> GetReservStatusById(int ID)
        {
            var name = await _appDbContext.Réservations.Where(c => c.ID == ID).Select(d => d.Status).FirstOrDefaultAsync();
            return name;
        }

        public async Task<Reservation> GetReservStatusDetails(int ID)
        {
            var emp = await _appDbContext.Réservations.FirstOrDefaultAsync(c => c.ID == ID);
            return emp;
        }


    }
}
