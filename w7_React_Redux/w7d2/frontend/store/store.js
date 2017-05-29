import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunk from '../middleware/thunk';
//ASK ABOUT THIS

const configureStore = createStore(rootReducer, {}, applyMiddleware(thunk));

export default configureStore;
