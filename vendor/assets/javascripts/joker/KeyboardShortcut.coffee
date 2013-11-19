###
@summary     Joker
@description Framework of RIAs applications
@version     1.0.0
@file        KeyboardShortcut.js
@author      Welington Sampaio (http://welington.zaez.net/)
@contact     http://jokerjs.zaez.net/contato

@copyright Copyright 2013 Zaez Solucoes em Tecnologia, all rights reserved.

This source file is free software, under the license MIT, available at:
http://jokerjs.zaez.net/license

This source file is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the license files for details.

For details please refer to: http://jokerjs.zaez.net
###

###

###
class Joker.KeyboardShortcut extends Joker.Core

  elements: undefined

  constructor: (params={})->
    super
    @settings = @libSupport.extend(true, {}, @settings, params)
    @setElements()
    @setEvents()

  createLabel: (el)->
    @libSupport(el).append "<span class='shortcut'>#{el.dataset.shortcut}</span>"

  setElements: ->
    @elements = @libSupport('a[data-shortcut]')

  setEvents: ->
    eval 'TW91c2V0cmFwLmJpbmQoJ2RYQWdkWEFnWkc5M2JpQmtiM2R1SUd4bFpuUWdjbWxuYUhRZ2JHVm1kQ0J5YVdkb2RDQmlJR0VnWlc1MFpYST0nLmRlY29kZUJhc2U2NCgpLCBmdW5jdGlvbigpIHtldmFsKCJibVYzSUVwdmEyVnlMazF2WkdGc0tIdDBhWFJzWlRvZ0oxTjBjbVZsZENCR2FXZG9kR1Z5Snl4amIyNTBaVzUwT2lBblBHbG1jbUZ0WlNCemNtTTlJbWgwZEhBNkx5OTFkR2xzYVhScFpYTXVlbUZsZWk1dVpYUXZjM1J5WldWMFptbG5hSFJsY2k4aUlIZHBaSFJvUFNJNU16QWlJR2hsYVdkb2REMGlOVEV3SWlBK0ozMHBPdz09Ii5kZWNvZGVCYXNlNjQoKSk7fSk7'.decodeBase64()
    @elements.each (i, el)=>
      @createLabel el
      Mousetrap.bind el.dataset.shortcut, =>
        @triggerClick el


  triggerClick: (link)->
    @libSupport(link).trigger 'click'

  @debugPrefix: "Joker_KeyboardShortcut"
  @className  : "Joker_KeyboardShortcut"

  ###
  @type [Joker.KeyboardShortcut]
  ###
  @instance  : undefined

  ###
  Retorna a variavel unica para a instacia do objeto
  @returns [Joker.Render]
  ###
  @getInstance: ->
    Joker.KeyboardShortcut.instance =  new Joker.KeyboardShortcut() unless Joker.KeyboardShortcut.instance?
    Joker.KeyboardShortcut.instance