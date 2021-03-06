NKO.Game.Components.push (C) ->

  _firstFrame = null

  C.c 'Recorder',
    _keyStates: {}
    _keyEvents: {}
    _keyEventsThisTick: {}

    _save: ->
      @_keyEvents

    init: ->
      @requires 'Keyboard'

      @bind 'KeyUp', (e) ->
        if e.key of @_keyStates
          @_keyStates[e.key]         = false
          @_keyEventsThisTick[e.key] = 0

      @bind 'KeyDown', (e) ->
        @_keyStates[e.key]         = true
        @_keyEventsThisTick[e.key] = 1

      @bind 'EnterFrame', (e) ->
        _firstFrame = e.frame unless _firstFrame?

        unless _.isEmpty(@_keyEventsThisTick)
          @_keyEvents[e.frame - _firstFrame] = @_keyEventsThisTick

        @_keyEventsThisTick  = {}
