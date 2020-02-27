function save_catelog(){
  var table= $(e.target).closest('table');
  $('td input:checkbox',table).prop('checked',true);
}

$(document).ready(function(){
  $(".check-all").on("change", function(e){
    var table= $(e.target).closest('table');
    $('td input:checkbox',table).prop('checked',this.checked);
  })
});