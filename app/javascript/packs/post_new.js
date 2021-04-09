$(document).on("click", ".add", function () {
  var element = $(".how_to_form .unit:last-child").clone(true);
  var inputList = element[0].querySelectorAll('input[type="text"], text-field');
  for (var i = 0; i < inputList.length; i++) {
    inputList[i].value = "";
  }
  $(".how_to_form .unit").parent().append(element);
});

$(document).on("click", ".del", function () {
  var target = $(this).parent();
  if (target.parent().children().length > 1) {
    target.remove();
  }
});
