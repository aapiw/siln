function validateLabel($this) {
  if ($this.is(":invalid")) {
    $this.addClass('is-invalid');
    $this.removeClass('is-valid')
  } else {
    $this.removeClass('is-invalid')
    $this.addClass('is-valid')
  }
}
// end function

var ready = function() {
  $('#bootstrap-data-table').DataTable();

  $("form input:required, form select:required, form textarea:required ").on('keyup paste keypress blur change', function(e) {
    validateLabel($(this))
  });

  $("form input:required, form select:required, form textarea:required").siblings('label').append("<span class='required'> (harus diisi)</span>");
  $("form input[type='file']:required").siblings('label').append("<span class='required'> (max:3 Mb) (format: JPG,PNG,PDF)</span>");

  $(".standardSelect").chosen({
    disable_search_threshold: 10,
    no_results_text: "Maaf, tidak ditemukan!",
    width: "100%"
  });

  $(".standardSelect:required").siblings(".chosen-container").prepend("<label id='message'><span class='required'> (harus diisi)</span></label>")

  $(".lock input, .lock select ").removeProp('required');

  $("#active_year").change(function(event) {
    var id = $(this).data('id');
    // console.log(id);
    if (id != "") {
      if ($(this).data('type') == "sk") {
        var url = '/sk_submissions/' + id + '/teachers_based_on_year/' + $(this).val();
      } else {
        var url = '/extension_submissions/' + id + '/teachers_based_on_year/' + $(this).val();
      }
      $.ajax({
          url: url,
          type: 'GET',
          dataType: 'script',
        })
        .done(function(data) {
          data = JSON.parse(data)
          $('#select_teachers_based_on_year').empty();
          if (data) {
            $.each(data, function(index, val) {
              newOption = "<option value='" + val[1] + "'>" + val[0] + "</option>"
              $('#select_teachers_based_on_year').append(newOption);
            });
          }
          $('#select_teachers_based_on_year').trigger("chosen:updated");
          console.log("success");
        })
        .fail(function() {
          console.log("error");
        })
        .always(function() {
          console.log("complete");
        });
    } else {
      $('#select_teachers_based_on_year').empty();
      $('#select_teachers_based_on_year').trigger("chosen:updated");
    }
  });

  $("#teacher_filter").change(function(event) {
    $(this).find("input[type=submit]").click();
  });

  $(document).on('ajax:send', function(event, xhr, settings) {
    $('.waitme .content').waitMe({
      effect: 'facebook',
      color: "#2196F3"
    });
  }).on('ajax:complete', function(event, xhr, settings) {
    // console.log("complete");
  });

} //end ready

$(document).ready(ready);
$(document).on('page:change', ready);