## Installation

1. Clone the repository via `git clone --recurse-submodules <repository URL>`
2. Install the required dependencies:
    - `cmake 3.25.0+`
    - `c++ compiler with cpp 23 support`
    - `ninja`
    - `(optional) cmake/cfg/*.cmake tools`

## Build & Deployment

### Build the project 

```bash
cmake --preset=release .
cd build/release
cmake --build . --config release
```
For more build configurations see [CMakePresets.json](https://github.com/geugenm/sdl-overview/blob/master/CMakePresets.json)

### Uninstall the project

```bash
sudo xargs rm < install_manifest.txt
```

### Docker build on manjaro

```bash
docker build -t my-image -f docker/Dockerfile .
```

## Documentation

All you need is to install doxygen and run these commands:
```bash
cd build/release
cmake --build . --target doxygen
```

## Contributing

If you'd like to contribute to this project, feel free to fork the repository and submit a pull request with your
changes.Contributions are always welcome, whether it's an improvement to the existing program or a new program in a
different language.

## License

This project is licensed under the AGPL-3.0 License — see the `LICENSE` file for details.

## Acknowledgments

Thanks to the developers of CMake and CTest for providing the tools necessary to build and test this program. Also,
thanks to the open-source community for providing resources and support for C++ development.
