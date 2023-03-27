using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using DoAnBanXe.Models;

namespace DoAnBanXe.Areas.Admin.Controllers
{
    public class SearchController : BasesController
    {
        // GET: Admin/Search
        dbXeMerDataContext data = new dbXeMerDataContext();
        // GET: Search
        public ActionResult Search(string strSearch)
        {
            ViewBag.Search = strSearch;
            if (!string.IsNullOrEmpty(strSearch))
            {
                //var kq = from s in data.Xes where s.TenXe.Contains(strSearch) || s.LoaiXe.Contains(strSearch) || s.MaClass == int.Parse(strSearch) select s;
                var kq = from s in data.Xes
                         where s.TenXe.Contains(strSearch)
                            || s.LoaiXe.Contains(strSearch)
                         select s;
                return View(kq);
            }
            return View();
        }

        public ActionResult GroupClass()
        {
            var kq = data.Xes.GroupBy(s => s.MaClass);

            return View(kq);
        }

        public ActionResult GroupPhuKien()
        {
            var kq = data.ChiTietPhuKiens.GroupBy(s => s.MaPhuKien);

            return View(kq);
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.MaClass = new SelectList(data.Classes.ToList().OrderBy(n => n.TenClass), "MaClass", "TenClass");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Xe xe, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            ViewBag.MaClass = new SelectList(data.Classes.ToList().OrderBy(n => n.TenClass), "MaClass", "TenClass");

            if (fFileUpload == null)
            {
                // nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.ThongBao = "Hãy chọn ảnh bìa.";
                //lưu thông tin để khi load lại trang do yêu cầu
                // chọn ảnh bìa sẽ hiển thị các thông tin này lên trang
                ViewBag.LoaiXe = f["sLoaiXe"];
                ViewBag.TenXe = f["sTenXe"];
                ViewBag.GiaXe = decimal.Parse(f["mGiaXe"]);
                ViewBag.MoTa = f["sMoTa"];
                ViewBag.MaClass = new SelectList(data.Classes.ToList().OrderBy(n => n.TenClass), "MaClass", "TenClass", int.Parse(f["MaClass"]));
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    // lấy tên file (khai báo thư viện :System.Io
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    // lấy đường dẫn lưu file
                    var path = Path.Combine(Server.MapPath("~/image"), sFileName);
                    // kiểm tra ảnh bìa đã tồn tại chưa để lưu lên thư mục
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    // lưu Sách vào csdl

                    xe.LoaiXe = f["sLoaiXe"];
                    xe.TenXe = f["sTenxe"];
                    xe.GiaXe = decimal.Parse(f["mGiaXe"]);
                    xe.AnhBia = sFileName;
                    xe.MoTa = f["sMoTa"].Replace("<p>", "").Replace("<p>", "");
                    xe.NgayCapNhat = Convert.ToDateTime(f["dNgayCapNhat"]);
                    xe.MaClass = int.Parse(f["MaClass"]);

                    data.Xes.InsertOnSubmit(xe);
                    data.SubmitChanges();
                    // về lại trang quản lý sách
                    SetAlert("Thêm Thành Công", "success");
                    return RedirectToAction("Index", "Xe");
                }
                return View();
            }
        }

        public ActionResult Detail(int? id)
        {
            var xe = data.Xes.SingleOrDefault(n => n.MaXe == id);
            if (xe == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(xe);
        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            var xe = data.Xes.SingleOrDefault(n => n.MaXe == id);
            if (xe == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(xe);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int? id, FormCollection f)
        {
            var xe = data.Xes.SingleOrDefault(n => n.MaXe == id);

            if (xe == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Xóa sách
            data.Xes.DeleteOnSubmit(xe);
            data.SubmitChanges();
            SetAlert("Xóa Thành Công", "success");
            return RedirectToAction("Index", "Xe");
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            var xe = data.Xes.SingleOrDefault(n => n.MaXe == id);
            if (xe == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Hiển thị danh sách chủ đề và nhà xuất bản đồng thời chọn chủ đề và nhà xuất bảncủa cuốn hiện tại
            ViewBag.MaClass = new SelectList(data.Classes.ToList().OrderBy(n => n.TenClass), "MaClass", "TenClass", xe.MaClass);
            return View(xe);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var xe = data.Xes.SingleOrDefault(n => n.MaXe == int.Parse(f["iMaXe"]));
            ViewBag.MaClass = new SelectList(data.Classes.ToList().OrderBy(n => n.TenClass), "MaClass", "TenClass", xe.MaClass);

            if (ModelState.IsValid)
            {
                if (fFileUpload != null) //Kiểm tra để xác nhận cho thay đổi ảnh bìa
                {
                    //Lấy tên file (Khai báo thư viện: System.IO)
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    //Lấy đường dẫn lưu file
                    var path = Path.Combine(Server.MapPath("~/image"), sFileName);
                    //Kiểm tra file đã tồn tại chưa
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    xe.AnhBia = sFileName;
                }
                //Lưu Sach vào CSDL
                xe.MaXe = int.Parse(f["iMaXe"]);
                xe.LoaiXe = f["sLoaiXe"];
                xe.TenXe = f["sTenXe"];
                xe.GiaXe = decimal.Parse(f["mGiaXe"]);
                xe.MoTa = f["sMoTa"].Replace("<p>", "").Replace("<p>", "");
                xe.NgayCapNhat = Convert.ToDateTime(f["dNgayCapNhat"]);
                xe.MaClass = int.Parse(f["MaClass"]);

                data.SubmitChanges();
                //Về lại trang Quản lý sách
                SetAlert("Sửa Thành Công", "success");
                return RedirectToAction("Index", "Xe");
            }
            return View(xe);
        }

        [HttpGet]
        public ActionResult CreateClass()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateClass(Class loai, FormCollection f)
        {
            loai.TenClass = f["TenClass"];
            data.Classes.InsertOnSubmit(loai);
            data.SubmitChanges();

            SetAlert("Thêm Thành Công", "success");
            return RedirectToAction("QLCLass", "Xe");
        }

        [HttpGet]
        public ActionResult DeleteClass(int? id)
        {
            var loai = data.Classes.SingleOrDefault(n => n.MaClass == id);
            if (loai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(loai);
        }

        [HttpPost, ActionName("DeleteClass")]
        public ActionResult DeleteClassConfirm(int? id, FormCollection f)
        {
            var loai = data.Classes.SingleOrDefault(n => n.MaClass == id);

            if (loai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Xóa sách
            data.Classes.DeleteOnSubmit(loai);
            data.SubmitChanges();
            SetAlert("Xóa Thành Công", "success");
            return RedirectToAction("QLCLass", "Xe");
        }

        [HttpGet]
        public ActionResult CreatePK()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreatePK(ChiTietPhuKien ctpk, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            if (ModelState.IsValid)
            {
                if (fFileUpload != null) //Kiểm tra để xác nhận cho thay đổi ảnh bìa
                {
                    //Lấy tên file (Khai báo thư viện: System.IO)
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    //Lấy đường dẫn lưu file
                    var path = Path.Combine(Server.MapPath("~/image"), sFileName);
                    //Kiểm tra file đã tồn tại chưa
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    ctpk.AnhPhuKien = sFileName;
                }
                //Lưu Sach vào CSDL
                ctpk.TenPhukien = f["sTenPK"];
                ctpk.MoTa1 = f["sTieuDe"];
                ctpk.Mota2 = f["sMoTa"];
                ctpk.MaPhuKien = int.Parse(f["MaPK"]);

                data.ChiTietPhuKiens.InsertOnSubmit(ctpk);
                data.SubmitChanges();
                //Về lại trang Quản lý sách
                SetAlert("Thêm Thành Công", "success");
                return RedirectToAction("QLPK", "Xe");
            }
            return View(ctpk);
        }


        public ActionResult DetailsPK(int? id)
        {
            var ctpk = data.ChiTietPhuKiens.SingleOrDefault(n => n.Ma == id);
            if (ctpk == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ctpk);
        }

        [HttpGet]
        public ActionResult DeletePK(int? id)
        {
            var ctpk = data.ChiTietPhuKiens.SingleOrDefault(n => n.Ma == id);
            if (ctpk == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ctpk);
        }

        [HttpPost, ActionName("DeletePK")]
        public ActionResult DeletePKConfirm(int? id, FormCollection f)
        {
            var ctpk = data.ChiTietPhuKiens.SingleOrDefault(n => n.Ma == id);
            if (ctpk == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.ChiTietPhuKiens.DeleteOnSubmit(ctpk);
            data.SubmitChanges();

            SetAlert("Xóa Thành Công", "success");
            return RedirectToAction("QLPK", "Xe");

        }

        [HttpGet]
        public ActionResult EditPK(int? id)
        {
            var ctpk = data.ChiTietPhuKiens.SingleOrDefault(n => n.Ma == id);
            if (ctpk == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ctpk);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditPK(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var ctpk = data.ChiTietPhuKiens.SingleOrDefault(n => n.Ma == int.Parse(f["iMa"]));

            if (ModelState.IsValid)
            {
                if (fFileUpload != null) //Kiểm tra để xác nhận cho thay đổi ảnh bìa
                {
                    //Lấy tên file (Khai báo thư viện: System.IO)
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    //Lấy đường dẫn lưu file
                    var path = Path.Combine(Server.MapPath("~/image"), sFileName);
                    //Kiểm tra file đã tồn tại chưa
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    ctpk.AnhPhuKien = sFileName;
                }
                //Lưu Sach vào CSDL

                ctpk.Ma = int.Parse(f["iMa"]);
                ctpk.TenPhukien = f["sTenPK"];
                ctpk.MoTa1 = f["sTieuDe"].Replace("<p>", "");
                ctpk.Mota2 = f["sMoTa"].Replace("<p>", "");
                ctpk.MaPhuKien = int.Parse(f["iMaPK"]);

                data.SubmitChanges();
                //Về lại trang Quản lý sách
                SetAlert("Sửa Thành Công", "success");
                return RedirectToAction("QLPK", "Xe");
            }
            return View(ctpk);
        }

        [HttpGet]
        public ActionResult CreateDH()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateDH(DonDatHang ddh, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            // lưu Sách vào csdl

            ddh.TenTK = f["sTenTK"];
            ddh.HoTen = f["sTenKH"];
            ddh.DienThoai = f["sDienThoai"];
            ddh.DiaChi = f["sDiaChi"].Replace("<p>", "").Replace("<p>", "");
            ddh.email = f["sEmail"];
            ddh.LoaiXe = f["sLoaiXe"];
            ddh.TenXe = f["sTenXe"];

            data.DonDatHangs.InsertOnSubmit(ddh);
            data.SubmitChanges();
            // về lại trang quản lý sách
            SetAlert("Thêm Thành Công", "success");
            return RedirectToAction("QLDH", "Xe");
        }

        [HttpGet]
        public ActionResult DeleteDH(int? id)
        {
            var dh = data.DonDatHangs.SingleOrDefault(n => n.MaDonHang == id);
            if (dh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dh);
        }

        [HttpPost, ActionName("DeleteDH")]
        public ActionResult DeleteDHConfirm(int? id, FormCollection f)
        {
            var dh = data.DonDatHangs.SingleOrDefault(n => n.MaDonHang == id);
            if (dh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.DonDatHangs.DeleteOnSubmit(dh);
            data.SubmitChanges();

            SetAlert("Xóa Thành Công", "success");
            return RedirectToAction("QLDH", "Xe");
        }

        [HttpGet]
        public ActionResult EditDH(int? id)
        {
            var dh = data.DonDatHangs.SingleOrDefault(n => n.MaDonHang == id);
            if (dh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dh);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditDH(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var dh = data.DonDatHangs.SingleOrDefault(n => n.MaDonHang == int.Parse(f["iMa"]));
            //Lưu Sach vào CSDL
            dh.MaDonHang = int.Parse(f["iMa"]);
            dh.HoTen = f["sHoTen"];
            dh.DienThoai = f["sDienThoai"];
            dh.DiaChi = f["sDiaChi"];
            dh.email = f["sEmail"];
            dh.LoaiXe = f["sLoaiXe"];
            dh.TenXe = f["sTenXe"];

            data.SubmitChanges();
            //Về lại trang Quản lý sách
            SetAlert("Sửa Thành Công", "success");
            return RedirectToAction("QLDH", "Xe");
        }


        /**/


        [HttpGet]
        public ActionResult CreateDC()
        {
            ViewBag.MaLoaiDC = new SelectList(data.LoaiDoChoiXes.ToList().OrderBy(n => n.TenLoaiDC), "MaLoaiDC", "TenLoaiDC");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateDC(DoChoiXe dcx, FormCollection f, HttpPostedFileBase fFileUpload)
        {

            ViewBag.MaLoaiDC = new SelectList(data.LoaiDoChoiXes.ToList().OrderBy(n => n.TenLoaiDC), "MaLoaiDC", "TenLoaiDC");
            // lưu Sách vào csdl          

            if (fFileUpload == null)
            {
                // nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.ThongBao = "Hãy chọn ảnh bìa.";
                //lưu thông tin để khi load lại trang do yêu cầu
                // chọn ảnh bìa sẽ hiển thị các thông tin này lên trang

                ViewBag.LoaiDC = f["sLoaiDC"];
                ViewBag.TenDC = f["sTenDC"];
                ViewBag.GiaDC = decimal.Parse(f["sGiaDC"]);
                ViewBag.MoTa = f["sMoTa"];
                ViewBag.MaLoaiDC = new SelectList(data.LoaiDoChoiXes.ToList().OrderBy(n => n.TenLoaiDC), "MaLoaiDC", "TenLoaiDC", int.Parse(f["MaLoaiDC"]));
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    // lấy tên file (khai báo thư viện :System.Io
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    // lấy đường dẫn lưu file
                    var path = Path.Combine(Server.MapPath("~/image"), sFileName);
                    // kiểm tra ảnh bìa đã tồn tại chưa để lưu lên thư mục
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    // lưu Sách vào csdl                  
                    dcx.LoaiDC = f["sLoaiDC"];
                    dcx.TenDC = f["sTenDC"];
                    dcx.GiaDC = decimal.Parse(f["sGiaDC"]);
                    dcx.AnhDC = sFileName;
                    dcx.MoTa = f["sMoTa"].Replace("<p>", "").Replace("<p>", "");
                    dcx.NgayCapNhat = Convert.ToDateTime(f["sNgayCapNhat"]);
                    dcx.MaLoaiDC = int.Parse(f["MaLoaiDC"]);

                    data.DoChoiXes.InsertOnSubmit(dcx);
                    data.SubmitChanges();
                    // về lại trang quản lý sách
                    SetAlert("Thêm Thành Công", "success");
                    return RedirectToAction("QLDCX", "Xe");
                }
                return View();
            }
        }


        public ActionResult DetailDC(int? id)
        {
            var dcx = data.DoChoiXes.SingleOrDefault(n => n.MaDC == id);
            if (dcx == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dcx);
        }

        [HttpGet]
        public ActionResult DeleteDC(int? id)
        {
            var dcx = data.DoChoiXes.SingleOrDefault(n => n.MaDC == id);
            if (dcx == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dcx);
        }

        [HttpPost, ActionName("DeleteDC")]
        public ActionResult DeleteDCConfirm(int? id, FormCollection f)
        {
            var dcx = data.DoChoiXes.SingleOrDefault(n => n.MaDC == id);

            if (dcx == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Xóa sách
            data.DoChoiXes.DeleteOnSubmit(dcx);
            data.SubmitChanges();
            SetAlert("Xóa Thành Công", "success");
            return RedirectToAction("QLDCX", "Xe");
        }

        [HttpGet]
        public ActionResult EditDC(int? id)
        {
            var dcx = data.DoChoiXes.SingleOrDefault(n => n.MaDC == id);
            if (dcx == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Hiển thị danh sách chủ đề và nhà xuất bản đồng thời chọn chủ đề và nhà xuất bảncủa cuốn hiện tại
            ViewBag.MaLoaiDC = new SelectList(data.LoaiDoChoiXes.ToList().OrderBy(n => n.TenLoaiDC), "MaLoaiDC", "TenLoaiDC", dcx.MaLoaiDC);
            return View(dcx);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditDC(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var dcx = data.DoChoiXes.SingleOrDefault(n => n.MaDC == int.Parse(f["sMaDC"]));
            ViewBag.MaLoaiDC = new SelectList(data.LoaiDoChoiXes.ToList().OrderBy(n => n.TenLoaiDC), "MaLoaiDC", "TenLoaiDC", dcx.MaLoaiDC);

            if (ModelState.IsValid)
            {
                if (fFileUpload != null) //Kiểm tra để xác nhận cho thay đổi ảnh bìa
                {
                    //Lấy tên file (Khai báo thư viện: System.IO)
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    //Lấy đường dẫn lưu file
                    var path = Path.Combine(Server.MapPath("~/image"), sFileName);
                    //Kiểm tra file đã tồn tại chưa
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    dcx.AnhDC = sFileName;
                }
                //Lưu Sach vào CSDL
                dcx.MaDC = int.Parse(f["sMaDC"]);
                dcx.LoaiDC = f["sLoaiDC"];
                dcx.TenDC = f["sTenDC"];
                dcx.GiaDC = decimal.Parse(f["sGiaDC"]);
                dcx.MoTa = f["sMoTa"].Replace("<p>", "").Replace("<p>", "");
                dcx.NgayCapNhat = Convert.ToDateTime(f["dNgayCapNhat"]);
                dcx.MaLoaiDC = int.Parse(f["MaLoaiDC"]);

                data.SubmitChanges();
                //Về lại trang Quản lý sách
                SetAlert("Sửa Thành Công", "success");
                return RedirectToAction("QLDCX", "Xe");
            }
            return View(dcx);
        }




        [HttpGet]
        public ActionResult DeleteDHDC(int? id)
        {
            var dhdc = data.ChiTietDonDatHangDCs.SingleOrDefault(n => n.STT == id);
            if (dhdc == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dhdc);
        }

        [HttpPost, ActionName("DeleteDHDC")]
        public ActionResult DeleteDHDCConfirm(int? id, FormCollection f)
        {
            var dhdc = data.ChiTietDonDatHangDCs.SingleOrDefault(n => n.STT == id);
            if (dhdc == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.ChiTietDonDatHangDCs.DeleteOnSubmit(dhdc);
            data.SubmitChanges();

            SetAlert("Xóa Thành Công", "success");
            return RedirectToAction("QLDHDCX", "Xe");
        }

        [HttpGet]
        public ActionResult EditDHDC(int? id)
        {
            var dhdc = data.ChiTietDonDatHangDCs.SingleOrDefault(n => n.STT == id);
            if (dhdc == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dhdc);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditDHDC(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var dhdc = data.ChiTietDonDatHangDCs.SingleOrDefault(n => n.STT == int.Parse(f["sSTT"]));
            //Lưu Sach vào CSDL
            dhdc.STT = int.Parse(f["sSTT"]);
            dhdc.MaDonHangDC = int.Parse(f["sMaDonHangDC"]);
            dhdc.MaKH = int.Parse(f["sMaKH"]);
            dhdc.TenDC = f["sTenDC"];
            dhdc.GiaDC = decimal.Parse(f["sGiaDC"]);
            dhdc.NgayDat = DateTime.Now;
            dhdc.SoLuong = int.Parse(f["sSoLuong"]);

            data.SubmitChanges();
            //Về lại trang Quản lý sách
            SetAlert("Sửa Thành Công", "success");

            return RedirectToAction("QLDHDCX", "Xe");
        }


        [HttpGet]
        public ActionResult CreateDHDC()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateDHDC(ChiTietDonDatHangDC ctdhdc, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            // lưu Sách vào csdl

            ctdhdc.MaDonHangDC = int.Parse(f["sMaDonHangDC"]);
            ctdhdc.MaKH = int.Parse(f["sMaKH"]);
            ctdhdc.TenDC = f["sTenDC"];
            ctdhdc.GiaDC = decimal.Parse(f["sSoLuong"]);
            ctdhdc.NgayDat = DateTime.Now;
            ctdhdc.SoLuong = int.Parse(f["sSoLuong"]);


            data.ChiTietDonDatHangDCs.InsertOnSubmit(ctdhdc);
            data.SubmitChanges();
            // về lại trang quản lý sách
            SetAlert("Thêm Thành Công", "success");
            return RedirectToAction("QLDHDCX", "Xe");
        }
    }
}