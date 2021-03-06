$(document).on('turbolinks:load', function () {
  let tabs = $(".menu_item");

  function tabChange() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".menu_detail").removeClass("show").eq(index).addClass("show");
  }
  tabs.on('click', tabChange);
});


$(document).on('turbolinks:load', function () {
  $(".more_shop_info").on('click', function () {
    var show_text = $(".info_item");
    var small_height = 40;
    var original_height = show_text.css({ height: "auto" }).height();

    if (show_text.hasClass("open")) {
      show_text.height(original_height).animate({ height: small_height }, 300);
      show_text.removeClass("open");
      $(this).text("+ 続きを読む");
    } else {
      show_text
        .height(small_height).animate({ height: original_height }, 300, function () {
          show_text.height("auto");
        });
      show_text.addClass("open");
      $(this).text("- 閉じる");
    }
  });
});


$(document).on('turbolinks:load', function () {
  $(".more_hours").on("click", function () {
    var index = $(".shop_hours>.more_hours").index(this);
    $(this).toggleClass("on-click");
    $(".shop_hour").eq(index).slideToggle(500);
  });
});




$(document).on('turbolinks:load', function () {
  $("#toggle_box").on('click', function () {
    $(this).toggleClass("act");
    //$("#top_images").toggleClass("change");
  });
});

