#fix source http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper

jQuery ->
  ready = () -> $('.words_onchange').change () -> $(this).trigger('submit.rails')

  $(document).ready(ready);
  $(document).on('page:load', ready);

jQuery ->
  ready = () -> $('#project_language_ids').select2()

  $(document).ready(ready);
  $(document).on('page:load', ready);