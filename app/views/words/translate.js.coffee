$(document).ready ->
  $('<%= "#word_#{@word.id}" %>').val('<%= @word.text %>')
  $('<%= "#loading_#{@word.id}" %>').addClass('hidden')
