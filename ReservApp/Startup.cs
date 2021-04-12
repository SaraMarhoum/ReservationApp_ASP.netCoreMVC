using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using ReservApp.Data;
using ReservApp.Models;

namespace ReservApp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddDbContext<ApplicationDbContext>(options =>
            //    options.UseSqlServer(
            //        Configuration.GetConnectionString("DefaultConnection")));

            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseMySql(
                   Configuration.GetConnectionString("DefaultConnection")));

            services.AddDatabaseDeveloperPageExceptionFilter();

            services.AddIdentity<Apprenant, IdentityRole>(options => options.SignIn.RequireConfirmedAccount = true)
                .AddDefaultUI()
                .AddDefaultTokenProviders()
                .AddEntityFrameworkStores<ApplicationDbContext>();

            services.AddControllersWithViews().AddNToastNotifyNoty(new NToastNotify.NotyOptions()
            {
                ProgressBar = true, // show the progress bar
                Timeout = 5000, // notification will be disapear after 5000ms,
                Theme = "mint" // Notify.Js theme name - you can find more theme from Notify.js website
            });


            //services.AddIdentity<IdentityUser, IdentityRole>(options =>
            //{
            //    options.User.RequireUniqueEmail = false;
            //})
            //    .AddDefaultTokenProviders()
            //     .AddEntityFrameworkStores<ApplicationDbContext>();

            services.AddRazorPages();


            services.AddAuthentication()

                .AddGoogle(options =>
                {
                    options.ClientId = Configuration["App:GoogleClientId"];
                    options.ClientSecret = Configuration["App:GoogleClientSecret"];
                })

                .AddFacebook(options =>
                {
                    options.AppId = Configuration["App:FacebookClientId"];
                    options.ClientSecret = Configuration["App:FacebookClientSecret"];
                });

            services.AddAuthorization(options =>
            {
                options.AddPolicy("readonlypolicy",
                    builder => builder.RequireRole("Admin", "Staff", "Apprenant"));
                options.AddPolicy("ManageReservationpolicy",
                    builder => builder.RequireRole("Admin", "Staff"));
                options.AddPolicy("ManageRolesPolicy",
                    builder => builder.RequireRole("Admin"));
                options.AddPolicy("ReservPolicy",
                    builder => builder.RequireRole("Apprenant"));
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseNToastNotify();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseMigrationsEndPoint();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
                endpoints.MapRazorPages();
            });
        }
    }
}
