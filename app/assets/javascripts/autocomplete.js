$(document).on('turbolinks:load', function(){
  $(".category-field").tagit({
    singleField: true,
    fieldName:   'post[category_list]',
    availableTags: gon.category_tags,
    autocomplete: {delay: 0, minLength: 0}
  })
});