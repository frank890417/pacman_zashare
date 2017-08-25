<template lang="pug">
#app.container-fluid
  img.logo(src='static/img/Header/Logo.svg')

  router-view
</template>

<script>
export default {
  name: 'app',
}
</script>

<style lang="sass">
@import url(https://fonts.googleapis.com/earlyaccess/notosanstc.css)
@import "../node_modules/bootstrap/scss/bootstrap.scss"
$colorBlue: #0047BA
$colorOrange: #FF4C00

*
  position: relative

html,body
  background-color: $colorBlue
  color: white
  font-family: 'Noto Sans TC','微軟正黑體', sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  width: 100%
  height: 100%
  margin: 0
  overflow: hidden

body
  $gridColor: rgba(white,0.05)
  background: linear-gradient($gridColor 0%, $gridColor 5% ,transparent 5%, transparent 100%),linear-gradient(90deg,$gridColor 0%, $gridColor 5% ,transparent 5%, transparent 100%)
  background-size: 20px 20px



.gamePad
  position: fixed
  right: 100px
  bottom: 50px
  z-index: 10
  display: flex

  .buttons
    margin-left: 50px
    display: flex
    align-items: flex-end

    img
      filter: brightness(120%)   
  .a
    margin-bottom: 40px
    
  
  .direction
    // position: absolute
    // right: 50px
    // bottom: 100px
    display: flex
    // width: 500px
    // height: 500px
    flex-direction: column
    justify-content: center
    cursor: pointer
    .lr
      display: flex
      .cblock
        width: 50px
        height: 50px
        background-color: white
    img:hover
      opacity: 0.8
  img
    cursor: pointer
  img:hover
    opacity: 0.8
      
      

h1
  font-size: 84px
  font-weight: 900
  margin: 30px 0px
  margin-top: 0px
h2
  font-size: 52px
  margin: 30px 0px
h3
  font-size: 27px
  margin: 30px 0px
  line-height: 43px
h4
  font-size: 24px
  margin: 20px 0px
  line-height: 43px
//h4
  font-size: 84px
//h5
  font-size: 84px
//h6
  font-size: 84px
.prompt
  font-size: 24px
  color: $colorOrange


.logo
  position: fixed
  right: 50px
  top: 50px
  

.dialog
  position: fixed
  width: calc( 100vw - 8vmin )
  // height: 200px
  margin: 4vmin
  left: 0
  box-sizing: border-box

  background-color: white
  bottom: 0
  padding: 5vmin
  z-index: 100

  .colAvator
    img
      max-width: 100%


  .content
    font-size: 28px
    color: #222
    letter-spacing: 1px


  .dailogAction
    position: absolute
    right: -10px
    bottom: -10px
    width: 30px
    cursor: pointer
    &:hover
      opacity: 0.8

  .dialogOption
    cursor: pointer
    &:hover .gamePadBtn
      transform: scale(1.2)
    

  //選單裡面的遊戲按鈕
  .gamePadBtn
    width: 40px
    cursor: pointer
    &:hover
      transform: scale(1.2)

@media screen and (max-width: 800px)
  h1
    font-size: 40px
    font-weight: 900
    margin: 10px 0px
  h2
    font-size: 32px
    margin: 10px 0px
  h3
    font-size: 20px
    margin: 10px 0px
    line-height: 30px
  h4
    font-size: 16px
    margin: 0px 0px
    line-height: 43px

  p
    line-height: 25px

  .dialog
    .content
      font-size: 18px
      line-height: 30px

  .row_indexRightplace
    position: fixed
    left: 10px
    top: 10px

  .sceneIndex
    
  .gamePad
    transform: scale(0.7)
    right: 0px
    bottom: 0px

  .logo
    right: 20px
    top: 20px
    width: 40vmin
  
  .sceneGrave
    .grave
      width: 20vw
    .pacmandead
      width: 15vw

  .sceneDoor
    .door
      max-height: 400px

#app



</style>
