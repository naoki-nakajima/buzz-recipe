$(document).on('turbolinks:load', function () {
  let links = $(".shop_management_list");

  function linkChange() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = links.index(this);

    $(".shop_management_right").removeClass("show").eq(index).addClass("show");
  }
  links.on('click', linkChange);
});

