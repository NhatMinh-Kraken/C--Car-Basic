using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using DoAnBanXe.Models;

namespace DoAnBanXe.Controllers
{
    public class HomeController : Controller
    {
        dbXeMerDataContext data = new dbXeMerDataContext();

        private List<Xe> LayXeMoi(int count)
        {
            return data.Xes.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }
        public ActionResult Index()
        {
            var listXeMoi = LayXeMoi(6);
            return View(listXeMoi);
        }

        public ActionResult GioiThieu()
        {
            return View();
        }

        public ActionResult TinTucKhuyenMai()
        {
            return View();
        }

        public ActionResult BaoDuongXechuyenNghiep()
        {
            return View();
        }

        public ActionResult Dau()
        {
            return View();
        }

        public ActionResult PhuTung()
        {
            return View();
        }

        public ActionResult ChiTietXe(int? id)
        {
            var xe = from s in data.Xes where s.MaXe == id select s;
            return View(xe.Single());
        }

        public ActionResult NavbarPartial()
        {
            var TenClass = from tl in data.Classes select tl;
            return PartialView(TenClass);
        }

        public ActionResult XeTheoClass(int? MaClass, int? page)
        {
            ViewBag.MaClass = MaClass;
            int iSize = 3;
            int iPageNum = (page ?? 1);

            var xe = from s in data.Xes where s.MaClass == MaClass select s;
            return View(xe.ToPagedList(iPageNum, iSize));
        }

        public ActionResult PhuKienPartial()
        {
            var phukien = from pk in data.PhuKiens select pk;
            return PartialView(phukien);
        }

        public ActionResult ChiTietPhuKien(int? id, int? page)
        {
            ViewBag.MaPhuKien = id;
            int iSize = 3;
            int iPageNum = (page ?? 1);
            var phukien = from s in data.ChiTietPhuKiens where s.MaPhuKien == id select s;
            return View(phukien.ToPagedList(iPageNum, iSize));
        }

        public ActionResult SanPham(int? page)
        {

            int iSize = 6;
            int iPageNum = (page ?? 1);
            var listXeMoi = LayXeMoi(16);
            return View(listXeMoi.ToPagedList(iPageNum, iSize));
        }

        public ActionResult LoginLogoutPartial()
        {
            return PartialView();
        }

        public ActionResult LoginLogout()
        {
            return PartialView("LoginLogoutPartial");
        }


        private List<DoChoiXe> LayDoChoiXe(int count)
        {
            return data.DoChoiXes.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }

        public ActionResult DoChoiXe(int? page)
        {
            int iSize = 12;
            int iPageNum = (page ?? 1);
            var listDoChoiXe = LayDoChoiXe(100);
            return View(listDoChoiXe.ToPagedList(iPageNum, iSize));
        }

        public ActionResult LoaiDoChoiPartial()
        {
            var listLoaiDoChoi = from ldc in data.LoaiDoChoiXes select ldc;
            return PartialView(listLoaiDoChoi);
        }

        public ActionResult DoChoiTheoLoai(int id, int? page)
        {
            ViewBag.MaLoaiDC = id;
            int iSize = 6;
            int iPageNum = (page ?? 1);
            var ldcx = from s in data.DoChoiXes where s.MaLoaiDC == id select s;
            return View(ldcx.ToPagedList(iPageNum, iSize));
        }

        public ActionResult ChiTietPhuKienXe(int? id)
        {
            var pkx = from s in data.DoChoiXes where s.MaDC == id select s;
            return View(pkx.Single());
        }
    }
}