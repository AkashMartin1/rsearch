class Resizable
  constructor: ->
    table = $(document).find('table.resizable')
    pre_element = '<div>'
    $.each table.find('thead').find('tr').find('td'), (index, e)->
      pre_element += '<div class="resizable"></div>'
    pre_element += '<div>'
    console.log pre_element
    table.before(pre_element)

$ ->
  window.resiable = Resizable()
