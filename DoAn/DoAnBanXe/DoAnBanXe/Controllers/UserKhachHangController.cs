using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnBanXe.Models;
using System.IO;
using DoAnBanXe.Controllers;
using PagedList.Mvc;
using PagedList;

namespace DoAnBanXe.Controllers
{
    public class UserKhachHangController : BaseController
    {
        // GET: UserKhachHang
        dbXeMerDataContext data = new dbXeMerDataContext();
        // GET: UserKhachHang
        public ActionResult Index(int? id)
        {
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            return View();
        }

        public ActionResult Index1(int? id)
        {
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            return View();
        }

        [HttpGet]
        public ActionResult CapNhatThongTin(int? id)
        {
            var kh = data.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(kh);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CapNhatThongTin(FormCollection f)
        {
            var kh = data.KhachHangs.SingleOrDefault(n => n.MaKH == int.Parse(f["iMa"]));

            kh.MaKH = int.Parse(f["iMa"]);
            kh.HoTen = f["sHoTen"];
            kh.email = f["sEmail"];
            kh.DienThoai = f["sDienThoai"];
            kh.DiaChi = f["sDiaChi"].Replace("<p>", "").Replace("</p>", "");

            data.SubmitChanges();
            //Về lại trang Quản lý sách
            SetAlert("Sửa Thành Công", "success");
            return RedirectToAction("Index", "UserKhachHang");
        }


        public ActionResult CapNhatDonHang(int? id)
        {
            var dh = from s in data.ChiTietDonDatHangDCs where s.MaKH == id select s;
            //var sp = data.ChiTietDonDatHangDCs.SingleOrDefault(n => n.MaDonHangDC == id);

            if (dh == null)
            {
                return RedirectToAction("Index1", "UserKhachHang");
            }
            //if (sp == null)
            //{
            //    return RedirectToAction("Index1", "UserKhachHang");
            //}

            return View(dh);
        }

        public ActionResult XoaSP(int? id)
        {
            var sp = data.ChiTietDonDatHangDCs.SingleOrDefault(n => n.STT == id);
            if (sp == null)
            {
                return RedirectToAction("Index1", "UserKhachHang");
            }
            data.ChiTietDonDatHangDCs.DeleteOnSubmit(sp);
            data.SubmitChanges();
            SetAlert("Xóa Thành Công", "success");
            return RedirectToAction("CapNhatDonHang", "UserKhachHang");
        }
    }
}