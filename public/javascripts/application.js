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
  
  $('.rating-read-only').each(function(i, elt){
    var jqElt = $(elt);
    var val = parseFloat(jqElt.text());
    jqElt.html('');
    jqElt.raty({
      readOnly: true,
      half: true,
      path: '/javascripts/jquery-raty/img/',
      start: val
    });
  });
  
  $('.ui-button').button();
  
  $('.toggle-edit').click(function(){
    toggleEdit();
  });
  
  $('img.favicon').error(function(){
    // hide missing favicons
    $(this).hide();
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
