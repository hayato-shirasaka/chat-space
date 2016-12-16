$(function() {
  $("#new_message").on('submit', function(e) {
    e.preventDefault();
    var form = $("#new_message").get(0);
    var formData = new FormData(form);

    $("#message_image").on('change', function(){
    $(this).parents('#new_message').submit();
    form.reset();
    });

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
      form.reset();
    })
    .fail(function(data) {
      alert("エラーが発生しました")
    });
    return false
  });
    function addHTML(data) {
    if(data.image.image.url != null){
      var addImage = '<br><img src="' + data.image.image.url + '">';
    }else{
      var addImage = '';
    }
      message =
      '<div class = "message-display">'    +
        '<div class = "message-user">'     +
          data.name                        +
        '</div>'                           +
        '<div class = "message-time">'     +
          data.created_at                  +
        '</div>'                           +
        '<div class = "message-text">'     +
          data.body                        +
          addImage                         +
        "</div>"                           +
      "</div>";
      return message;
  }
});
