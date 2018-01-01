$(function(){
  $("a.load_deductions").on("click", function(e){
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){
      $("div.deductions").html(response)
    });
    e.preventDefault();
  })
})
