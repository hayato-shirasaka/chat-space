$(function() {
  $("#new_message").on('submit', function(e) {
    e.preventDefault();
    var form = $("#new_message").get(0);
    var formData = new FormData(form);

    $.ajax(window.location.href ,{
      type: 'POST',
      dataType: 'json',
      data: formData,
      processData: false,
      contentType: false,
    })
    .done(function(data) {
      $(".chat__message--display").append(addHTML(data));
      $("#message_body").val("");
    })
    .fail(function(data) {
      alert("エラーが発生しました")
    });
    return false
  });
    function addHTML(data) {
    message =
      "<div class = 'message-display'>" +
        "<div class = 'message-user'>"  +
          data.name                     +
        "</div>"                        +
        "<div class = 'message-time'>"  +
          data.created_at               +
        "</div>"                        +
        "<div class = 'message-text'>"  +
          data.body                     +
        "</div>"                        +
      "</div>";
      return message;
  }
  });
