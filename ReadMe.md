# DevPipe

DevPipe is a collection of tools and templates I use in my development pipeline.

---

## What's Inside

- `template/`  
  Project templates for:
  - C (`basic`, `sdl2`)
  - C++ (`basic`, `sdl2`)
  - Dotnet (`basic`, `blazor`)

- `forgewatch/`  
  A file watcher that runs a build script when source files change.

---

## Requirements

- `make`
- `gcc` or `clang` for C/C++ templates
- `dotnet SDK` for Dotnet templates
- Optional: `emacs` if using `.comfig.el`

---

## Install

Clone the repo:

```sh
git clone --recurse-submodules https://github.com/Codespace0x25/DevPipe
cd DevPipe
make install
```

This will install all included tools (like `forgewatch`).

You can also install each part individually:

```sh
cd forgewatch
make install
```

---

## Notes

* Templates are stored in `template/templates/`
* Customize `.forgewatchrc` per project
