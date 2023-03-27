using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using PagedList;
using PagedList.Mvc;
using DoAnBanXe.Models;

namespace DoAnBanXe.Areas.Admin.Controllers
{
    public class XeController : Controller
    {
        dbXeMerDataContext db = new dbXeMerDataContext();
        // GET: Admin/Xe
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(db.Xes.ToList().OrderBy(n => n.MaXe).ToPagedList(iPageNum, iPageSize));
        }

        public ActionResult QLCLass(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(db.Classes.ToList().OrderBy(n => n.MaClass).ToPagedList(iPageNum, iPageSize));
        }

        public ActionResult QLPK(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 10;
            return View(db.ChiTietPhuKiens.ToList().OrderBy(n => n.MaPhuKien).ToPagedList(iPageNum, iPageSize));
        }

        public ActionResult QLDH(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 10;
            return View(db.DonDatHangs.ToList().OrderBy(n => n.MaDonHang).ToPagedList(iPageNum, iPageSize));
        }

        public ActionResult QLDCX(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 10;
            return View(db.DoChoiXes.ToList().OrderBy(n => n.MaDC).ToPagedList(iPageNum, iPageSize));
        }

        public ActionResult QLDHDCX(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 10;
            return View(db.ChiTietDonDatHangDCs.ToList().OrderBy(n => n.STT).ToPagedList(iPageNum, iPageSize));
        }
    }
}