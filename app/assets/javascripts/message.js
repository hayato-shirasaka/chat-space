$(function() {
  var body = $(".chat__message--display")

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
      body.append(addHTML(data));
      $("#message_body").val("");
      form.reset();
      scrollToBottom();
    })
    .fail(function(data) {
      alert("エラーが発生しました");
    });
    return false
  });

    $('#message_image').on('change', function(){
      $(this).parents('#new_message').submit();
      form.reset();
    });

    function autoUpdate() {
      $.ajax(window.location.href, {
        type: 'GET',
        dataType: 'json',
      })
      .done(function(data) {
        body.empty();
        for(var i = 0; i < data.length; i++) {
          body.append(addHTML(data[i]));
        }
        scrollToBottom();
      });
    };

    function scrollToBottom() {
      body.animate({ scrollTop: body[0].scrollHeight}, 'normal')
    };

    setInterval(autoUpdate, 5000)


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
