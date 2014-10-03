define [
  'marionette'
], (Marionette) ->

  class AppController extends Marionette.Controller
    initialize: ->
      console.log @
