using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnBanXe.Models;

namespace DoAnBanXe.Controllers
{
    public class GioHangController : BaseController
    {
        // GET: GioHang
        dbXeMerDataContext db = new dbXeMerDataContext();


        public List<GioHang> LayGioHang()
        {
            List<GioHang> ListGioHang = Session["GioHang"] as List<GioHang>;
            if (ListGioHang == null)
            {
                ListGioHang = new List<GioHang>();
                Session["GioHang"] = ListGioHang;
            }
            return ListGioHang;
        }

        public ActionResult ThemGioHang(int mdc, string url)
        {
            List<GioHang> ListGioHang = LayGioHang();

            GioHang sp = ListGioHang.Find(n => n.MaDC == mdc);
            if (Session["TaiKhoan"] == null/* || Session["TaiKhoan"].ToString() == ""*/)
            {
                return RedirectToAction("DangNhap", "User");
            }


            if (sp == null)
            {
                sp = new GioHang(mdc);
                SetAlert("Bạn đã thêm 1 sản phẩm", "success");
                ListGioHang.Add(sp);
            }
            else
            {
                sp.SoLuong++;
                SetAlert("Bạn đã thêm 1 sản phẩm", "success");
            }
            return Redirect(url);
        }

        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> ListGioHang = Session["GioHang"] as List<GioHang>;

            if (ListGioHang != null)
            {
                iTongSoLuong = ListGioHang.Sum(n => n.SoLuong);
            }

            return iTongSoLuong;
        }

        public ActionResult GioHang()
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "User");
            }

            List<GioHang> ListGioHang = LayGioHang();
            if (ListGioHang.Count == 0)
            {
                SetAlert("Bạn chưa có sản phẩm nào !!!", "warning");
                return RedirectToAction("DoChoiXe", "Home");
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(ListGioHang);
        }


        private double TongTien()
        {
            double dTongTien = 0;
            List<GioHang> ListGioHang = Session["GioHang"] as List<GioHang>;

            if (ListGioHang != null)
            {
                dTongTien = ListGioHang.Sum(n => n.ThanhTien);
            }
            return dTongTien;
        }

        public ActionResult XoaSPKhoiGioHang(int? MaDC)
        {
            List<GioHang> ListGioHang = LayGioHang();
            GioHang sp = ListGioHang.Find(n => n.MaDC == MaDC);

            if (sp != null)
            {
                ListGioHang.RemoveAll(n => n.MaDC == MaDC);
            }
            return RedirectToAction("GioHang", "GioHang");
        }

        public ActionResult CapNhatGioHang(int? MaDC, FormCollection f)
        {
            List<GioHang> ListGioHang = LayGioHang();
            GioHang sp = ListGioHang.SingleOrDefault(n => n.MaDC == MaDC);
            if (sp != null)
            {
                sp.SoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang");
        }

        public ActionResult XoaGioHang()
        {
            List<GioHang> ListGioHang = LayGioHang();
            ListGioHang.Clear();
            return RedirectToAction("DoChoiXe", "Home");
        }

        // GET: GioHang
        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            return PartialView();
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            List<GioHang> ListGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(ListGioHang);
        }

        [HttpPost]
        public ActionResult DatHang(FormCollection f, int? id)
        {
            DonDatHangDoChoi ddhdc = new DonDatHangDoChoi();
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            List<GioHang> ListGioHang = LayGioHang();
            ddhdc.MaKH = kh.MaKH;
            ddhdc.TenTK = kh.TaiKhoan;
            ddhdc.HoTen = kh.HoTen;
            ddhdc.DiaChi = kh.DiaChi;
            ddhdc.DienThoai = kh.DienThoai;
            db.DonDatHangDoChois.InsertOnSubmit(ddhdc);
            db.SubmitChanges();
            foreach (var item in ListGioHang)
            {
                ChiTietDonDatHangDC ctdhdc = new ChiTietDonDatHangDC();
                ctdhdc.MaDonHangDC = ddhdc.MaDonHangDC;
                ctdhdc.MaKH = kh.MaKH;
                ctdhdc.TenDC = item.TenDC;
                ctdhdc.GiaDC = (decimal)item.DonGia;
                ctdhdc.NgayDat = DateTime.Now;
                ctdhdc.SoLuong = item.SoLuong;
                db.ChiTietDonDatHangDCs.InsertOnSubmit(ctdhdc);
            }
            db.SubmitChanges();
            Session["GioHang"] = null;
            SetAlert("Bạn đã đặt sản phầm thành công", "success");
            return RedirectToAction("DoChoiXe", "Home");
        }
    }
}