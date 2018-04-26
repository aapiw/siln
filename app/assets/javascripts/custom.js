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
  $(".lock input").removeProp('required');

  $("#sk_submission_year").change(function(event) {
      // console.log($(this).val());
      sk_submission_id = $(this).data('sk-submission-id');
      console.log(sk_submission_id);
      $.ajax({
          url: '/sk_submissions/'+sk_submission_id+'/teachers_based_on_year/'+$(this).val(),
          type: 'GET',
          dataType: 'script'
        })
        .done(function(data) {
        	data = JSON.parse(data)
          $('#select_teachers_based_on_year').empty();
        	if (data) {
        		$.each(data, function(index, val) {
        			newOption = "<option value='"+val[1]+"'>"+val[0]+"</option>"
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
    
  });

} //end ready


$(document).ready(ready);
$(document).on('page:change', ready);