$(document).on('turbolinks:load', function () {
  let tabs = $(".user_menu_item");

  function tabChange() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".user_menu_detail").removeClass("show").eq(index).addClass("show");
  }
  tabs.on('click', tabChange);
});
