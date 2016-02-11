class Resizable
  constructor: ->
    window.self = this
    window.table = $(document).find('table.resizable')
    pre_element = '<div class="main-resizable">'
    $.each table.find('thead').find('tr').find('td'), (index, e)->
      pre_element += "<div class=\"resizable\" style=\"width: 100px; height: 40px; margin-left: 20px\"></div>"
    pre_element += '<div><br />'
    console.log pre_element
    table.before(pre_element)
    this.active_div()

  doDrag: (e) ->
    if $(this).hasClass('active')
      $(this).css 'width', "#{(window.startWidth + e.clientX - window.startX)}px"
      window.self.table_reset_col()
    #   $(this).css 'height', "#{(window.startHeight + e.clientY - window.startY)}px"

  stopDrag: (e) ->
    $(document).off('mousemove', 'div.resizable', this.doDrag)
    $(document).off('mouseup', 'div.resizable', this.stopDrag)

  active_div: ->
    $(document).on 'mousedown', 'div.resizable', (e)->
      console.log e
      $.each $('div.resizable'), (index, ee)->
        $(ee).removeClass 'active'
      $(this).addClass 'active'
      window.startX = e.clientX
      window.startY = e.clientY
      console.log window.startX
      console.log window.startY
      console.log $(this).width()
      console.log $(this).height()
      window.startWidth = parseInt($(this).width())
      window.startHeight = parseInt($(this).height())
      console.log window.startWidth
      console.log window.startHeight
      $(document).on('mousemove', 'div.resizable', window.self.doDrag)
      $(document).on('mouseup', 'div.resizable', window.self.stopDrag)
   table_reset_col: ->
     $.each window.table.find('tr:first').find('td'), (index, el)->
       $(el).css 'width', $(document).find("div.resizable:eq(#{index})").width()+'px'

$ ->
  new Resizable()
