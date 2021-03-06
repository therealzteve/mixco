mixco.console
=============

> This file is part of the [Mixco framework](http://sinusoid.es/mixco).
> - **View me [on a static web](http://sinusoid.es/mixco/src/console.html)**
> - **View me [on GitHub](https://github.com/arximboldi/mixco/blob/master/src/console.litcoffee)**

This module is a lightweight version of
[*console-browserify*](https://npmjs.org/package/console-browserify).
It provides a console object in contexts where there is none, like for
example Mixxx.



    {assert} = require './util'

    konsole = this
    exports = konsole

    konsole.log     ?= -> print "" + arguments
    konsole.info    ?= konsole.log
    konsole.warn    ?= konsole.log
    konsole.error   ?= konsole.log
    konsole.time    ?= -> assert False, "time not implemented in konsole"
    konsole.timeEnd ?= -> assert False, "time not implemented in konsole"
    konsole.trace   ?= ->
        err = new Error()
        err.name = "Trace"
        err.message = "" + arguments
        konsole.error err.stack
    konsole.dir     ?= -> konsole.log object + "\n"
    konsole.assert  ?= assert
