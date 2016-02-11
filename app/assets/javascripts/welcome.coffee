class Resizable
  constructor: ->
    table = $(document).find('table.resizable')
    pre_element = '<div>'
    $.each table.find('thead').find('tr').find('td'), (index, e)->
      pre_element += "<div class=\"resizable\" style=\"width: 1px; height: 10px; margin-left: #{(index + 1) * 100}px\"></div>"
    pre_element += '<div>'
    console.log pre_element
    table.before(pre_element)
    this.active_div()

  track: ->
    $(document).on('mousemove', 'div.resizable', this.doDrag)
    $(document).on('mouseup', 'div.resizable', this.stopDrag)

  doDrag: (e) ->
    console.log e

  stopDrag: (e) ->
    $(document).off('mousemove', 'div.resizable', this.doDrag)
    $(document).off('mouseup', 'div.resizable', this.stopDrag)

  active_div: ->
    $(document).on 'mouseover', 'div.resizable', ->
      $.each $('div.resizable'), (index, e)->
        $(e).attr 'active', false
      $(this).attr 'active', true

$ ->
  new Resizable().track()
  $(document).on 'mousedown', ->
    console.log 'mousedown'
