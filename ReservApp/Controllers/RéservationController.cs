using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NToastNotify;
using ReservApp.Data;
using ReservApp.Models;
using ReservApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ReservApp.Controllers
{
    [Authorize]
    public class RéservationController : Controller
    {
        private readonly ApplicationDbContext _db;

        private readonly UserManager<Apprenant> _userManager;

        private readonly IToastNotification toastNotification;


        public RéservationController(ApplicationDbContext db, UserManager<Apprenant> userManager, IToastNotification toastNotification)
        {
            _db = db;
            _userManager = userManager;
            this.toastNotification = toastNotification;
        }

        //Display list of all reservations
        //[Authorize(Policy = "ManageReservationpolicy")]
        public IActionResult Index()
        {
            var Result = (from r in _db.Réservations
                          join a in _db.Apprenants
                          on r.Apprenants.Id equals a.Id
                          select new RéservationViewmodel
                          {
                              ID = r.ID,
                              Date = r.Date,
                              nom = a.nom,
                              prenom = a.prenom,
                              classe = a.classe,
                              Type = r.Type,
                              Status = r.Status,
                              Cause = r.Cause,
                          }
                          ).ToList();
            return View(Result);
        }


        //Get reservation list of Tomorrow
        public IActionResult IndexDemain()
        {
            DateTime startDateTime = DateTime.Today.AddDays(1).AddTicks(-1);
            DateTime endDateTime = DateTime.Today.AddDays(2).AddTicks(-1);

            var Result = (from r in _db.Réservations
                          join a in _db.Apprenants
                          on r.Apprenants.Id equals a.Id
                          //where (r.Date >= startDateTime && r.Date <= endDateTime)
                          where (r.Date > startDateTime && r.Date <= endDateTime)
                          select new RéservationViewmodel
                          {
                              ID = r.ID,
                              Date = r.Date,
                              nom = a.nom,
                              prenom = a.prenom,
                              classe = a.classe,
                              Type = r.Type,
                              Status = r.Status,
                              Cause = r.Cause,
                          }
                          ).ToList();
            return View(Result);
        }



        //Get reservation list of logged user
        public IActionResult IndexSTD()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var Result = (from r in _db.Réservations
                          join a in _db.Apprenants
                          on r.Apprenants.Id equals a.Id
                          where r.Apprenants.Id == userId
                          select new RéservationViewmodel
                          {
                              ID = r.ID,
                              Date = r.Date,
                              nom = a.nom,
                              prenom = a.prenom,
                              classe = a.classe,
                              Type = r.Type,
                              Status = r.Status,
                              Cause = r.Cause,
                          }
                          ).ToList();
            //ViewBag.Id = userId;
            return View(Result);
        }


        //Chercher une réservation par l'apprenant
        [HttpGet]
        public async Task<IActionResult> IndexSTD(string ResrveApprSearch)
        {
            ViewData["GetReservAprDetails"] = ResrveApprSearch;
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var Result = (from r in _db.Réservations
                          join a in _db.Apprenants
                          on r.Apprenants.Id equals a.Id
                          where r.Apprenants.Id == userId
                          select new RéservationViewmodel
                          {
                              ID = r.ID,
                              Date = r.Date,
                              nom = a.nom,
                              prenom = a.prenom,
                              classe = a.classe,
                              Type = r.Type,
                              Status = r.Status,
                              Cause = r.Cause,
                          }
                          );
            if (!string.IsNullOrEmpty(ResrveApprSearch))
            {
                Result = Result.Where(x => x.classe.Contains(ResrveApprSearch) || x.Status.Contains(ResrveApprSearch)
                || x.nom.Contains(ResrveApprSearch) || x.Date.ToString().Contains(ResrveApprSearch) || x.prenom.Contains(ResrveApprSearch)
                || x.Type.Contains(ResrveApprSearch));
            }
            return View(await Result.AsNoTracking().ToListAsync());
        }

        //Chercher une réservation par filtre
        [HttpGet]
        public async Task<IActionResult> Index(string ResrveSearch)
        {
            ViewData["GetReservDetails"] = ResrveSearch;
            var ResevAppr = from r in _db.Réservations
                            join a in _db.Apprenants
                            on r.Apprenants.Id equals a.Id
                            select new RéservationViewmodel
                            {
                                ID = r.ID,
                                Date = r.Date,
                                nom = a.nom,
                                prenom = a.prenom,
                                classe = a.classe,
                                Type = r.Type,
                                Status = r.Status,
                                Cause = r.Cause,
                            };

            if (!string.IsNullOrEmpty(ResrveSearch))
            {
                ResevAppr = ResevAppr.Where(x => x.classe.Contains(ResrveSearch) || x.Status.Contains(ResrveSearch)
                || x.nom.Contains(ResrveSearch) || x.Date.ToString().Contains(ResrveSearch) || x.prenom.Contains(ResrveSearch)
                || x.Type.Contains(ResrveSearch)); 
            } 
            return View(await ResevAppr.AsNoTracking().ToListAsync()); 
        }


        //Get reservation list of En attente status
        public IActionResult IndexEnAttente()
        {
            //var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var Result = (from r in _db.Réservations
                          join a in _db.Apprenants
                          on r.Apprenants.Id equals a.Id
                          //where r.Apprenants.Id == userId
                          where r.Status == "En Attente"
                          select new RéservationViewmodel
                          {
                              ID = r.ID,
                              Date = r.Date,
                              nom = a.nom,
                              prenom = a.prenom,
                              classe = a.classe,
                              Type = r.Type,
                              Status = r.Status,
                              Cause = r.Cause,
                          }
                          ).ToList();
            //ViewBag.Id = userId;
            return View(Result);
        }



        //Ajouter une nouvelle réservation 
        [Authorize(Policy = "ReservPolicy")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateAsync(Réservation nec)
        {
            var user = await _userManager.GetUserAsync(User);
            nec.Apprenants = user;

            if (ModelState.IsValid)
            {
                _db.Add(nec);
                await _db.SaveChangesAsync();
                toastNotification.AddSuccessToastMessage("Votre demande est effectuée");
                return RedirectToAction("IndexSTD");

            }
            return View(nec);
        }


        //Modifier une réservation
        //[Authorize(Policy = "ManageReservationpolicy")]
        [HttpGet]
        public async Task<IActionResult> Edit(int? ID)
        {
            var resr = _db.Réservations.Find(ID);
            if (resr.Status == "En Attente")
            {
                if (ID == null)
            {
                return RedirectToAction("IndexSTD");
            }
            var getrsvdetails = await _db.Réservations.FindAsync(ID);
            return View(getrsvdetails);

            }
            else
            {
                toastNotification.AddErrorToastMessage("Vous ne pouvez plus modifier cette réservation !");
            }
            return RedirectToAction("IndexSTD");
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Réservation nc)
        {
            if (ModelState.IsValid)
            {
                _db.Update(nc);
                await _db.SaveChangesAsync();
                toastNotification.AddSuccessToastMessage("Votre demande à été modifiée !");
                return RedirectToAction("IndexSTD");
            }
            return View(nc);
        }





        //Supprimer une réservation
        public async Task<IActionResult> Delete(int? id)
        {
            var resr = _db.Réservations.Find(id);
            if(resr.Status == "En Attente")
            {
               if (id == null)
               {
                   return RedirectToAction("IndexSTD");
               }            
               var getstddetails = await _db.Réservations.FindAsync(id);
               return View(getstddetails);
            }

            else
            {
                toastNotification.AddErrorToastMessage("Vous ne pouvez plus modifier cette réservation !");
            }
            return RedirectToAction("IndexSTD");
        }

        [HttpPost]
        public async Task<IActionResult> Delete(Réservation nc)
        {
            if (ModelState.IsValid)
            {
                _db.Remove(nc);
                await _db.SaveChangesAsync();
                toastNotification.AddSuccessToastMessage("Votre réservation a été supprimée !");
                return RedirectToAction("IndexSTD");
            }
            return View(nc);
        }



        //public async Task<IActionResult> Details(int? ID)
        //{
        //    if (ID == null)
        //    {
        //        return RedirectToAction("Index");
        //    }
        //    var getstddetails = await _db.RéservationViewmodel.FindAsync(ID);
        //    return View(getstddetails);
        //}


        //Confirmer une réservation
        public async Task<IActionResult> Confirm(int id)
        {
            var resr = _db.Réservations.Find(id);
            if (resr.Status != "Confirmée")
            {
                //Increment(id);
                //var app = new Reservation();
                resr.Status = "Confirmée";
                _db.Update(resr);
                await _db.SaveChangesAsync();
                toastNotification.AddSuccessToastMessage("Réservation confirmée");
            }
            else
            {
                toastNotification.AddErrorToastMessage("Réservation déjà confirmée");
            }

            return RedirectToAction("IndexDemain");
        }

        //Refuser une réservation
        public IActionResult Decline(int id)
        {
            var resr = _db.Réservations.Find(id);

            if (resr.Status != "Refusée")
            {
                resr.Status = "Refusée";
                _db.Update(resr);
                _db.SaveChanges();
                toastNotification.AddWarningToastMessage("Réservation refusée");

            }
            else
            {
                toastNotification.AddErrorToastMessage("Réservation déjà refusée");
            }

            return RedirectToAction("IndexDemain");

        }
    }
}
