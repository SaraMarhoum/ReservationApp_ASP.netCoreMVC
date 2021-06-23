using Castle.Core.Logging;
using Microsoft.AspNetCore.Mvc;
using Moq;
using ReservApp.Controllers;
using ReservApp.Data;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;
using ReservApp.Services;
using ReservApp.Models;

namespace ReservAppxUnitTest
{
    public class RerservTest
    {
        public Mock<IReservStatusService> mock = new Mock<IReservStatusService>();
   

        [Fact]
        public async void GetReservStatusById()
        {
            mock.Setup(p => p.GetReservStatusById(1)).ReturnsAsync("JK");
            ReservationStatusController resv = new ReservationStatusController(mock.Object);
            string result = await resv.GetReservStatusById(1);
            Assert.Equal("JK", result);
        }

        [Fact]
        public async void GetReservStatusDetails()
        {
            var reservationDTO = new Reservation()
            {
                ID = 1,
                Status = "JK"
            };
            mock.Setup(p => p.GetReservStatusDetails(1)).ReturnsAsync(reservationDTO);
            ReservationStatusController resv = new ReservationStatusController(mock.Object);
            var result = await resv.GetReservStatusDetails(1);
            Assert.True(reservationDTO.Equals(result));
        }
    }
}

