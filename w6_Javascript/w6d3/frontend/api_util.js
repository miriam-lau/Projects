const APIUtil = {
  followUser: (id) => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'POST',
      dataType: 'json',
      data: {
        followee_id: "user_id"
      }
    });
  },
  unfollowUser: (id) => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'DELETE',
      dataType: 'json',
      data: {
        followee_id: "user_id"
      }
    });
  },
  searchUsers: (queryVal, success) => {
    return $.ajax({
      url: '/users/search',
      type: 'GET',
      dataType: 'json',
      data: {
        user: {
          username: "username"
        }
      }
    });
  }
};

module.exports = APIUtil;
