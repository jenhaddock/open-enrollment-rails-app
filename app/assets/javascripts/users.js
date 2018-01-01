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
  $.get(`deduction/${deduction.deduction_id}`).success(function(json){
    json.forEach(function(deduction_code){
      this.name = deduction_code.name
      this.is_percentage = deduction_code.is_percentage
      this.is_flat = deduction_code.is_flat
      this.amount = deduction_code.amount
    })
  })
  this.id = deduction.id
  this.percentage = deduction.percentage
}

Deduction.prototype.formatDeduction = function() {
  let deductionHTML = ``
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
