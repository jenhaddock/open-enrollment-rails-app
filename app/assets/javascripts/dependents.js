$(function(){
  $("a.user_dependents").on("load", function(e){
    debugger
    $.get(this.href).success(function(json){
      var $ul = $("div.dependents ul")
      $ul.html("")
      json.forEach(function(dependent){
        let newDependent = new Dependent(dependent)
        let dependentHTML = newDependent.formatDependent()
        $ul.append(dependentHTML)
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
