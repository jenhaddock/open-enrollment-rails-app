$(function(){
  $("a.user_index").on("click", function(e){
    $.ajax({
      method: 'GET',
      url: this.href
    }).done(function(response){
      $("div.users").html(response)
    });
    e.preventDefault();
  })
})
