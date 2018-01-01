$(function(){
  $("a.user_deductions").on("click", function(e){
    $.get(this.href).success(function(json){
      var $ul = $("div.deductions ul")
      $ul.html("")
      json.forEach(function(deduction_details){
        debugger
      })
    })
    e.preventDefault();
  })
})

$(function(){
  $("a.user_dependents").on("click", function(e){
    $.get(this.href).success(function(json){
      var $ul = $("div.dependents ul")
      $ul.html("")
      json.forEach(function(dependent){
        $ul.append("<li>" + dependent.name + "</li>")
      })
    })
    e.preventDefault();
  })
})
