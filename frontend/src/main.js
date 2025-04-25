import { createApp } from 'vue'
import './style.css'
import 'viewerjs/dist/viewer.css'
import App from './App.vue'
import Viewer from 'v-viewer'
import AOS from 'aos';
import 'aos/dist/aos.css';

const app = createApp(App)

AOS.init();
app.use(Viewer)
app.mount('#app')
