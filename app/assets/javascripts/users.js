$(function(){
  $("a.user_deductions").on("load", function(e){
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){
      $("div.user_deductions").html(response)
    });
    e.preventDefault();
  })
})
