using Microsoft.AspNetCore.Mvc;
// edit here
namespace HelloMvc
{
    public class HomeController : Controller
    {
        [HttpGet("/")]
        public IActionResult Index() => View();
    }
}
