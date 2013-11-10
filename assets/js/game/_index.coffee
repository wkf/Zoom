#= require "crafty-custom-follow"
#= require "scenes/_loading"
#= require "_init"
#= require "_database"
#= require "_scores"
#= require "../vendor/chroma"
#= require "models/_player"
#= require "views/_hud"
#= require "scenes/_start"
#= require "scenes/_end"
#= require "scenes/_win"
#= require "scenes/_main"
#= require "_components/_actor"
#= require "_components/_spawner"
#= require "_components/_face"
#= require "_components/_fly"
#= require "_components/_float"
#= require "_components/_breathe"
#= require "_components/_flicker"
#= require "_components/_balloon"
#= require "_components/_cloud"
#= require "_components/_recorder"
#= require "_components/_replayer"

require ['crafty'], (C) ->
  s(C) for s in NKO.Game.Scenes
  c(C) for c in NKO.Game.Components

  C.scene "loading"
