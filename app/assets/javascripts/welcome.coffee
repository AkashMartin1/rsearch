class Resizable
  constructor: ->
    window.self = this
    window.table = $(document).find('table.resizable')
    pre_element = '<div class="main-resizable">'
    $.each table.find('thead').find('tr').find('td'), (index, e)->
      pre_element += "<div class=\"resizable\" style=\"width: 100px; height: 40px;\"><div class=\"resizable-handler\"></div></div>"
    pre_element += '<div><br />'
    table.before(pre_element)
    window.self.active_div()
    window.self.table_reset_col()

  doDrag: (e) ->
    if $(this).parent().hasClass('active')
      $(this).parent().css 'width', "#{(window.startWidth + e.clientX - window.startX)}px"
      window.self.table_reset_col()
    #   $(this).css 'height', "#{(window.startHeight + e.clientY - window.startY)}px"

  stopDrag: (e) ->
    $(document).off('mousemove', 'div.resizable-handler', this.doDrag)
    $(document).off('mouseup', 'div.resizable-handler', this.stopDrag)

  active_div: ->
    $(document).on 'mousedown', 'div.resizable-handler', (e)->
      $.each $('div.resizable-handler'), (index, ee)->
        $(ee).parent().removeClass 'active'
      $(this).parent().addClass 'active'
      window.startX = e.clientX
      window.startY = e.clientY
      window.startWidth = parseInt($(this).parent().width())
      window.startHeight = parseInt($(this).parent().height())
      $(document).on('mousemove', 'div.resizable-handler', window.self.doDrag)
      $(document).on('mouseup', 'div.resizable-handler', window.self.stopDrag)
   table_reset_col: ->
     $.each window.table.find('tr:first').find('td'), (index, el)->
       $(el).css 'width', $(document).find("div.resizable:eq(#{index})").width()+'px'
       $(el).css 'height', $(document).find("div.resizable:eq(#{index})").height()+'px'

$ ->
  new Resizable()
