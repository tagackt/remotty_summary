<% @timeline.each do |comment| %>
$('.js-comments').append("<%= j render 'comment', comment: comment %>")
<% end %>
<% if @last_commented_at.present? %>
$('.js-more-link').replaceWith("<%= j link_to 'more', root_url(from: @last_commented_at), remote: true, class: 'js-more-link' %>")
<% else %>
$('.js-more-link').remove()
<% end %>
