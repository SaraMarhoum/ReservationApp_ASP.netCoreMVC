using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ReservApp.Models;
using System.Threading.Tasks;

namespace ReservApp.Controllers
{
    public class ApprenantController : Controller
    {
        //Test controller
        private readonly UserManager<Apprenant> _userManager;

        public ApprenantController(UserManager<Apprenant> userManager)
        {
            _userManager = userManager;
        }


        [HttpPost]
        public async Task<IActionResult> Index(Apprenant userdetails)
        {
            IdentityResult x = await _userManager.UpdateAsync(userdetails);
            if (x.Succeeded)
            {
                return RedirectToAction("About", "Home");
            }
            else
            {
                return View(userdetails);
            }
        }

        [HttpGet]
        public IActionResult Index()
        {
            var userid = _userManager.GetUserId(HttpContext.User);
            if (userid == null)
            {
                return RedirectToAction("Login", "Account");
            }
            else
            {
                Apprenant user = _userManager.FindByIdAsync(userid).Result;
                return View(user);
            }
        }

        //public IActionResult Create()
        //{
        //    return View();
        //}

        //[HttpPost]
        //public async Task<IActionResult> Create(Apprenant nec)
        //{
        //    string usr = User.Identity.Name;

        //    if (ModelState.IsValid)
        //    {
        //        _db.Add(nec.UserName);
        //        await _db.SaveChangesAsync();
        //        return RedirectToAction("Create");
        //    }
        //    return View(nec);
        //}

    }
}
