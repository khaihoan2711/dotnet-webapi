using Microsoft.AspNetCore.Mvc;

namespace dotnet_webapi.Controllers;

[ApiController]
[Route("")]
public class HomeController : ControllerBase
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    [HttpGet()]
    public String Get()
    {
        return "Welcome to my dotnet webapi";
    }
}
