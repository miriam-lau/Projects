import * as APIUtil from '../util/sessions_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const login = user => dispatch => {
  return APIUtil.login(user).then(
    currentUser => dispatch(receiveCurrentUser(currentUser)),
    error => dispatch(receiveErrors(error.responseJSON))
  );
};

export const logout = () => dispatch => {
  return APIUtil.logout().then(
    (user) => dispatch(receiveCurrentUser(null))
  );
};

export const signup = (user) => dispatch => {
  return APIUtil.signup(user).then(
    currentUser => dispatch(receiveCurrentUser(currentUser)),
    error => dispatch(receiveErrors(error.responseJSON))
  );
};

export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
});
