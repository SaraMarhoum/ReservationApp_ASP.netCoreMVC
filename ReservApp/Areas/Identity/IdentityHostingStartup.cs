using Microsoft.AspNetCore.Hosting;

[assembly: HostingStartup(typeof(ReservApp.Areas.Identity.IdentityHostingStartup))]
namespace ReservApp.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) =>
            {
            });
        }
    }
}