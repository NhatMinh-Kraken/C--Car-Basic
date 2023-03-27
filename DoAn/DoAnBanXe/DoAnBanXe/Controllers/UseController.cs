using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnBanXe.Models;
using PagedList;
using PagedList.Mvc;

namespace DoAnBanXe.Controllers
{
    public class UseController : BaseController
    {
        // GET: Use
        dbXeMerDataContext db = new dbXeMerDataContext();
        // GET: Use

        public List<Class> LaiThu1()
        {
            List<Class> classs = db.Classes.ToList();

            return classs;
        }

        public ActionResult TenXeTheoLoai(int MaClass)
        {
            List<Xe> xeList = db.Xes.Where(x => x.MaClass == MaClass).ToList();
            ViewBag.XeOptions = new SelectList(xeList, "MaXe", "TenXe");
            return PartialView("PhanLoaiXePartial");
        }

        [HttpGet]
        public ActionResult LaiThu()
        {
            //ViewBag.ClassList = new SelectList(LoaiXe(), "MaClass", "TenClass");
            ViewBag.ClassList = new SelectList(LaiThu1().ToList().OrderBy(n => n.TenClass), "MaClass", "TenClass");


            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {

                return RedirectToAction("DangNhap", "User");
            }
            else
            {
                return View();
            }

        }

        [HttpPost]
        public ActionResult LaiThu(DonDatHang ddh, FormCollection collection, LaiThu1 lt1)
        {

            ViewBag.ClassList = new SelectList(LaiThu1().ToList().OrderBy(n => n.TenClass), "MaClass", "TenClass");

            KhachHang kh = (KhachHang)Session["TaiKhoan"];

            var sTenTK = collection["sTenTK"];
            var sMaKH = int.Parse(collection["sMaKH"]);
            var sHoTen = collection["sHoTen"];
            var sDienThoai = collection["sDienThoai"];
            var sDiaChi = collection["sDiaChi"];
            var sEmail = collection["sEmail"];
            var sNgayDat = DateTime.Now;
            var sLoaiXe = collection["TenClass"];
            var sTenXe = collection["TenXe"];

            if (String.IsNullOrEmpty(sTenXe))
            {
                ViewData["err6"] = "Hãy Chọn Tên Xe Mong Muốn !!!";
            }

            else if (db.DonDatHangs.SingleOrDefault(n => n.email == sEmail) != null)
            {
                ViewBag.ThongBao = "Email Đã Được Sử Dụng !!!";
            }

            else if (db.DonDatHangs.SingleOrDefault(n => n.TenTK == sTenTK) != null)
            {
                ViewBag.ThongBao = "Tên Tài Khoản Đã Được Sử Dụng !!!";
            }

            else if (ModelState.IsValid)
            {
                ddh.TenTK = sTenTK;
                ddh.MaKH = sMaKH;
                ddh.HoTen = sHoTen;
                ddh.DienThoai = sDienThoai;
                ddh.DiaChi = sDiaChi;
                ddh.email = sEmail;
                ddh.NgayDat = sNgayDat;
                ddh.LoaiXe = sLoaiXe;
                ddh.TenXe = sTenXe;

                db.DonDatHangs.InsertOnSubmit(ddh);
                db.SubmitChanges();
                SetAlert("Đăng Ký Lái Thử Thành Công. Chúng Tôi Sẽ Liên Hệ Với Bạn Trong Thời Gian Sớm Nhất", "success");
                return RedirectToAction("Index", "Home");
            }

            return this.LaiThu();

        }
    }
}