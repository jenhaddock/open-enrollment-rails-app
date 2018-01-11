$(function (){
  $(".newDependent").on("click", function(e){
    e.preventDefault();
    postUrl = "users/" + hidden.value + "/dependents"
    $.ajax({
      type: "POST",
      url: postUrl,
      data: {
        dependent: {
          name: dependent_name.value,
          relation: dependent_relation.value,
          user_id: hidden.value
        }
      },
      dataType: "json",
      success: function(data){
        var $ul = $("div.dependents ul")
        let newDependent = new Dependent(dependent_name.value, dependent_relation.value)
        let dependentHTML = newDependent.formatDependent()
        $ul.append(dependentHTML)
      }
    })
  })
})

function Dependent(name, relation){
  this.name = name
  this.relation = relation
}

Dependent.prototype.formatDependent = function() {
  let dependentHTML = `<li> ${this.name} | ${this.relation} </li>`
  return dependentHTML
}
