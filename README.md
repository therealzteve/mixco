mixco
=====

**Mixco** is a framework for creating hardware controller scripts for
the amazing [Mixxx][mixxx] DJ software using [Literate
CoffeeScript][lcs]. Find more information [in the *Mixco*
webpage][mixco]. And remember, this is [Free Software][gnu].

  [gnu]: http://www.gnu.org/philosophy/free-sw.html
  [mixxx]: http://www.mixxx.org
  [lcs]: http://coffeescript.org/#literate
  [mixco]: http://sinusoid.es/mixco


Features
--------

  * Your script file is a single [Literate CoffeeScript][lcs] file.
  * The file can be executed to generate the XML mapping and converted
    to JS to be used as the controller script.
  * It will create direct mappings to controls whenever possible, but
    this is transparent to the script writer.
  * The API is very [fluent][fluent] and
    [declarative][declarative].
  * Because of [Literate CoffeeScript][lcs], the mappings are well
    documented, and the code itself is interleaved with the
    documentation, encouraging DJs to modify them and remove the
    artist/coder dicotomy. [See an example of it][script.nanokontrol2]

  [declarative]: http://en.wikipedia.org/wiki/Declarative_programming
  [fluent]: http://en.wikipedia.org/wiki/Fluent_interface
  [lcs]: http://coffeescript.org/#literate
  [script.nanokontrol2]: script/nanokontrol2.html


Supported hardware
------------------

  - [Korg Nanokontrol 2][script.nanokontrol2]

  [script.nanokontrol2]: script/nanokontrol2.html


Download
--------

**Mixco** is still on development, but you can try it out grabbing the
source code from [Gitorious][git]. Note that the project is still
***very experimental*** and thus the provided API will change every
single minute.

  [git]: https://gitorious.org/mixco

### Depedencies

Required dependencies to compile the Mixxx scripts:

  - [CoffeeScript](http://coffeescript.org/) >= 1.5
  - [Node.js](http://nodejs.org/) >= 0.8
  - [Browserify](http://browserify.org/) >= 2.0
  - [GNU make](http://www.gnu.org/software/make/)

Optional dependencies to compile documentation:

  - [Docco](http://jashkenas.github.io/docco/) >= 0.5


Installation
------------

To install the *Mixco* First, [grab the sources][git]. Then, from the
project folder, execute:

> make

The Mixxx compatible script files should be then `out/` folder, ready
to be copied to the [Mixxx MIDI controller folder][mixxxmidi]

To compile your own scripts, copy your `myscript.litcoffee` to the
`script/` folder, then execute from the project folder:

> make "SCRIPTS=out/myscript.midi.xml out/myscript.js"

Your script will be compiled and the `out` folder will contain your
script files ready to be used with Mixxx.  You can also compile
beautiful documentation like this doing:

> make doc DOCS=doc/script/myscript.html

  [git]: https://gitorious.org/mixco
  [mixxxmidi]: http://www.mixxx.org/wiki/doku.php/midi_controller_mapping_file_format


Documentation
-------------

### API

  * [mixco.script][mixco.script]
  * [mixco.control][mixco.control]
  * [mixco.behaviour][mixco.behaviour]
  * [mixco.transform][mixco.transform]
  * [mixco.util][mixco.util]

### Scripts

  * [script.nanokontrol2][script.nanokontrol2]

  [mixco.script]: mixco/script.html
  [mixco.control]: mixco/control.html
  [mixco.behaviour]: mixco/behaviour.html
  [mixco.transform]: mixco/transform.html
  [mixco.util]: mixco/util.html
  [script.nanokontrol2]: script/nanokontrol2.html


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
