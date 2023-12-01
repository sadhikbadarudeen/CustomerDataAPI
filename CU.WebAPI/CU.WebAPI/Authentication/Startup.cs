using Microsoft.Owin;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Security.Infrastructure;
using Microsoft.Owin.Security.OAuth;
using Owin;
using System;
using System.Threading.Tasks;

[assembly: OwinStartup(typeof(CU.WebAPI.Authentication.Startup))]

namespace CU.WebAPI.Authentication
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=316888
            app.UseCors(CorsOptions.AllowAll);
            OAuthAuthorizationServerOptions option = new OAuthAuthorizationServerOptions
            {
                TokenEndpointPath = new PathString("/api/token"),
                Provider = new ApplicationAuthProvider(),
                AccessTokenProvider = new AuthenticationTokenProvider
                {
                    OnCreate = (context) =>
                    {
                        var token = context.SerializeTicket();
                        var clientID = context.Ticket.Identity.Name;

                        var issueDate = context.Ticket.Properties.IssuedUtc.Value.DateTime;
                        var expiryDate = context.Ticket.Properties.ExpiresUtc.Value.DateTime;

                        Helper.DBHelper.Instance.SaveTokenInfo(clientID, token, issueDate, expiryDate);
                    },
                    //OnReceive = (context) =>
                    //{
                    //    if (TokenService.IsValidToken(context.Token))
                    //    {
                    //        var publicToken = context.Token;
                    //        var token = tokenData[publicToken];
                    //        context.DeserializeTicket(token);
                    //    }
                    //}
                },
                AccessTokenExpireTimeSpan = TimeSpan.FromMinutes(TokenService.expireTime),
                AllowInsecureHttp = true
            };
            app.UseOAuthAuthorizationServer(option);
            app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());
        }
    }
}
