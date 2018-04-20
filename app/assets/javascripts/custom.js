function validateLabel($this){
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
	
	$("form input:required, form select:required, form textarea:required ").on('keyup paste mousewheel keypress blur change', function(e) {
		validateLabel($(this))
	});
	$("form input:required, form select:required, form textarea:required").siblings('label').append("<span class='required'> (harus diisi)</span>");

}//end ready


$(document).ready(ready);
$(document).on('page:change', ready);