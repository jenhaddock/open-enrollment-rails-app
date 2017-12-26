$(function(){
  $("a.user_index").on("click", function(e){
//    $.ajax({
//      method: 'GET',
//      url: this.href
//    }).done(function(response){
//      $("div.users").html(response)
      $.get(this.href).success(function(json){
        var $ol = $("div.users ol")
        $ol.html("")

        json.forEach(function(user){
          $ol.append("<li>" + user.content + "<li>");
        })
      })
    e.preventDefault();
  })
})
