using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnBanXe.Models;

namespace DoAnBanXe.Areas.Admin.Controllers
{
    public class HomeAdminController : BasesController
    {
        // GET: Admin/HomeAdmin
        dbXeMerDataContext db = new dbXeMerDataContext();
        // GET: Admin/HomeAdmin

        public ActionResult Login1()
        {
            return View();
        }

        public ActionResult Index()
        {
            //if (Session["TenDN"] == null || Session["TenDN"].ToString() == "")
            //{
            //    return RedirectToAction("Login", "HomeAdmin");
            //}
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            var sTenDN = f["UserName"];
            var sMatKhau = f["Password"];

            ADMIN ad = db.ADMINs.SingleOrDefault(n => n.TenDN == sTenDN && n.MatKhau == sMatKhau);

            if (ad != null)
            {
                Session["ADMIN"] = ad;

                if (f["remember"].Contains("true"))
                {
                    Response.Cookies["TenDN"].Value = sTenDN;
                    Response.Cookies["MatKhau"].Value = sMatKhau;
                    Response.Cookies["TenDN"].Expires = DateTime.Now.AddDays(1);
                    Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["TenDN"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(-1);
                }

                SetAlert("Đăng Nhập Thành Công", "success");
                return RedirectToAction("Index", "HomeAdmin");
            }
            else
            {
                ViewBag.ThongBao = "Tên Đăng Nhập Hoặc Mật Khẩu Không Đúng";
            }

            return View();
        }

        public ActionResult Logout()
        {
            Session.Clear();
            SetAlert("Đăng Xuất Thành Công", "success");
            return RedirectToAction("Login1");
        }

        public ActionResult KhachHang()
        {
            var kh = (from s in db.KhachHangs select s).ToList();
            ViewBag.KhachHangs = kh;

            return View();
        }

        public ActionResult LoginLogoutPartial()
        {
            return PartialView();
        }

        public ActionResult LoginLogout()
        {
            return PartialView("LoginLogoutPartial");
        }

        public ActionResult DonDatHang()
        {
            var ddh = (from s in db.DonDatHangs select s).ToList();
            ViewBag.DonDatHangs = ddh;

            return View();
        }
    }
}