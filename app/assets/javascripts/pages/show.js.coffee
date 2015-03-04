maint_timer = null
countdown_timer = null

go_back_after = (s) ->
  delay = s * 1000
  maint_timer = setTimeout((-> history.go(-1)), delay)
  count = s
  countdown_timer = setInterval((-> count = countdown(count)), 1000)

countdown = (i) ->
  console.log "#{i} seconds left"
  if i > 1
    units = "seconds"
  else
    units = "second"
  $('#countdown').text("in #{i} #{units}")
  --i 

ready = ->
  clearTimeout(maint_timer)
  clearInterval(countdown_timer)
  id = $('body').attr('id')
  console.log "Loaded page #{id}" 
  console.log "Do something different here." if id == "maintenance"
  go_back_after(8) if id == "maintenance"

$(document).ready(ready)

