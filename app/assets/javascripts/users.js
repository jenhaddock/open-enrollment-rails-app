$(function(){
  $("a.user_deductions").on("click", function(e){
    $.get(this.href).success(function(json){
      var $ul = $("div.deductions ul")
      $ul.html("")
      json.forEach(function(deduction_details){
        let newDeduction = new Deduction(deduction_details)
        let deductionHTML = newDeduction.formatDeduction()
        $ul.append(deductionHTML)
      })
    })
    e.preventDefault();
  })
})

function Deduction(deduction){
  debugger
  $.get(`deductions/${deduction.deduction_id}`).success(function(response){
    debugger
    this.name = response.name
    this.is_percentage = response.is_percentage
    this.is_flat = response.is_flat
    this.amount = response.amount
  })
  this.id = deduction.id
  this.percentage = deduction.percentage
}

Deduction.prototype.formatDeduction = function() {
  let deductionHTML = `<li> ${this.name} </li>`
  return deductionHTML
}

$(function(){
  $("a.user_dependents").on("click", function(e){
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
