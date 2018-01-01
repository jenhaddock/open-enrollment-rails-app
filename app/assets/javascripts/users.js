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
        let newDependent = new Dependent(dependent)
        let dependentHTML = newDependent.formatDependent()
        $ul.append(dependentHTML)
    //    $ul.append("<li>" + dependent.name + " | " + dependent.relation +  "</li>")
      })
    })
    e.preventDefault();
  })
})

function Dependent(dependent){
  this.id = dependent.id
  this.name = dependent.name
  this.relation = dependent.relation
  this.user_id = dependent.user_id
}

Dependent.prototype.formatDependent = function() {
  let dependentHTML = `<li> ${this.name} | ${this.relation} </li>`
  return dependentHTML
}
