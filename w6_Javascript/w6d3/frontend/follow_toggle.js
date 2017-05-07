const APIUtil = require("./api_util");

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");

    this.render();

    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollowing") {
      this.$el.prop("disabled", true);
      this.$el.html("Unfollowing");
    } else if (this.followState === "following") {
      this.$el.prop("disabled", true);
      this.$el.html("Following");
    } else if (this.followState === "unfollowed") {
      this.$el.prop("disabled", false);
      this.$el.html("Follow!");
    } else if (this.followState === "followed") {
      this.$el.prop("disabled", false);
      this.$el.html("Unfollow!");
    }
  }
  // if (this.followState === "unfollowed") {
  //   this.$el.html("Follow!");
  // } else {
  //   this.$el.html("Unfollow!");
  // }

  handleClick(event) {
    event.preventDefault();

    let that = this;

    const success = function() {
      if (that.followState === "following") {
        console.log("Follow successful");
        that.followState = "followed";
      } else if (that.followState === "unfollowing") {
        console.log("Unfollow successful");
        that.followState = "unfollowed";
      }
      that.render();
    };

    if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId)
        .then((success).bind(this))
        .fail(function(err) {
          console.log(err);
      });
    } else if (this.followState === "followed") {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId)
        .then((success).bind(this))
        .fail(function(err) {
          console.log(err);
      });
    }
  }
}

module.exports = FollowToggle;
