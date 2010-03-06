####
# Scrolls the window to element:
#   $('element').scrollTo()
#   $('element').scrollTo(speed)
# 
# Scrolls element1 to element2:
#   $('element1').scrollTo($('element2'))
#   $('element1').scrollTo($('element2'), speed)
$.fn.scrollTo: (speed) ->
  target: this
  container:'html,body'

  offset: $(target).offset().top - 30
  $(container).animate({scrollTop: offset}, speed or 1000)
  this

$ ->
  $('#demo').click ->
    $('#demo-box').toggle()
    if $('#demo-box:visible').length > 0 
      $('#demo').scrollTo(1)
      window.location.hash: '#demo'      
    else  
      window.location.hash: ''
    false
    
  $('#demo').click() if window.location.hash is "#demo"    
  
  $('.run').click ->
    template: $('.template').val()
    json: $.parseJSON $('.json').val()
    html: Mustache.to_html(template, json).replace(/^\s*/mg, '')
    $('.html').text(html).scrollTo(1)
    Highlight.highlightDocument()    
