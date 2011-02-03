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
  $('.toggle-edit').click(function(){
    toggleEdit();
  });
});
