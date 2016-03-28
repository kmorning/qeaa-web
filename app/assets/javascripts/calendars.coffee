# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
root = exports ? this
root.reload_calendar = ->
  source = new Array
  calendar_url = '/corrections_events.json' 
  new_calendar_event_link = '#{new_calendar_event_path}'
  $('#calendar').fullCalendar
    dayClick: (date, allDay, jsEvent, view) ->
      document.location.href = new_calendar_event_link + '?start_date=' + date
      return
    header:
      left: 'prev,today,next'
      center: 'title'
      right: 'month,agendaWeek,agendaDay'
    selectable: true
    selectHelper: true
    editable: false
    ignoreTimezone: false
    select: @select
    eventClick: @eventClick
    eventDrop: @eventDropOrResize
    eventSources: [ {
      url: calendar_url
      data:
        custom_param1: 'something'
        custom_param2: 'somethingelse'
      error: ->
        alert 'there was an error while fetching events!'
        return

    } ]
    eventResize: @eventDropOrResize
    timeFormat: 'H:mm '
  return

$(document).ready ->
  reload_calendar()
