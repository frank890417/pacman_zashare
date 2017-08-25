<template lang="pug">
.gameIndex
  .gamePad
    .direction
      img.up(src='static/img/GamePad/Button/Up.svg', @click = "press('up')")
      .lr
        img.left(src='static/img/GamePad/Button/Left.svg', @click = "press('left')")
        .cblock
        img.right(src='static/img/GamePad/Button/Right.svg', @click = "press('right')")
      img.down(src='static/img/GamePad/Button/Down.svg', @click = "press('down')")
    .buttons
      img.a(src='static/img/GamePad/Button/A.svg', @click = "press('a')")
      img.b(src='static/img/GamePad/Button/B.svg', @click = "press('b')")
  transition(name="fade")
    .dialog.row(v-if="dialogState")
      .col-3.col-md-2.colAvator
        img.dialogAvatar(:src="dialogAvatar")
      .col-9.col-md-10.colContent
        p.content(v-html="dialogContent")
        img.dailogAction(src="static/img/Dialog/Action.svg",@click="dailogAction")
  transition-group(tag="div", name="fade")
    .sceneIndex.container-fluid(key="index", v-if="gameScene=='index'")
      
      .row.rowIndex
        .col-sm-4.col-12.align-self-end.order-sm-first.offset-sm-0
          img(src="static/img/School.svg").castle
          img.pacman.hidden-sm-up(:src="pacimg")
        .col-sm-8.align-self-center
          h4.row.row_indexRightplace
            .col-1
              img.check(src="static/img/Check.svg")
            .col-10
              p.indexRightplaceText
                span.hidden-sm-down 別懷疑，你沒來錯地方<br>但雜學校募資頁在哪呢？就要靠你自己拿到分數看到了
                span.hidden-sm-up 你沒來錯地方<br>但雜學校募資頁<br>要靠拿高分才能找到（笑
          br
          h1.title 聽說只要拿100分
          h2.title2 人生就會一片光明呢
          h3.start 往左開始進入中華民國教育迷宮<br>盡可能的拿到高分數炫耀吧！！
          .prompt Press A or  
            img(src="static/img/Dialog/Action.svg" style="transform: rotate(180deg) scale(0.7)")
            |  to Start.
          br
          br
          br
          img.pacman.hidden-xs-down(:src="pacimg")

    .sceneGame.container-fluid(key="game",v-if="gameScene=='game'")
      .row
        .col-sm-2.colGameInfo.order-sm-last
          h2 中華民國の教育迷宮
          h3 Score:{{gameScore}}
            br.hidden-xs-down
            img.pacmanlive(src="static/img/Pacman/Normal.svg",
                v-for="l in paclives")
            br.hidden-xs-down
            br.hidden-xs-down
            br.hidden-xs-down
            span.hidden-sm-up &nbsp;&nbsp;|&nbsp;&nbsp;
            img.pacmanlive(:src="'static/img/Graduate/Level'+(cc+1)+'.svg'",
                v-for="cc in completeCount")
          h4.hidden-xs-down 按B回到首頁
        .col-12.col-sm-10.order-sm-first-down
          #pacman


    .sceneGrave.container-fluid(key="game",v-if="gameScene=='grave'")

      .row
        .col-5.col-sm-7
          img.grave(src="static/img/grave.svg")
          img.grave(src="static/img/grave.svg")
          img.pacmandead(src="static/img/Pacman/Dead.svg")
          img.pacmandead(src="static/img/Pacman/Dead.svg")
          br
          br

          img.grave(src="static/img/grave.svg")
          br

          img.grave(src="static/img/grave.svg")
          img.grave(src="static/img/grave.svg")
          img.grave(src="static/img/grave.svg")
          br
          div.hidden-xs-down
            img.grave(src="static/img/grave.svg")
            img.pacmandead(src="static/img/Pacman/Dead.svg")
            img.pacmandead(src="static/img/Pacman/Dead.svg")
            img.pacmandead(src="static/img/Pacman/Dead.svg")
            br

            img.grave(src="static/img/grave.svg")
            img.grave(src="static/img/grave.svg")
            img.grave(src="static/img/grave.svg")
        .col-3.col-sm-2
          img.pacman(:src="pacimg")
        img.grave(src="static/img/grave.svg")
        .col-sm-4
      
          img.grave(src="static/img/grave.svg")
          img.grave(src="static/img/grave.svg")

          img.grave(src="static/img/grave.svg")
          img.pacmandead(src="static/img/Pacman/Dead.svg")
          img.pacmandead(src="static/img/Pacman/Dead.svg")
          br

          img.grave(src="static/img/grave.svg")
          br
          img.grave(src="static/img/grave.svg")
          br
          img.grave(src="static/img/grave.svg")

          br
          br

          img.grave(src="static/img/grave.svg")


    .sceneDoor.container-fluid(key="door",v-if="gameScene=='door'")
      .row
        .col-sm-12
          br
          br
          br
          h1 什麼！？ <br>真虧你能找到這
          h2 下面的門就是了
          br
          h3 你尋覓著，給予跳脫框架者的舞台
          h1 雜學校
          h3 往下一起探索教育的面貌吧!
      .coverBlue
      img.pacman(:src="pacimg")
      img.door(src="static/img/Door.svg")
    .sceneDead.container-fluid(key="dead", v-if="gameScene=='dead'")
      .row
        .col-sm-6
          img.pacmandead(src="static/img/Pacman/Dead.svg")
          br
          h1 你在中華民國教育體制裡
          h2 就這麼失敗了
          h2 重頭來一遍？
          
        .col-sm-6
          h5.pressprompt Press A
            |  to Restart.
</template>

<script>
import PACMAN from '../pacman.js'
import {TweenMax, Power2, TimelineLite} from "gsap"
import $ from "jquery"

window.PACMAN=PACMAN

export default {
  name: 'hello',
  data () {
    return {
      globalTime: 0,
      pacMode: "normal",
      gameScene: "index",
      dialogContent: "",
      dialogQuery: [],
      dialogAvatar: "static/img/Pacman/Normal.svg",
      dialogState: false,
      graveTime: 0,
      canPress: true,
      lastKeycode: -1,
      gameScore: 0,
      pressRecords: [],
      gameInited: false,
      paclives: 2,
      deadtime: 0,
      completeCount: 0
    }
  },
  mounted(){
    window.setScore = this.setScore
    window.dialogCallback = this.dialogCallback
    window.toSceneDead = this.toSceneDead
    window.setlives = this.setlives
    window.eatenPill = this.eatenPill
    window.userCompleteLevel = this.userCompleteLevel
    window.press = this.press

    this.globalTime++
    TweenMax.from(".check",1,{opacity: 0,scale: 2 ,bottom: "-30px"}).delay(1)
    TweenMax.from(".title",2,{opacity: 0,bottom: "-30px"}).delay(1.5)
    TweenMax.from(".title2",1,{opacity: 0,bottom: "-30px"}).delay(2)
    TweenMax.from(".start",1,{opacity: 0,bottom: "-30px"}).delay(3)
    TweenMax.from(".prompt",1,{opacity: 0 ,repeat:-1}).delay(4).repeat()
    TweenMax.from(".pacman",1,{opacity: 0}).delay(5)
    TweenMax.to(".castle",1,{top: "0px",scale: "1.1"}).delay(3)

    let _this = this;
    setInterval(()=>{
      _this.globalTime++
    },100)

    $( "body" ).keydown((event)=> {
      console.log(event.which)
      let _this = this
      let keyLeft = 37
      if (_this.canPress || _this.lastKeycode!=event.which){
        switch(event.which){
          case 38: 
            _this.press("up")
            break;
          case 40: 
            _this.press("down")
            break;
          case 37: 
            _this.press("left")
            break;
          case 39: 
            _this.press("right")
            break;
          case 65: 
            _this.press("a")
            break;
          case 66: 
            _this.press("b")
            break;
          case 13: 
            _this.press("enter")
            break;
        }
        _this.canPress=false;
        _this.lastKeycode=event.which;
        setTimeout(()=>{
          _this.canPress=true;
        },500)
      }

    });
  },
  computed:{
    pacimg(){
      if (this.pacMode == "eating"){
        return `static/img/Pacman/Eat${this.globalTime%3+1}.svg`
      }
      return "static/img/Pacman/Normal.svg"
    }
  },
  methods: {
    startGame(){
      let _this = this
      this.pacMode = "eating"
      TweenMax.to(".pacman",2,{left: "-250px"})
      TweenMax.to(".pacman",1,{opacity: 0}).delay(1)
      this.gameScore=0
      setTimeout(()=>{
        _this.gameScene="game"
        _this.dialogAvatar="static/img/Pacman/Normal.svg",
        _this.dialogQuery.push("我是pacman 我是中華民國的學生",
          "哇，今天是小學開學的日子，媽媽爸爸說我即將進入中華民國的教育迷宮，好興奮><。",
          "媽媽說，只要拿到好分數，以後就會出人頭地，變成成功ㄉ人",
          "所以我一定要拿到很多一百分！"
        )
        _this.dialogQuery.push(()=>{
          PACMAN.init(document.getElementById('pacman'),'static/');

          if (_this.gameInited){

            setTimeout(()=>{
              PACMAN.startLevel();
              console.log("start level")
            },500)
            _this.closeDialog();
          }else{
            _this.gameInited=true
            setTimeout(()=>{
              PACMAN.startNewGame();
              console.log("start game")
            },500)
            _this.closeDialog();
            
          }

        })
        _this.popDialog()
      },2000)
    },
    goGrave(){

      if (this.graveTime==0){
        this.dialogQuery.push({
          avatar: "static/img/Pacman/Grandma.svg",
          content: "乖孫啊你要往下去哪裡？乖乖在家讀書，不要出去亂晃，以後才會有出息，你爺爺會高興的"
        });
        this.popDialog()
      }else if (this.graveTime==1){
        let _this = this
        this.dialogQuery.push({
          avatar: "static/img/Pacman/Normal.svg",
          content: "下面什麼都沒有啊...."
        });
        this.popDialog()
      }else if (this.graveTime==2){
        let _this = this
        
        this.dialogQuery.push({
          avatar: "static/img/Pacman/Normal.svg",
          content: "好可怕啦..好啦我下去看看...."
        }, ()=>{
          _this.pacMode = "eating"
          TweenMax.to(".pacman",0.5,{rotation: "-90deg"})
          TweenMax.to(".pacman",3,{bottom: "-300px"}).delay(1)
          _this.closeDialog()
          setTimeout(()=>{
            _this.gameScene="grave"

            _this.dialogQuery.push({
              avatar: "static/img/Pacman/Normal.svg",
              content: "好可怕...好多墓碑，都是曾經走過來這裡的....不要，媽媽跟我說只要跟大家一樣玩遊戲就會順利的，我們回去玩遊戲，好不好（害怕）"
            });
            _this.dialogQuery.push("按上就可以回去ㄌ，遊戲在上面啊啊啊....")
            _this.graveTime=0
            _this.popDialog()
          },3000)
        }
        );
        this.popDialog()
        
      
      }
        this.graveTime++
      
      
    },
    walkDownGrave(){

      let _this = this
      if (this.graveTime==0){
        _this.dialogQuery.push("我不要繼續走下去喇QQQ")
        _this.dialogQuery.push(()=>{
          TweenMax.to(".pacman",0,{scaleX: 1})
          TweenMax.to(".pacman",2,{left: "-100px"}).delay(0)
          TweenMax.to(".pacman",0,{scaleX: -1}).delay(2)
          TweenMax.to(".pacman",2,{left: "100px"}).delay(2)
          TweenMax.to(".pacman",0,{scaleX: 1}).delay(4)
          TweenMax.to(".pacman",2,{left: "0px"}).delay(4)
        })
        _this.popDialog()
      }else{
        _this.dialogQuery.push("為什麼要繼續走下去QWQQQ")
        _this.dialogQuery.push(()=>{
          _this.pacMode = "eating"
          TweenMax.to(".pacman",0.5,{rotation: "-90deg"})
          TweenMax.to(".pacman",5,{top: "100%"}).delay(1)
          _this.changeScene("door",5)

          setTimeout(()=>{
              
            _this.dialogQuery.push({
              avatar: "static/img/Pacman/Normal.svg",
              content: "居然找到這個地方，那你一定與眾不同"
            });
            _this.dialogQuery.push({
              avatar: "static/img/Pacman/Normal.svg",
              content: "這遊戲，暗喻著中華民國的教育，不斷考高分/破關，一路從小學讀到研究所，卻還是鬼打牆，找不到出口。"
            });
            _this.dialogQuery.push({
              avatar: "static/img/Pacman/Normal.svg",
              content: "人生的出口，也許一直都在，只是我們鼓起勇氣，從一開始就走出框架，踏出教育迷宮外"
            });
            _this.dialogQuery.push({
              avatar: "static/img/Pacman/Normal.svg",
              content: "讓我們往下，一起進入雜學校，探索教育的可能性。"
            });
            _this.popDialog()  
          },6000)
          this.graveTime=0
         
          
        })
        _this.popDialog()
      }
      this.graveTime++
    },

    walkBackGrave(){
      let _this = this
      _this.dialogQuery.push("嗚嗚我們回去了哦，不然走出體制太可怕了")

      _this.dialogQuery.push(()=>{
        _this.pacMode = "eating"
        TweenMax.to(".pacman",0.5,{rotation: "90deg"})
        TweenMax.to(".pacman",2,{top: "-500px"}).delay(1)
        _this.changeScene("index",3)
        _this.closeDialog();
        setTimeout(()=>{
          _this.dialogQuery.push({
            avatar: "static/img/Grandma.svg",
            content: "這才是我的乖孫啊！ 緊去讀冊哦"
          });
          _this.popDialog()
        },3000)
        
      })
      _this.popDialog()
    },

    walkDownDoor(){
      let _this = this
      _this.dialogQuery.push("我們要前往雜學校募資頁啦!!")

      _this.dialogQuery.push(()=>{
        _this.pacMode = "eating"
        TweenMax.to(".pacman",5,{top: "100%"})
        TweenMax.to(".logo",1,{opacity: 0}).delay(4)
        TweenMax.to(".gamePad",1,{opacity: 0}).delay(4)

        TweenMax.to(".coverBlue",1,{opacity: 1}).delay(4)
        //_this.changeScene("empty",5)
        _this.closeDialog()
        
        setTimeout(function() {
          window.location = "http://zashare.org/funding"
        }, 5000);
      })
      _this.popDialog()
    },

    goSecret(){
      let _this = this
      _this.dialogQuery=[];
      _this.dialogQuery.push("什麼！？你居然知道上上下下左左右右ABAB這招（不是嘲笑你年紀的意思)，那就直接帶你去募資頁囉！！")
      _this.dialogQuery.push(()=>{
        _this.pacMode = "eating"
        //TweenMax.to(".pacman",0.5,{rotation: "-90deg"})
        //TweenMax.to(".pacman",5,{top: "100%"}).delay(1)
        _this.changeScene("door",5)
        setTimeout(()=>{
          _this.dialogQuery.push({
            avatar: "static/img/Pacman/Normal.svg",
            content: "哇，居然找到這個地方，那你一定與眾不同"
          });
          _this.popDialog()
          this.graveTime=0
        },500)
        
      })
      _this.popDialog()
    },
    relife(){
      let _this = this
        _this.dialogQuery.push("讓我們重新開始吧... 讀書才有可能變成成功的人呢！")

        _this.dialogQuery.push(()=>{
          _this.pacMode = "eating"
         
          _this.changeScene("index",1)
          _this.closeDialog();

          TweenMax.to(".pacmandead",1,{left: "-200px",opacity: 0})
          TweenMax.to("h1",1,{opacity: 0}).delay(1)
          TweenMax.to("h2",1,{opacity: 0}).delay(1.5)
          
        })
        _this.popDialog()
    },
    press(key){
      if (this.gameScene=="index" && (key=="left" || key=="a") ){
        this.startGame();
      } 
      if (this.gameScene=="index" && (key=="down") ){
        this.goGrave();
      }
      if (this.dialogState && (key=="enter" || key=="a" || key=="right")  ){
        this.dailogAction();
      }
      if (this.gameScene=="grave" && !this.dialogState  && (key=="down")  ){
        this.walkDownGrave();
    }
      if (this.gameScene=="grave" && !this.dialogState  && (key=="up")  ){
        this.walkBackGrave();
      }
      if (this.gameScene=="door" && !this.dialogState  && (key=="down")  ){
        this.walkDownDoor();
      }
      if (this.gameScene=="dead" && !this.dialogState  && (key=="left" || key=="a")  ){
        this.relife();
      }

      if (this.gameScene=="game" && !this.dialogState  && (key=="b")  ){

        this.changeScene("index")
      }
      if (this.gameScene=="game" && !this.dialogState ){
        let kmap = {
          up: 3,
          down: 1,
          left: 2,
          right: 11
        }
        PACMAN.sendkey(kmap[key])
      }

      this.pressRecords.push(key)
      if (this.pressRecords.length>12){
        this.pressRecords.shift();
      }
      if (this.pressRecords.join("/")==["up", "up", "down", "down", "left", "left", "right",'right','a','b','a','b'].join("/")){
        this.goSecret();
      }


      //對話框，嘗試新的可能性
      if (key=="otherRoute"){
        this.goOtherRoute()
      }

      console.log(this.pressRecords)
    },
    dailogAction(){
      if (this.dialogQuery.length>0){
        let next = this.dialogQuery.shift()

        if (typeof next =="string"){
          this.dialogContent=next
        }else if (typeof next =="object"){
          this.dialogContent = next.content
          this.dialogAvatar = next.avatar
          
        }else if (typeof next =="function"){
          next()
        }
        
      }else{
        this.dialogState = false
      }
    },
    popDialog(){
      this.dailogAction()
      this.dialogState=true

    },
    closeDialog(){
      this.dialogState=false
    },
    changeScene(scene,delay){
      let _this = this;
      setTimeout(()=>{
        _this.gameScene = scene
      },delay*1000)
      
    },
    setScore(sc){
      this.gameScore=sc
    },
    setlives(l){
      this.paclives = l
    },
    eatenPill(text,restart=false){
      PACMAN.pauseGame()
      this.dialogQuery.push({
        avatar: "static/img/Pacman/Grandma.svg",
        content: text
      });
      this.dialogQuery.push(()=>{
        this.closeDialog()
        PACMAN.resumeGame()
        if (restart){
          PACMAN.startLevel()
        }

        var PLAYING = 7
        PACMAN.setState(PLAYING)

      })
      this.popDialog()

    },
    dialogCallback(obj,callback=null){
      this.dialogQuery.push(obj);
      if (callback){
        this.dialogQuery.push(()=>{
          callback();
        })
      }
      this.popDialog()

    },
    toSceneDead(deadtext){
      let _this = this
      _this.deadtime++

      //第一次全部死亡 只有提示
      //第二次全部死亡 直接說明

      if (_this.deadtime==1){
        _this.dialogQuery.push({
          avatar: "static/img/Pacman/Normal.svg",
          content: "糟糕 GG惹，連續兩次考不及格被退學了，回家一定被罵死"
        });
        _this.dialogQuery.push({
          avatar: "static/img/Pacman/Normal.svg",
          content: "總覺得...一直在追逐高分鬼打牆啊.."
        });
        _this.dialogQuery.push({
          avatar: "static/img/Pacman/Normal.svg",
          content: deadtext
        });

        _this.dialogQuery.push(()=>{
          
          _this.changeScene("dead",0)
          setTimeout(()=>{
            TweenMax.from(".pressrompt",1,{opacity: 0 ,repeat:-1}).delay(4).repeat()
          },500)
          _this.closeDialog();
          
        })
        _this.popDialog()
      }else if (_this.deadtime>=2){
        _this.goOtherRoute()


      }



      
    },
    userCompleteLevel(){
      let _this = this
      _this.completeCount++;

      if (_this.completeCount==1){
        _this.dialogQuery.push({
          avatar: "static/img/Graduate/Level1.svg",
          content: "小學畢業啦!!! 拿到了藍色的畢業證書"
        });
      }
      if (_this.completeCount==2){
        _this.dialogQuery.push({
          avatar: "static/img/Graduate/Level2.svg",
          content: "國中畢業啦!!! 拿到了綠色的畢業證書"
        });
      }
      if (_this.completeCount==3){
        _this.dialogQuery.push({
          avatar: "static/img/Graduate/Level3.svg",
          content: "高中畢業啦!!! 拿到了粉色的畢業證書"
        });
      }
      if (_this.completeCount==4){
        _this.dialogQuery.push({
          avatar: "static/img/Graduate/Level4.svg",
          content: "大學畢業啦!!! 拿到了紫色的畢業證書"
        });
      }

      if (_this.completeCount==5){
        _this.dialogQuery.push({
          avatar: "static/img/Pacman/Dead.svg",
          content: "研究所畢業啦!!! 啊...啊罵 我失業了..."
        });
      }
      _this.dialogQuery.push({
        avatar: "static/img/Pacman/Normal.svg",
        content: "恭喜你在中華民國教育迷宮裡獲得階段勝利，但人生的成功真的是由分數定義的嗎？"
      });
      _this.dialogQuery.push({
        avatar: "static/img/Pacman/Normal.svg",
        content: "要不要試試從一開始就走不同方向呢？<br><span class='dialogOption' onclick='window.press(\"otherRoute\")'> <img src='static/img/GamePad/Button/A.svg' class='gamePadBtn'> 玩夠了，我要探索分數之外的可能性</span> | <span  class='dialogOption' onclick='window.press(\"a\")'>  <img src='static/img/GamePad/Button/B.svg' class='gamePadBtn'>  不管，我要繼續玩！！</span>"
      });
      _this.dialogQuery.push(()=>{
        PACMAN.startLevel();
      })

      _this.popDialog();
      
    },
    goOtherRoute(){
      let _this = this
      _this.dialogQuery=[];
      _this.dialogQuery.push({
        avatar: "static/img/Pacman/Normal.svg",
        content: "在中華民國教育的迷宮中，無止盡的求高分並沒有出口"
      });
      _this.dialogQuery.push({
        avatar: "static/img/Pacman/Normal.svg",
        content: "我們在不斷的競爭與分數中，迷失了自我，你，還記得自己小時候的夢想嗎？"
      });
      _this.dialogQuery.push({
        avatar: "static/img/Pacman/Normal.svg",
        content: "讓我們，嘗試另一條路，從一開始就走出框架的路"
      });
      _this.popDialog()

      _this.dialogQuery.push(()=>{
        
        _this.changeScene("index",0.5)
        setTimeout(()=>{
          _this.popDialog()
        },500)
                
      })
      _this.dialogQuery.push({
          avatar: "static/img/Pacman/Normal.svg",
          content: "我們回到了首頁，請一直按下，不要管阿嬤的阻止，也不要害怕"
        });    
      _this.dialogQuery.push({
          avatar: "static/img/Pacman/Normal.svg",
          content: "就可以看到教育的大門了"
      });    
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="sass">

$colorBlue: #0047BA
$colorOrange: #FF4C00

.fade-enter-active, .fade-leave-active
  transition: opacity .5s

.fade-enter, .fade-leave-to
  opacity: 0


.pacman
  position: relative

.rowIndex
  height: 100vh

.castle
  width: 100%
  max-width: 400px

.prompt
  font-weight: 900

@media screen and (max-width: 600px)
  .pacman
    max-width: 15vw

.sceneIndex
  @media screen and (max-width: 600px)
    .pacman
      position: absolute
      right: 5vw
      bottom: 0
      max-width: 15vw
    .castle
      left: 0
      max-height: 20vh
      width: initial
    .rowIndex
      height: initial
      padding-top: 16vh
      
.sceneGame
  @media screen and (max-width: 600px)
    .col-sm-2
      margin-top: 40px
      font-size: 22px
  .pacmanlive
    width: 8vw 
    max-width: 50px
    margin-right: 20px
    display: inline-block
  
  


.sceneDoor
  height: 100vh
  .door
    position: absolute
    bottom: 0
    left: 50%
    transform: translate(-50%)
    max-height: 35vh

  .pacman
    position: absolute
    top: 0
    left: 50%
    transform: translate(-50%) rotate(-90deg)
    max-width: 15vw
    z-index: 10
  .coverBlue
    position: fixed
    left: 0
    top: 0
    width: 100%
    height: 100%
    pointer-events: none
    background-color: #123293
    opacity: 0
    z-index: 10

.sceneDead
  background-color: $colorOrange
  position: fixed
  left: 0
  top: 0
  width: 100%
  height: 100%
  display: flex
  justify-content: center
  align-items: center

  .pacmandead
    margin-bottom: 15px

  @media screen and (max-width: 800px)
    align-items: flex-start
    padding-top: 20vh
    

.sceneGame
  canvas
    width: 100%
    mix-blend-mode: lighten
</style>


