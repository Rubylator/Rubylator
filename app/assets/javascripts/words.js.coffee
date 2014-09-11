# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.translatebtn').click ->
    id = this.id.split('_')[1]
    tag = $('#btn_'+id).find('i')
    tag.addClass('fa-spin')
