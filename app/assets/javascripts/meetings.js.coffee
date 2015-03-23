# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@buildMap = (mk) ->
  handler = Gmaps.build('Google')
  handler.buildMap { provider: {}, internal: {id: 'map'}}, ->
    marker = handler.addMarker(mk)
    handler.map.centerOn(marker)
    handler.getMap().setZoom(15)

#ready = ->
#  is_map_page = $('body').hasClass('meetings') && $('body').hasClass('show')
#  buildMap(geo_marker) if is_map_page

#$(document).ready(ready)
#$(document).on('page:load', ready)
