using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnBanXe.Models
{
    public class GioHang
    {
        dbXeMerDataContext db = new dbXeMerDataContext();
        public int MaDC { get; set; }
        public int MaDonHangDoChoi { get; set; }
        public int MaKH { get; set; }
        public string LoaiDC { get; set; }
        public string TenDC { get; set; }
        public double DonGia { get; set; }
        public string AnhDC { get; set; }
        public int MaLoaiDC { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien { get { return SoLuong * DonGia; } }
        public string DiaChi { get; set; }
        public string HoTen { get; set; }
        public string TenTK { get; set; }
        public string DienThoai { get; set; }
        public string Email { get; set; }
        public GioHang(int mdc)
        {

            MaDC = mdc;
            DoChoiXe x = db.DoChoiXes.Single(n => n.MaDC == MaDC);
            LoaiDC = x.LoaiDC;
            TenDC = x.TenDC;
            DonGia = double.Parse(x.GiaDC.ToString()); ;
            AnhDC = x.AnhDC;
            SoLuong = 1;
        }
    }
}