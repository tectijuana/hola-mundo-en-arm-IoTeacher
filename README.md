# Lenguajes de Interfaz Moderna (C++ / ASM / Rust)

Curso práctico de 12 semanas enfocado en desarrollo de sistemas embebidos usando:
- Ensamblador ARM32 y ARM64
- C++ moderno aplicado a periféricos y estructura de bajo nivel
- Introducción segura a Rust con `no_std` y `cargo`

## 📚 Estructura

| Módulo | Carpeta | Descripción |
|--------|---------|-------------|
| Semana 1–4 | `asm_arm/` | Registro, macros, interrupciones, control directo de periféricos. |
| Semana 5–8 | `cpp_moderno/` | RAII, punteros inteligentes, control de hardware en C++ seguro. |
| Semana 9–12 | `rust_intro/` | Rust embebido, ownership, integración con Assembly y C++. |
| Proyecto final | `proyectos/` | Aplicaciones reales integradas entre C++, Rust y ASM. |

## ⚙️ Requisitos
- `arm-none-eabi-gcc` (toolchain)
- `rustup` + `cargo`
- `qemu` o hardware real (STM32, Raspberry Pi, etc.)
- CMake (para C++)
- VSCode + extensiones

## 📄 Licencia
📄 Licencia: Este repositorio se publica bajo la Licencia MIT. Ver [LICENSE.md](./LICENSE.md).
