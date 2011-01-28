// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var edit_mode = false;

function makeEditable(model) {
  $('.edit').each(function(){
    var self = $(this);
    var name = model + '[' + self.attr('id') + ']';
    self.editable(window.location.toString(), {
      method: 'PUT',
      name: name
      /*
      data: function(value, settings) {
        // Remove surrrounding anchor tags
        return value.replace(/<\/?a[^>]*>/gi, '');
      }
      */
    });
  });
  
  toggleEdit();
}

function toggleEdit() {
  if (edit_mode) {
    $('.edit').removeClass('active').editable('disable');
    $('.toggle-edit').removeClass('active');
  } else {
    $('.edit').addClass('active').editable('enable');
    $('.toggle-edit').addClass('active');
  }
  edit_mode = !edit_mode;
}

$(function() {
  $('.toggle-edit').click(function(){
    toggleEdit();
  });
});
