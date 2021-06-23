using Microsoft.AspNetCore.Mvc;
using ReservApp.Data;
using ReservApp.Models;
using ReservApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReservApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReservationStatusController : Controller
    {
        private readonly ApplicationDbContext _db;

        private readonly IReservStatusService _reservStatusService;

        public ReservationStatusController(IReservStatusService reservStatusService)
        {
            _reservStatusService = reservStatusService;
        }

        [HttpGet(nameof(GetReservStatusById))]
        public async Task<string> GetReservStatusById(int ID)
        {
            var result = await _reservStatusService.GetReservStatusById(ID);
            return result;
        }
        [HttpGet(nameof(GetReservStatusDetails))]
        public async Task<Réservation> GetReservStatusDetails(int ID)
        {
            var result = await _reservStatusService.GetReservStatusDetails(ID);
            return result;
        }


    }
}
