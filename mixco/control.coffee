#
#  File:       core.coffee
#  Author:     Juan Pedro Bolívar Puente <raskolnikov@es.gnu.org>
#  Date:       Mon May 23 18:39:40 2013 
#
#  Scripting engine controls.
#

#
#  Copyright (C) 2013 Juan Pedro Bolívar Puente
#
#  This program is free software: you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation, either version 3 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

util = require('./util')
indent = util.indent
hexStr = util.hexStr


MIDI_NOTE_ON  = 0x8
MIDI_NOTE_OFF = 0x9
MIDI_CC       = 0xB

midi = (midino = 0, channel = 0) ->
    midino: midino
    channel: channel
    status: (message) -> (message << 4) | @channel
    configMidi: (message, depth) ->
        """
        #{indent depth}<status>#{hexStr @status(message)}</status>
        #{indent depth}<midino>#{hexStr @midino}</midino>
        """


class Control

    constructor: (@id=midi(), @group="[Channel1]", @key=null) ->
        if not (@id instanceof Object)
            @id = midi @id

    init: (script) ->
        if @_scripted
            script.registerScripted this, @_scriptedId()

    shutdown: (script) ->

    scripted: ->
        @_scripted = true
        this

    onScript: (ev) ->
        value = transform.mappings[@key](ev.value)
        engine.setValue @group, @key, value

    configInputs: (depth, script) ->
        actualKey =
            if @_scripted
                script.scriptedKey(@_scriptedId())
            else
                @key
        """
        #{indent depth}<control>
        #{indent depth+1}<group>#{@group}</group>
        #{indent depth+1}<key>#{actualKey}</key>
        #{@id.configMidi @message, depth+1}
        #{indent depth+1}<options>
        #{@configOptions depth+2}
        #{indent depth+1}</options>
        #{indent depth}</control>
        """

    configOptions: (depth) ->
        if @_scripted
            "#{indent depth}<script-binding/>"
        else
            "#{indent depth}<normal/>"

    configOutputs: (depth, script) ->

    _scripted: false
    _scriptedId: -> util.mangle("_#{@group}_#{@id.midino}_#{@id.status @message}")


class Knob extends Control

    message: MIDI_CC

    soft: ->
        @_soft = true
        @scripted()
    _soft: false

    init: ->
        super
        engine.softTakeover(@group, @key, @_soft)


class Button extends Control

    message: MIDI_CC

    configOptions: (depth) ->
        "#{indent depth}<button/>"


class LedButton extends Button

    onValue: 0x7f
    offValue: 0x00

    configOutputs: (depth, script) ->
        """
        #{indent depth}<output>
        #{indent depth+1}<group>#{@group}</group>
        #{indent depth+1}<key>#{@key}</key>
        #{@id.configMidi @message, depth+1}
        #{indent depth+1}<on>#{hexStr @onValue}</on>
        #{indent depth+1}<off>#{hexStr @offValue}</off>
        #{indent depth+1}<minimum>1</minimum>
        #{indent depth}</output>
        """


exports.Knob = Knob
exports.Slider = Knob
exports.Button = Button
exports.LedButton = LedButton
