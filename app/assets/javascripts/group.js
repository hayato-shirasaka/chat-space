$(function() {

  $('#chat-group_user').on('keyup', function() {
    var input = $(this).val();
    var preWord;
    $("#user-search-result").empty();
    if ( input !== preWord && input.length !== 0) {
      $.ajax({
        type: 'GET',
        url: '/users.json',
        data: { name: input},
        dataType: 'json'
      }).done(function(data) {
        searchUser(data);
        getUserInfo();
      });
    }

// 入力したユーザー表示
    function addUser(data){
      var html =
      '<div class="chat-group-user clearfix">' +
        '<p class="chat-group-user__name">'+
          data.name +
        '</p>' +
        '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + data.id + '" data-user-name="' + data.name + '">追加'+
        '</a>' +
      '</div>';
      $("#user-search-result").append(html);
    }

    function searchUser(users){
      $("#user-search-result").empty();
      $.each(users, function(i, user){
        addUser(user);
      })
    }

// クリックしたユーザーの取得
    function getUserInfo(){
      $(".chat-group-user__btn--add").on('click', function(){
        var id = $(this).data("user-id");
        var name = $(this).data("user-name");
        var user = $(this).parent();
        user.remove();
        addUserInfo(id, name);
      })
    }

// ユーザー追加
    function addUserInfo(id, name){
      var appendedHtml =
      '<div class="chat-group-user">'+
        '<input name="group[user_ids][]" type="hidden"' + 'value=' + id + '>'+
        '<p class="chat-group-user__name">'+
          name +
        '</p>' +
        '<a class="user-search-remove ' + 'chat-group-user__btn chat-group-user__btn--remove"' + 'data-user-id=' + id + '>削除' +
        '</a>'+
      '</div>';
      $("#chat-group-users").append(appendedHtml);
    }

  // ユーザー削除機能
    $("#chat-group-users").on('click','.chat-group-user',function(){
      $(this).remove();
    })
  });
});
