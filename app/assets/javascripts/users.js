$(function(){
  $("a.user_index").on("click", function(e){
      $.getJSON(this.href).done(function(json){
        var $ol = $("div.users ol")
        $ol.html("")

        json.forEach(function(user){
          $ol.append(<"li"> + <%= link_to user.email, user_path(user.id)%> | Total Deductions: <%= number_to_currency(total_deductions(user.id)) %> + "</li>");
          debugger
        })
      })
    e.preventDefault();
  })
})
