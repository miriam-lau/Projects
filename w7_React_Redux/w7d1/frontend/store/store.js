import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
//ASK ABOUT THIS

const configureStore = createStore(rootReducer);

export default configureStore;
