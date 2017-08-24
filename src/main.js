// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import {TweenMax, Power2, TimelineLite} from "gsap"
//import Modernizr from 'modernizr'
//window.Modernizr=Modernizr
// import Bootstrap from 'bootstrap'
// import jQuery from 'jquery'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
