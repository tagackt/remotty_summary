<% @timeline.each do |comment| %>
$('.js-comments').append("<% j render 'comment', comment: comment %>")
<% end %>
<% if @timeline.count == 20 %>
$('.js-more-link').replaceWith("<% j link_to 'more', root_url(from: last_comment['created_at']), remote: true, class: 'js-more-link' %>")
<% else %>
$('.js-more-link').remove()
<% end %>
