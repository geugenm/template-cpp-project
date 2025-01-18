<div align="center">

# 🚀 Modern C++ Project Template

<!-- Project Variables -->

[vars]
project_name = "template-cpp-project"
github_username = "geugenm"
cpp_standard = "23"
cmake_version = "3.25.0+"
platforms = ["Linux", "Windows", "macOS"]
license = "AGPL-3.0"

## Status & Quality

[![C++{cpp_standard}](https://img.shields.io/badge/C%2B%2B-{cpp_standard}-blue?style=for-the-badge&logo=c%2B%2B)](https://en.cppreference.com/w/cpp/compiler_support)
[![CMake](https://img.shields.io/badge/CMake-{cmake_version}-brightgreen?style=for-the-badge&logo=cmake)](https://cmake.org)
[![Build Status](https://img.shields.io/github/actions/workflow/status/{github_username}/{project_name}/build.yml?style=for-the-badge)](https://github.com/{github_username}/{project_name}/actions)
[![Coverage](https://img.shields.io/codecov/c/github/{github_username}/{project_name}?style=for-the-badge&logo=codecov)](https://codecov.io/gh/{github_username}/{project_name})

## Ecosystem & Platform

[![Docker](https://img.shields.io/badge/Docker-Ready-blue?style=for-the-badge&logo=docker)](https://www.docker.com)
[![Platform](https://img.shields.io/badge/Platforms-{' %7C '.join(platforms)}-lightgrey?style=for-the-badge)](https://github.com/{github_username}/{project_name})
[![License](https://img.shields.io/badge/License-{license}-red?style=for-the-badge)](<https://www.gnu.org/licenses/{license.lower()}.en.html>)

## Community

[![Contributors](https://img.shields.io/github/contributors/{github_username}/{project_name}?style=for-the-badge)](https://github.com/{github_username}/{project_name}/graphs/contributors)
[![Forks](https://img.shields.io/github/forks/{github_username}/{project_name}?style=for-the-badge)](https://github.com/{github_username}/{project_name}/network/members)
[![Stars](https://img.shields.io/github/stars/{github_username}/{project_name}?style=for-the-badge)](https://github.com/{github_username}/{project_name}/stargazers)

</div>

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
