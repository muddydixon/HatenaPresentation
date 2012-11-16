$ ()->
  class Presentation
    defaultStyle:
      position: 'absolute'
      width: '100%'
      height: '100%'
      top: 0
      left: 0
      background: '#929292'
      display: 'none'
    
    constructor: (@target)->
      @target = $(@target)

      @id = @target.parents('.entry').data('uuid')

      @target.css @defaultStyle
      @target.attr 'id', "presentation-#{@id}"
      @target.addClass 'prepared'
      @target.data('self', this)
      @style = $.extend({}, @defaultStyle)
      @slides = @createSlides(@target.find('div.slide'))

      @setStartButton()
      @target.appendTo $('body')
    
    createSlides: (slideDivs)->
      slides = (@createSlide slide, idx for slide, idx in slideDivs)
      
    createSlide: (div, idx)->
      $page = $(div).data('pid', idx)
      $page.append @createFooter(idx)
      
      return $page
      
    setStartButton: ()->
      $startButton = $('<button>', {class: 'start-button'}).text('start presentation').on 'click', @startPresentation
      $startButton.insertBefore @target
      
    startPresentation: ()=>
      @target.addClass 'current'
      @target.css({display: 'block'})
      $(@slides[0]).addClass 'current'
      
    stopPresentation: ()=>
      @target.css({display: 'none'})
      @target.removeClass 'current'
      $(@slides).each (slide)-> $(slide)
      
    nextPage: ()->
      $current = @target.find('.current')
      $current.removeClass('current')
      pid = $current.data('pid')
      if @slides[pid + 1]?
        @slides[pid + 1].addClass('current')
      else
        @stopPresentation()
      
    prevPage: ()->
      $current = @target.find('.current')
      $current.removeClass('current')
      pid = $current.data('pid')
      if @slides[pid - 1]?
        @slides[pid - 1]?.addClass('current')
      else
        @stopPresentation()
      
    goTopPage: ()->
      $current = @target.find('.current')
      $current.removeClass('current')
      @slides[0].addClass('current')

    showSummary: ()->

    createFooter: (idx)->
      footer = $('<footer>')
      footer.append $('<span>', {class: 'page-id'}).text "#{idx} / #{@target.find('.slide').length}"

  $('.presentation').each (idx, presentation)-> new Presentation presentation
  $(document).keyup (ev)->
    if ev.which is 27
      $('.presentation.current').data('self')?.stopPresentation?()
    else if ev.which is 39
      $('.presentation.current').data('self')?.nextPage?()
    else if ev.which is 37
      $('.presentation.current').data('self')?.prevPage?()
    else if ev.which is 38
      $('.presentation.current').data('self')?.goTopPage?()
    else if ev.which is 40
      $('.presentation.current').data('self')?.showSummary?()
      
