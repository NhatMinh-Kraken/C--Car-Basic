using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnBanXe.Models;

namespace DoAnBanXe.Controllers
{
    public class UserController : BaseController
    {

        // GET: User
        dbXeMerDataContext db = new dbXeMerDataContext();
        // GET: User
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            //int state = int.Parse(Request.QueryString["id"]);

            var sTaiKhoan = collection["TaiKhoan"];
            var sMatkhau = collection["MatKhau"];

            KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatkhau);
            if (kh != null)
            {
                ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                Session["Taikhoan"] = kh;

                if (collection["remember"].Contains("true"))
                {
                    Response.Cookies["TaiKhoan"].Value = sTaiKhoan;
                    Response.Cookies["MatKhau"].Value = sMatkhau;
                    Response.Cookies["TaiKhoan"].Expires = DateTime.Now.AddDays(1);
                    Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["TaiKhoan"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(-1);
                }

                SetAlert("Đăng Nhập Thành Công", "success");
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
                SetAlert("Đăng Nhập Không Thành Công", "warning");
                return RedirectToAction("DangNhap", "User");
            }

            return View();
        }

        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(FormCollection collection, KhachHang kh)
        {
            //Gan cac gia tri nguoi dung nhap du lieu cho cac bien
            var sHoTen = collection["HoTen"];
            var sTaiKhoan = collection["TaiKhoan"];
            var sMatKhau = collection["MatKhau"];
            var sMatKhauNhapLai = collection["MatKhauNL"];
            var sEmail = collection["Email"];
            var sDienThoai = collection["DienThoai"];
            var sDiaChi = collection["DiaChi"];


            if (String.IsNullOrEmpty(sMatKhauNhapLai))
            {
                ViewData["err4"] = "Phải nhập lại mật khẩu";
            }
            else if (sMatKhau != sMatKhauNhapLai)
            {
                ViewData["err4"] = "Mật khẩu nhập lại không khớp";
            }

            else if (db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan) != null)
            {
                ViewBag.ThongBao = "Tên đăng nhập đã tồn tại";
            }
            else if (db.KhachHangs.SingleOrDefault(n => n.email == sEmail) != null)
            {
                ViewBag.ThongBao = "Email đã được sử dụng";
            }
            else if (ModelState.IsValid)
            {
                //Gán giá trị cho đối tượng được tạo mới (kh)
                kh.HoTen = sHoTen;
                kh.TaiKhoan = sTaiKhoan;
                kh.MatKhau = sMatKhau;
                kh.email = sEmail;
                kh.DienThoai = sDienThoai;
                kh.DiaChi = sDiaChi;

                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                SetAlert("Đăng Ký Thành Công", "success");
                return RedirectToAction("DangNhap");
            }
            return this.DangKy();
        }

        public ActionResult DangXuat()
        {
            Session.Clear();
            SetAlert("Đăng Xuất Thành Công", "success");
            return RedirectToAction("DangNhap");
        }
    }
}