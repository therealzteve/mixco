mixco.util
============

MixCo utility functions

License
-------

>  Copyright (C) 2013 Juan Pedro Bolívar Puente
>
>  This program is free software: you can redistribute it and/or
>  modify it under the terms of the GNU General Public License as
>  published by the Free Software Foundation, either version 3 of the
>  License, or (at your option) any later version.
>
>  This program is distributed in the hope that it will be useful,
>  but WITHOUT ANY WARRANTY; without even the implied warranty of
>  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>  GNU General Public License for more details.
>
>  You should have received a copy of the GNU General Public License
>  along with this program.  If not, see <http://www.gnu.org/licenses/>.


Utilities
---------

We *monkeypatch* the **Function** class to provide a **property**
class method to define *properties* -- i.e. attributes that are
accessed via setters and getters.

    Function::property = (prop, desc) ->
        Object.defineProperty @prototype, prop, desc

**printer** can be used to print both into Mixxx console or the
standard output, for code paths that run both as Mixxx script or
standalone.

    exports.printer = (args...) ->
        try
            print args.toString()
        catch _
            console.error args.toString()

    exports.catching = (f) -> ->
        try
            f.apply @, arguments
        catch err
            printer "ERROR: #{err}"


    exports.mangle = (str) ->
        str.replace(' ', '_').replace('[', '__C__').replace(']', '__D__')


    exports.xmlEscape = (str) ->
        str
            .replace('&', '&amp;')
            .replace('"', '&quot;')
            .replace('>', '&gt;')
            .replace('<', '&lt;')


    exports.indent = (depth) ->
        Array(depth*4).join(" ")


    exports.hexStr = (number) ->
        "0x#{number.toString 16}"
