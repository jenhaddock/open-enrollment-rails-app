$(function(){
  $("a.user_index").on("click", function(e){
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
