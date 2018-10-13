using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopManagement.Startup))]
namespace ShopManagement
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
