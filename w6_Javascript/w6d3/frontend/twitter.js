const FollowToggle = require('./follow_toggle');

$(function() {
  $("button.follow-toggle").each(function(i, el) {
    new FollowToggle(el);
  });
});
