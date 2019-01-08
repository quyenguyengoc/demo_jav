$(document).on('click', '#words-import-btn', function() {
  $('#upload-words-btn').click();
});

$(document).on('change', '#upload-words-btn', function() {
  $(this).parent().submit();
})
