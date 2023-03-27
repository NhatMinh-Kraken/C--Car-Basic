using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace DoAnBanXe.Models
{
    public class LaiThu1
    {
        public string sTenTK { get; set; }

        [Key]

        public int sMaKH { get; set; }



        [Required(ErrorMessage = "Họ Tên Không Được Để Trống !!!")]
        public string sHoTen { get; set; }

        [Required(ErrorMessage = "Điện Thoại Không Được Để Trống !!!")]
        public string sDienThoai { get; set; }

        [Required(ErrorMessage = "Địa Chỉ Không Được Để Trống !!!")]
        public string sDiaChi { get; set; }

        [Required(ErrorMessage = "Email Không Được Để Trống !!!")]
        [EmailAddress(ErrorMessage = "Email Không Đúng Định Dạng !!!")]
        public string sEmail { get; set; }


        public Nullable<int> MaClass { get; set; }

        [Required(ErrorMessage = "Bạn Hãy Chọn Loại Xe Mình Muốn !!!")]
        public string TenClass { get; set; }

        public Nullable<int> MaXe { get; set; }

        [Required(ErrorMessage = "Bạn Hãy Chọn Tên Xe Mình Muốn !!!")]
        public string TenXe { get; set; }
    }
}
