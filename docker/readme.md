# Using Docker Images for Local C++ Development

Harness the power of containerized toolchains and documentation generation for your C++ projects.  
Below are quick-start guides for **Manjaro** and **Fedora** Docker images, featuring clear commands and a nod to fancy error messages.

---

## 1. Build the Docker Image

### For Manjaro/Arch-Based Image

```bash
docker build -t cpp-dev-manjaro -f manjaro.Dockerfile .
```

### For Fedora-Based Image

```bash
docker build -t cpp-dev-fedora -f fedora.Dockerfile .
```

---

## 2. Run the Container

### Interactive Shell (For Development & Debugging)

#### Manjaro

```bash
docker run --rm -it -v $(pwd):/app cpp-dev-manjaro
```

#### Fedora

```bash
docker run --rm -it -v $(pwd):/app cpp-dev-fedora
```

> **Tip:**  
> Inside the container, you’ll find a full toolchain and documentation tools.  
> Type `doxygen -v` or `clang --version` to check your setup.

---

## 3. Run Automated Workflows

If your Dockerfile uses the workflow entrypoint, you can run:

```bash
docker run --rm -v $(pwd):/app cpp-dev-manjaro
```

or

```bash
docker run --rm -v $(pwd):/app cpp-dev-fedora
```

> **Fancy Output Example:**
>
> ```
> 🚀 Building with cmake --workflow --preset=gcc-full
> ⚡️ Compiling with ninja...
> 📄 Generating documentation with doxygen...
> ```

---

## 4. Generate Documentation

Inside the container (or via a script):

```bash
doxygen Doxyfile
```

---

## 5. (Optional) Fancy Error Messages

Add this to your build scripts for a Rust-like error experience:

```bash
function fancy_error {
  echo -e "\e[31m🚨 Error: $1\e[0m" >&2
  exit 1
}
cmake --build build || fancy_error "Build failed!"
```

---

## 6. Clean Up

Stop and remove all containers:

```bash
docker system prune -f
```

---

# ✨ Quick Reference Table

| Step         | Command Example                                           |
| ------------ | --------------------------------------------------------- |
| Build        | `docker build -t cpp-dev-manjaro -f Dockerfile.manjaro .` |
| Run Shell    | `docker run --rm -it -v $(pwd):/app cpp-dev-manjaro`      |
| Run Workflow | `docker run --rm -v $(pwd):/app cpp-dev-manjaro`          |
| Docs         | `doxygen Doxyfile`                                        |
| Cleanup      | `docker system prune -f`                                  |

