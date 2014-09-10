$(document).ready ->
  $('<%= "#word_#{@word.id}" %>').val('<%= @word.text %>')