$(function () {

  var search_list = $(".top_images");

  function appendPost(post) {
    var html = `
                  <li>
                    <div class="image_container">
                      <p class="img">
                        <%= link_to(post_path(post)) do %>
                          <%= image_tag post.photos.first.image.url(:medium), class: "img_top" %>
                        <% end %>
                      </p>
                    </div>
                    <div class="profile clearfix">
                      <div class="content clearfix">
                        <div class="left_icon">
                          <%= image_tag avatar_url(current_user), class: "profile_icon" %>
                        </div>
                        <div class="right_name">
                          <div class="name">
                          </div>
                        </div>
                      </div>
                      <div class="btn_block">
                        <div class="btn_like">
                          <div class="btn">
                            <%= link_to "いいね!する" %>
                          </div>
                        </div>
                      </div>
                    </div>
                  </li>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class="name">${msg}</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function () {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
      .done(function (posts) {
        search_list.empty();
        if (posts.length !== 0) {
          posts.forEach(function (post) {
            appendPost(post);
          });
        }
        else {
          appendErrMsgToHTML("一致するレシピはありません");
        }
      })
      .fail(function () {
        alert('error');
      });
  });
});
