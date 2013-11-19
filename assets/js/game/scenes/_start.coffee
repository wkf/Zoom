NKO.Game.Scenes.push (C) ->

  C.scene "start", ->
    $('.pre-game-container').html(templates.start())
    stButtons.locateElements()

    $('.start').one "click", =>
      $('.pre-game-container').html("")
      C.scene 'main'
