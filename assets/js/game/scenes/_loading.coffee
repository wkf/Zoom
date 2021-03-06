NKO.Game.Scenes.push (C) ->

  C.scene "loading", ->
    # load audio and sprites here

    # this is to fix the caching issue for dom nodes
    # using a http source makes the browser not reload
    # TODO move to S3
    C.load [
      "http://ffframe.s3.amazonaws.com/balloons.png",
      "http://ffframe.s3.amazonaws.com/balloon-faces.png"
      "img/clouds-white.png"
      "img/clouds-blue.png"
      "img/stars.png"
      "img/moon-header.png"
      "mp3/zoom.mp3"
      "mp3/bounce.mp3"
      "mp3/inhale.mp3"
      "mp3/exhale.mp3"
      "mp3/cloud.mp3"
    ], ->

      C.audio.add({
        overture: ['mp3/zoom.mp3']
        inhale:   ['mp3/inhale.mp3']
        exhale:   ['mp3/exhale.mp3']
        bounce:   ['mp3/bounce.mp3']
        cloud:    ['mp3/cloud.mp3']
      });

      C.sprite 248.24242424242424, 292, "http://ffframe.s3.amazonaws.com/balloons.png",
        balloon_0:  [0, 0]
        balloon_1:  [1, 0]
        balloon_2:  [2, 0]
        balloon_3:  [3, 0]
        balloon_4:  [4, 0]
        balloon_5:  [5, 0]
        balloon_6:  [6, 0]
        balloon_7:  [7, 0]
        balloon_8:  [8, 0]
        balloon_9:  [9, 0]
        balloon_10: [10, 0]
        balloon_11: [11, 0]
        balloon_12: [12, 0]
        balloon_13: [13, 0]
        balloon_14: [14, 0]
        balloon_15: [15, 0]
        balloon_16: [16, 0]
        balloon_17: [17, 0]
        balloon_18: [18, 0]
        balloon_19: [19, 0]
        balloon_20: [20, 0]
        balloon_21: [21, 0]
        balloon_22: [22, 0]
        balloon_23: [23, 0]
        balloon_24: [24, 0]
        balloon_25: [25, 0]
        balloon_26: [26, 0]
        balloon_27: [27, 0]
        balloon_28: [28, 0]
        balloon_29: [29, 0]
        balloon_30: [30, 0]
        balloon_31: [31, 0]
        balloon_32: [32, 0]

      C.sprite 225, 76, "http://ffframe.s3.amazonaws.com/balloon-faces.png",
        face_hit:     [0,0]
        face_normal:  [1,0]
        face_inhale:  [2,0]
        face_exhale:  [3,0]

      C.sprite 366, 252, "img/clouds-white.png", {
        w1: [0,0]
        w2: [1,0]
        w3: [2,0]
        w4: [3,0]
        w5: [4,0]
        w6: [5,0]
        w7: [6,0]
        w8: [7,0]
      }

      C.sprite 366, 252, "img/clouds-blue.png", {
        b1: [0,0]
        b2: [1,0]
        b3: [2,0]
        b4: [3,0]
        b5: [4,0]
        b6: [5,0]
        b7: [6,0]
        b8: [7,0]
      }

      C.sprite 148, "img/stars.png", {
        s1:  [0,0]
        s2:  [1,0]
        s3:  [2,0]
        s4:  [3,0]
        s5:  [4,0]
        s6:  [5,0]
        s7:  [6,0]
        s8:  [7,0]
        s9:  [8,0]
        s10: [9,0]
      }

      NKO.database.connect ->
        @get 'highScores', (error, highScores) ->
          unless error
            NKO.highScores = highScores

      # Attempt to load gameState from goinstant database. Ex:
      #   http://localhost:1111/?gameState=8092ad4d-0a82-446b-b2c0-0c4ccb2298ad
      if gameState = (/gameState=(.+?)(&|$)/.exec(location.search) or [null, null])[1]
        NKO.database.connect ->
          @get "gameStates/#{gameState}", (error, gameState) ->
            unless error
              NKO.gameState        = gameState
              NKO.gameState.replay = true
            if NKO.gameState.replay
              C.scene 'main'
            else
              C.scene 'start'
      else
        if NKO.gameState.replay
          C.scene 'main'
        else
          C.audio.play 'overture', -1, 0.5
          C.scene 'start'
