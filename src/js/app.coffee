define [
  'marionette'
  'client/controllers/appController'
], (Marionette, AppController) ->

# $ = require 'jquery'
# Marionette = require 'marionette'
# AppController = require.include 'script!client/controllers/appController'

  App = window.App = new Marionette.Application()
  dictionary = App.module 'dictionary'
  dictionary.on 'start', ->
      controller = new AppController()
  App.start()
