(function($) {

  $.fn.previewForm = function(options) {
    var form_settings = $.extend({
      identifier: 'label',
      show_password: true,
      extratext: 'Do You Want To submit',
      yes: 'yes',
      no: 'no',
      title: 'Please preview'
    }, options);

    var dia_log;
    var renderBUTTON;
    var this_frm;
    this_frm = $(this);

    $(this).submit(function(e) {
      // var val = $("input[type=submit][clicked=true]").val();
      // var val = $(this).data('button') || $('input[type="submit"]').get(0).name;
      var novalidate = e.currentTarget._ujsData['ujs:formnovalidate-button'];
      if (!novalidate) {
        if ($('#pfomdata').length) {
          return true;
        }


        dia_log = "";
        var needle_cnfrm;

        if (this.id.length > 0) { needle_cnfrm = '#' + this.id + ' label'; } else { needle_cnfrm = '.' + $(this).attr('class') + ' label'; }
        // js-to-indonesia-details
        $(needle_cnfrm).each(function(i, val) {
          if ($(this).text().length > 2) {
            what_t = $('#' + $(this).attr('for'));

            switch (what_t.prop('type')) {
              case 'password':
                if (!form_settings.show_password)
                  dia_log += $(this).text() + " your selected password<br/>";
                else
                  dia_log += $(this).text() + what_t.val() + "<br/>";
                break;
              case 'select-one':
                dia_log += $(this).text() + $('#' + $(this).attr('for') + ' option:selected').text() + "<br/>";
                break;
              case 'radio':
                if (what_t.is(':checked'))
                  // dia_log += $(this).text() + ' ' + what_t.val() + "<br/>";
                  dia_log += $(this).data("name") + ' ' + $(this).text() + "<br/>";
                break;
              case 'checkbox':
                if (what_t.is(':checked'))
                  dia_log += $(this).text() + ' ' + what_t.val() + "<br/>";
                break;
              case 'undefined':
                break;
              default:
                dia_log += $(this).text() + what_t.val() + "<br/>";
                break;

            }
          }
        });
        dia_log = dia_log.replace('undefined', '');


        renderBUTTON = "";
        renderBUTTON += '<a href="javascript:void(0);" class="button btn btn-primary form_yes">' + form_settings.yes + '</a>';
        renderBUTTON += '<a href="javascript:void(0);" class="button btn btn-success form_no">' + form_settings.no + '</a>';

        var renderTemplate = [
          '<div id="previewOverlay">',
          '<div id="previewBox">',
          '<h1>', form_settings.title, '</h1>',
          '<p>', dia_log, '</p>',
          '<p>', form_settings.extratext, '</p>',
          '<div id="previewButtons">',
          renderBUTTON,
          '</div></div></div>'
        ].join('');
        $("body").addClass('no-overflow')
        $(renderTemplate).hide().appendTo('body').fadeIn();

        $(".form_yes").click(function() {
          var input = $("<input>").attr("type", "hidden").attr("id", "pfomdata").val("true");
          this_frm.append($(input));
          this_frm.submit();
        });

        $(".form_no").click(function() {
        $("body").removeClass('no-overflow')
          $('#previewOverlay').fadeOut(function() {
            $(this).remove();
          });
        });

        return false;

      }
    });
  }

})(jQuery);