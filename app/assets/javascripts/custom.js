
function sumAll(input) {

  if (toString.call(input) !== "[object Array]")
    return false;

  var total = 0;
  for (var i = 0; i < input.length; i++) {
    if (isNaN(input[i])) {
      continue;
    }
    total += Number(input[i]);
  }
  return total;
}

var ready = function() {
  $("form select:required").on("invalid", function() {
    // setTimeout(function() {
    //   alert("Mohon lengkapi Form");

    // }, 500)
  });

  $(".for-sorry").click(function(event) {
    $("#challange").hide();
    $("#sorry").modal();
  });

  // $.action.tableDataTable.activate();

  $('[data-toggle="tooltip"]').tooltip({
    container: 'body'
  });

  if ($('.datepicker').length || $('.timepicker').length || $('.datetimepicker').length || $('.datepickerage').length) {

    $('.datepickerage').bootstrapMaterialDatePicker({
      format: 'DD MMMM YYYY',
      clearButton: true,
      weekStart: 1,
      time: false,
      lang: 'id',
      minDate: new Date("31 Jul 1991"),
      maxDate: new Date("31 Jul 2000")
    });
    setTimeout(function() {
      $('.datepicker').bootstrapMaterialDatePicker({
        format: 'DD MMMM YYYY',
        clearButton: true,
        weekStart: 1,
        time: false,
        lang: 'id'
      });

    }, 500)

    $('.datetimepicker').bootstrapMaterialDatePicker({
      format: 'DD MMMM YYYY HH:mm',
      clearButton: true,
      weekStart: 1,
      time: true,
      lang: 'id'
    });

    $('.timepicker').bootstrapMaterialDatePicker({
      format: 'HH:mm',
      clearButton: true,
      date: false
    });
  }

  // USER END

  setTimeout(function() {
    $(".flash").hide();
  }, 10000);

  $("#collapseFilter")
    .on('hidden.bs.collapse', function(e) {
      $("[href='#collapseFilter']").text("Tampilkan")
      // console.log(e.currentTarget.id)
    })
    .on('shown.bs.collapse', function(e) {
      $("[href='#collapseFilter']").text("Sembunyikan")
    });


  $(".filters form").change(function(event) {


    if ($(event.target).prop('autocomplete') != "off") {
      $(this).find("[type='submit']").click();
      $('#all_users .card').waitMe({
        effect: 'facebook',
        color: "#2196F3"
      });
    }


  });

  // $(".four-zero-four, .bg-four-zero-four").backstretch(
  //   $(".bg").data("bg"), {
  //     fade: 1000,
  //     duration: 8000
  //   });

  
  $("form input, form select").on("keyup mousewheel keypress blur change", function(event) {
    validateLabel($(this))
  });
  $("form input, form select").each(function(index, el) {
    validateLabel($(el))
  });


} //ready

function validateLabel($this){
  if ($this.is(":invalid")) {
      $this.parents(".form-line").addClass('error').addClass('focused');
    } else {
      $this.parents(".form-line").removeClass('error')
    }
}

$(document).ready(ready);
$(document).on('page:change', ready);