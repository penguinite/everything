# everything

*Every nimble package ever... Now In one convenient package!*

`everything` is a nimble package that... well... depends on every nimble package out there! Or at least, every nim package available in the package registry.

## How do I use this?

Add `requires "https://github.com/penguinite/everything.git"` to your .nimble file. (I still have yet to publish this package).

And that's it! You now should have access to every package ever. Don't be surprised if your program fails to build (Since some packages are hopelessly broken, or they require a special version of the nim toolchain or they require external libraries in order to install.)

The .nimble file is generated daily by GitHub Actions, but if you want to regenerate it yourself then run: `nim r gen_nimble.nim`
