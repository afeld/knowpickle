// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var editMode = false;

function toggleEdit() {
  editMode = !editMode;
  if (editMode) {
    enableEdit();
  } else {
    $('.editable').removeClass('active').editable('disable');
    $('.toggle-edit').removeClass('active');
  }
}

function enableEdit() {
  editMode = true;
  $('.editable').addClass('active').editable('enable');
  $('.toggle-edit').addClass('active');
}

$(function() {
  $('#header #main-navigation > ul').addClass('sf-menu').superfish();
  
  $(".stars-wrapper").stars({inputType: "select"});
  
  $('.toggle-edit').click(function(){
    toggleEdit();
  });
  
  $("form.new_review[data-remote='true']")
    .live('ajax:beforeSend', function(e, xhr, settings){
      // TODO show a spinner
    })
    .live('ajax:success', function(e, data, status){
      // TODO hide form
      $(this).replaceWith(data);
    })
    .live('ajax:error', function(e, xhr, status){
      // TODO insert errors above
      var errorList = "<ul class='errors'>";
      $.each(JSON.parse(xhr.responseText), function(i, error){
        errorList += "<li>" + error + "</li>";
      });
      errorList += "</ul>";
      $(this).prepend(errorList)
    })
    .live('ajax:complete', function(e, xhr, status){
      // TODO hide spinner
    });
});
