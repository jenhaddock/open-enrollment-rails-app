$(function (){
  $("#newDependent").on("submit", function(e){
    e.preventDefault();
    debugger
    $.ajax({
      type: "POST",
      url: "/dependents/create"
      data: {}
    })
    var $ul = $("div.deductions ul")
    let newDependent = new Dependent(dependent_details)
    let dependentHTML = newDependent.formatDependent()
    $ul.append(dependentHTML)
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
