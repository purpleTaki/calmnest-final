// $(".btn-status").click(function () {
$(document).on("click", ".btn-status", function () {
  if (confirm("Would you like to confirm this action???")) {
    $.post({
      url: "appointment/Appointment_service/update_status",
      data: {
        ID: $(this).data("id"),
        status: $(this).data("stat"),
        // remarks: $("#remarks").val()
      },
      success: function (e) {
        var e = JSON.parse(e);
        if (e.has_error == false) {
          if (e.stat == 1) {
            alert("Appointment status is set to : Approved");
            // window.location.reload();
          } else if (e.stat == 0) {
            alert("Appointment status is set to : Pending");
            // window.location.reload();
          } else if (e.stat == 2) {
            alert("Appointment status is set to : Cancelled");
            // window.location.reload();
          }
        } else {
          alert("error");
        }
      },
    });
  } else {
    return;
  }
});

$(".btn-modal").click(function () {
  var ID = $(this).data("id");
  var status = $(this).data("stat");
  console.log(ID + " " + status);
  $("#idd").val(ID);
  $("#statt").val(status);
});

$(document).on("click", ".btn-update-stat", function () {
  const stat = $(this).data("stat");
  const id = $(this).data("id");
  let remarks = "";

  // Set remarks automatically based on the status
  if (stat === 1) {
      remarks = "Approved";
  } else if (stat === 0) {
      remarks = "Pending";
  } else if (stat === 2) {
      remarks = "Declined";
  }

  // Confirm action
  if (confirm(`Are you sure you want to set the status to: ${remarks}?`)) {
      $.post({
          url: "appointment/Appointment_service/update_status",
          data: {
              ID: id,
              status: stat,
              remarks: remarks,
          },
          success: function (response) {
              const result = JSON.parse(response);
              if (result.has_error === false) {
                  alert(`Appointment status is set to: ${remarks}`);
                  window.location.reload();
              } else {
                  alert("Error updating status.");
              }
          },
      });
  }
});