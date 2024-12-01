$(document).on('click', '#schedBtn', function () {

// alert("Schedule");
return
$.post({
url: base_url + 'create_order/service/Create_order_service/save_order',
// selector: '.form-control',
success:function(e)
    {
        var e = JSON.parse(e);
        if(e.has_error == false){
            // $('#modal-default').modal('hide');
            // toastr.success(e.message);
            // $('#save').css('display','none');
            // $('#bill').css('display','inline');
            // $('#proceed_payment').css('display','block');
            // $('.form-control').attr('disabled','disabled');
            // $('.btn_add_item').attr('disabled','disabled');
            
            // $('#proceed_payment').click(function() {
            //     window.location.href = base_url+"point_of_sale/payment/?custid="+$('#cust_id').val()+'&oid='+e.id;
            // });

        } else {
        //   $('#List').attr('class', 'form-control inpt is-invalid');
        //   $('#modal-default').modal('hide');
        //   toastr.error(e.message); 
        }
},
})

}); 
$(document).on('click', '#logoutBtn', function () {

// alert("Logout");
return
$.post({
url: base_url + 'create_order/service/Create_order_service/save_order',
// selector: '.form-control',
success:function(e)
    {
        var e = JSON.parse(e);
        if(e.has_error == false){
            // $('#modal-default').modal('hide');
            // toastr.success(e.message);
            // $('#save').css('display','none');
            // $('#bill').css('display','inline');
            // $('#proceed_payment').css('display','block');
            // $('.form-control').attr('disabled','disabled');
            // $('.btn_add_item').attr('disabled','disabled');
            
            // $('#proceed_payment').click(function() {
            //     window.location.href = base_url+"point_of_sale/payment/?custid="+$('#cust_id').val()+'&oid='+e.id;
            // });

        } else {
        //   $('#List').attr('class', 'form-control inpt is-invalid');
        //   $('#modal-default').modal('hide');
        //   toastr.error(e.message); 
        }
},
})

}); 
$(document).on('click', '#profBtn', function () {

// alert("Profile");
return
$.post({
url: base_url + 'mobile/Mobile/student_profile',
// selector: '.form-control',
success:function(e)
    {
        var e = JSON.parse(e);
        if(e.has_error == false){
            // $('#modal-default').modal('hide');
            // toastr.success(e.message);
            // $('#save').css('display','none');
            // $('#bill').css('display','inline');
            // $('#proceed_payment').css('display','block');
            // $('.form-control').attr('disabled','disabled');
            // $('.btn_add_item').attr('disabled','disabled');
            
            // $('#proceed_payment').click(function() {
            //     window.location.href = base_url+"point_of_sale/payment/?custid="+$('#cust_id').val()+'&oid='+e.id;
            // });

        } else {
        //   $('#List').attr('class', 'form-control inpt is-invalid');
        //   $('#modal-default').modal('hide');
        //   toastr.error(e.message); 
        }
},
})

}); 