$(function (){
  $(".newDependent").on("click", function(e){
    e.preventDefault();
    newRecord = {
      name: dependent_name.value,
      relation: dependent_relation.value,
      user_id: hidden.value
    };
    $.ajax({
      type: "POST",
      url: this.action,
      data: {
         dependent:newRecord
      },
      dataType: "json",
      success: function(data){
        var $ul = $("div.dependents ul")
        let newDependent = new Dependent(newRecord)
        let dependentHTML = newDependent.formatDependent()
        $ul.append(dependentHTML)
        dependent_name.value = ""
        dependent_relation.value = ""
      }
    })
  })
})
