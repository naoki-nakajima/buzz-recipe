$(document).on('turbolinks:load', function () {
  let tabs = $(".menu_item");

  function tabChange() {
    // 全てのactiveクラスのうち、最初の要素を削除
    $(".active").removeClass("active");

    // クリックしたタブにactiveクラスを追加
    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".menu_detail").removeClass("show").eq(index).addClass("show");
  }

  // タブがクリックされたら関数を呼び出す
  tabs.on('click', tabChange);
});

$(function () {
  $(".more_shop_info").on("click", function () {
    $(this).toggleClass("on-click");
    $(".info_hide").slideToggle(500);
  });
});

$(function () {
  $(".more_hours").on("click", function () {
    $(this).toggleClass("on-click");
    $(".shop_hour").slideToggle(500);
  });
});





