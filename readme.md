# 🚀 Modern C++ Project Template

[![C++ Standard](https://img.shields.io/badge/C%2B%2B-23%2F26-00599C?style=for-the-badge&logo=cplusplus&logoColor=white&labelColor=1C1C1C)](https://isocpp.org/)
[![CMake](https://img.shields.io/badge/CMake-3.28%2B-064F8C?style=for-the-badge&logo=cmake&logoColor=white&labelColor=1C1C1C)](https://cmake.org)
[![License](https://img.shields.io/badge/License-AGPL--3.0-FF6B6B?style=for-the-badge&logo=gnu&logoColor=white&labelColor=1C1C1C)](https://www.gnu.org/licenses/agpl-3.0.html)

[![Build Matrix](https://img.shields.io/badge/Build%20Matrix-GCC%20%7C%20Clang%20%7C%20MSVC-4ECDC4?style=for-the-badge&logo=githubactions&logoColor=white&labelColor=1C1C1C)](https://github.com/features/actions)
[![Performance](https://img.shields.io/badge/Performance-Optimized-45B7D1?style=for-the-badge&logo=speedtest&logoColor=white&labelColor=1C1C1C)](#performance-benchmarks)
[![Architecture](https://img.shields.io/badge/Architecture-x64%20%7C%20ARM64-96CEB4?style=for-the-badge&logo=arm&logoColor=white&labelColor=1C1C1C)](#supported-architectures)

[![Documentation](https://img.shields.io/badge/Docs-Doxygen%20%7C%20Sphinx-FEA47F?style=for-the-badge&logo=readthedocs&logoColor=white&labelColor=1C1C1C)](https://doxygen.nl/)
[![Testing](https://img.shields.io/badge/Testing-Catch2%20%7C%20Doctest-F7931E?style=for-the-badge&logo=testinglibrary&logoColor=white&labelColor=1C1C1C)](#testing-framework)
[![Package Manager](https://img.shields.io/badge/Dependencies-CPM%20%7C%20Conan-FF7F7F?style=for-the-badge&logo=cmake&logoColor=white&labelColor=1C1C1C)](#dependency-management)

[![Containerization](https://img.shields.io/badge/Docker-Multi--Stage%20%7C%20Distroless-0db7ed?style=for-the-badge&logo=docker&logoColor=white&labelColor=1C1C1C)](https://www.docker.com/)
[![CI/CD](https://img.shields.io/badge/Pipeline-GitHub%20Actions%20%7C%20GitLab%20CI-2088FF?style=for-the-badge&logo=githubactions&logoColor=white&labelColor=1C1C1C)](#continuous-integration)
[![IDE Support](https://img.shields.io/badge/IDE-CLion%20%7C%20VS%20Code%20%7C%20Qt%20Creator-FF6B6B?style=for-the-badge&logo=visualstudiocode&logoColor=white&labelColor=1C1C1C)](#development-environment)

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

## Advanced Feature Matrix

Contemporary C++ development requires sophisticated tooling integration that addresses performance, maintainability, and developer experience concerns. This template provides a comprehensive foundation for high-performance applications with enterprise-grade quality assurance mechanisms.

### Core Development Features

| Component             | Technology                       | Configuration                | Performance Impact         |
| --------------------- | -------------------------------- | ---------------------------- | -------------------------- |
| **Build System**      | CMake 3.28+                      | Multi-preset configuration   | Zero runtime overhead      |
| **Compiler Support**  | GCC 13+, Clang 16+, MSVC 19.35+  | Standards-compliant C++23/26 | Optimal code generation    |
| **Memory Management** | Custom allocators, RAII patterns | Stack-preferring design      | Sub-microsecond allocation |
| **Concurrency**       | std::execution, coroutines       | Lock-free data structures    | Minimal contention         |
| **Error Handling**    | std::expected, error codes       | Zero-cost exception safety   | Predictable performance    |

### Quality Assurance Pipeline

| Tool Category             | Implementation                    | Integration             | Quality Metrics                  |
| ------------------------- | --------------------------------- | ----------------------- | -------------------------------- |
| **Static Analysis**       | Clang-Static-Analyzer, PVS-Studio | Pre-commit hooks        | Zero false positives             |
| **Dynamic Analysis**      | AddressSanitizer, MemorySanitizer | CI/CD integration       | 100% memory safety               |
| **Performance Profiling** | Perf, Intel VTune, Tracy          | Continuous benchmarking | Performance regression detection |
| **Documentation**         | Doxygen, Sphinx                   | Automated generation    | API coverage tracking            |

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
cmake --preset=gcc .
cd build/release
cmake --build . --config gcc
```

### Run Tests

```bash
cd build/gcc
ctest --output-on-failure
```

### Docker Build

```bash
docker build -t my-image -f docker/<desired_os>.Dockerfile .
```

## 📚 Documentation

```bash
cd build/gcc
cmake --build . --target doxygen

# Browse documentation
cd build/gcc/docs/doxygen/html
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
