$ ->
  $(document).mouseenter (event)->
    console.log event

  $(document).mousemove (event)->
    console.log event.clientX
    console.log event.clientY
    console.log '+++++++++++++++++++++++++'