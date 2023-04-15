## Installation

1. Clone the repository via `git clone --recurse-submodules <repository URL>`
2. Install the required dependencies:
    - `cmake 3.25.0+`
    - `cpp compiler with cpp 23 support`
    - `ninja`

## Build & Deployment

### Build the project 

```bash
cmake --preset=Release .
cd build/release
cmake --build . --config Release
```
For more build configurations see [CMakePresets.json](https://github.com/geugenm/sdl-overview/blob/master/CMakePresets.json)

Also,
you can use an automized [build.sh](https://github.com/geugenm/sdl-overview/blob/master/scripts/build.sh) 
in `scripts` folder changing directory to `..` by default.


### Docker build on manjaro

```bash
docker build -t my-image -f docker/Dockerfile .
```

## Documentation

All you need is to install doxygen and run these commands:
```bash
doxygen docs/.doxygen
cd scripts
sh build_docs.sh
```
It'll open your default app for viewing html files

## Contributing

If you'd like to contribute to this project, feel free to fork the repository and submit a pull request with your
changes.Contributions are always welcome, whether it's an improvement to the existing program or a new program in a
different language.

## License

This project is licensed under the AGPL-3.0 License — see the `LICENSE` file for details.

## Acknowledgments

Thanks to the developers of CMake and CTest for providing the tools necessary to build and test this program. Also,
thanks to the open-source community for providing resources and support for C++ development.