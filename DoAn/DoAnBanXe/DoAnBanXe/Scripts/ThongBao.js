$(document).ready(function(e) {
    $('.click_ajax').click(function(){
        var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        var mobile = $('#sDienThoai').val();
        if(isEmpty($('#sHoTen').val(), "Bạn Hãy Nhập Họ và Tên !!!"))
        {
            $('#sHoTen').focus();
            return false;
        }
        if(isEmpty($('#sDiaChi').val(), "Bạn Hãy Nhập Địa Chỉ !!!"))
        {
            $('#sDiaChi').focus();
            return false;
        }
        if(mobile !==''){
            if (vnf_regex.test(mobile) == false) 
            {
                alert('Số điện thoại của bạn không đúng định dạng!');
            }
        }else{
            alert('Bạn chưa điền số điện thoại!');
        }
        
        if(isEmpty($('#sEmail').val(), "Bạn Hãy Nhập Email !!!"))
        {
            $('sEmail').focus();
            return false;
        }
        if(isEmail($('#sEmail').val(), "Email Bạn Vừa Nhập Không Hợp Lệ !!!"))
        {
            $('#sEmail').focus();
            return false;
        }
        $.ajax({
            type:'post',
            url:$(".frm").attr('action'),
            data:$(".frm").serialize(),
            dataType:'json',
            beforeSend: function() {
                $('.thongbao').html('<p><img src="images/loader_p.gif"></p>');     
            },
            error: function(){
                add_popup('Hệ thống bị lỗi, xin quý khách chuyển sang mục khác.');
            },
            success:function(kq){
                add_popup(kq.thongbao);
                $('#capcha').val('');
                if(kq.nhaplai=='nhaplai')
                {
                    $(".frm")[0].reset();
                }
                
                
            }
        });
    });    
});