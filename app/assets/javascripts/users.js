const deductionCodeObj = {};

$(function(){
  $.get('deductions').success(function(json){
    json.forEach(function(deduction_code){
      deductionCodeObj[deduction_code.id] = deduction_code;
    })
  })
})

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

function Deduction(deduction_details){
  this.deduction_id = deduction_details.deduction_id
  this.user_id = deduction_details.user_id
  this.percentage = deduction_details.percentage
}

Deduction.prototype.formatDeduction = function() {
  var dedCode = deductionCodeObj[this.deduction_id]
  if (dedCode.is_flat === true){
  //  let flatDeductionHTML = `<li> ${dedCode.name} | ${dedCode.amount}  </li>`
  //  return flatDeductionHTML
  } else {
  //  let percentDeductionHTML = `<li> ${dedCode.name} | ${this.percentage} </li>`
  //  return percentDeductionHTML
  }
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
