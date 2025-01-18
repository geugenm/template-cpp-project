# 🚀 Modern C++ Project Template

## 🌟 Features

- **🔬 C++23 Ready Presets**: Leverage cutting-edge C++ features
- **🛡️ Code Quality Tools**: Integrated targets for maintaining high standards
- **📦 CPM Package Management**: Simplified dependency handling
- **📄 Doxygen Configuration**: Seamless documentation generation
- **🧪 CTest Integration**: Straightforward testing setup
- **🐳 Docker Support**: Pre-configured containerization
- **💻 IDE Compatibility**: Works with QtCreator, CLion, Visual Studio, KDevelop
- **🌐 Cross-Platform**: Linux, Windows, macOS support
- **🏗️ CMake-Driven**: Streamlined CI/CD configuration

## 🚧 Prerequisites

- `cmake 3.25.0+`
- `C++ compiler with C++23 support`
- `ninja`
- `(optional) cmake/cfg/*.cmake tools`

## 💾 Installation

### 🍎 macOS

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Dependencies
brew install cmake llvm doxygen
```

### 🪟 Windows

```powershell
# Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

# Dependencies
choco install cmake llvm visualstudio2019buildtools doxygen
```

### 🐧 Linux

#### Ubuntu/Debian

```bash
sudo apt update
sudo apt install cmake g++ doxygen
```

#### Fedora

```bash
sudo dnf check-update
sudo dnf install cmake gcc-c++ doxygen
```

## 🛠️ Build & Deployment

### Build Project

```bash
cmake --preset=release .
cd build/release
cmake --build . --config release
```

### Run Tests

```bash
cd build/release
ctest --output-on-failure
```

### Docker Build

```bash
docker build -t my-image -f docker/Dockerfile .
```

## 📚 Documentation

```bash
cd build/release
cmake --build . --target doxygen

# Browse documentation
cd build/release/docs/doxygen/html
python -m http.server 8080
```

## 🚧 Roadmap

- [ ] Add Android build support

## 🤝 Contributing

Contributions are welcome! Fork the repository and submit a pull request.

## 📄 License

[AGPL-3.0 License](license)

## 🙏 Acknowledgments

Thanks to CMake, CTest, and the open-source community.
