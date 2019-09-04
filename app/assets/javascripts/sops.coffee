# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', ->
  init = ->
    onChangeFile()
    onClickRemoveFile()
    initTagEditor()

  initTagEditor = ->
    $('textarea').tagEditor()

  onClickRemoveFile = ->
    $('.remove-file').off('click')
    $('.remove-file').on 'click', (event)->
      removeFile(event)
      event.preventDefault()

  removeFile = (event)->
    dom = event.currentTarget
    $(dom).hide()
    $(dom).next().hide()
    $(dom).prev().val(1)

  onChangeFile = ->
    $('.file-input').off('change')
    $('.file-input').change ->
      parent = $(this).parent()
      parent.find('input.destroy[type=hidden]').val(0)
      return

  initSelectPicker = ->
    $('.selectpicker').selectpicker();

  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        parent = $(input).parent()
        img = parent.find('img')
        btnRemoveImage = parent.find('.remove-image')
        hiddenField = parent.find('input[type=hidden]')

        $(img).attr 'src', e.target.result
        $(btnRemoveImage).show()
        $(hiddenField).val('0')
        return

      reader.readAsDataURL input.files[0]
    return

  init()
