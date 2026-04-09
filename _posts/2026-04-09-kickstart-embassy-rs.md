---
title: Kickstart an Embassy-rs project
classes: wide
layout: splash
author_profile: false
---

# Kickstarting an Embassy-rs project for a Blackpill

1. Install rust core
```shell
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

2. Install probe-rs for programming and debugging
```shell
$ curl -LsSf https://github.com/probe-rs/probe-rs/releases/latest/download/probe-rs-tools-installer.sh | sh
```

3. Install cargo-generate
```shell
$ cargo install cargo-generate
```

4. Generate initial project
```shell
$ cargo generate --git https://github.com/lulf/embassy-template.git -d chip=<stm32f411ce OR stm32f401xx> --name blackpill
🔧   chip: "stm32f411ce" (value from CLI)
🔧   Destination: /home/alan/projects/rust/blackpill ...
🔧   project-name: blackpill ...
🔧   Generating template ...
[ 1/16]   Done: .cargo/config.toml
[ 2/16]   Done: .cargo
[ 3/16]   Done: .github/workflows/ci.yaml
[ 4/16]   Done: .github/workflows/update-chip-choices.yml
[ 5/16]   Done: .github/workflows
[ 6/16]   Done: .github
[ 7/16]   Done: .gitignore
[ 8/16]   Done: Cargo.toml
[ 9/16]   Done: build.rs
[10/16]   Done: ci.sh
[11/16]   Done: memory.x
[12/16]   Ignored: pre-script.rhai
[13/16]   Done: rust-toolchain.toml
[14/16]   Done: scripts
[15/16]   Done: src/main.rs
[16/16]   Done: src
🔧   Moving generated files into: `/home/alan/projects/rust/blackpill`...
🔧   Initializing a fresh Git repository
✨   Done! New project created /home/alan/projects/rust/blackpill
```

    - If you don't know the full chip name you can use `probe-rs` to look for it etc:
```shell
$ probe-rs chip info stm32f401
stm32f401
Error: Found multiple chips matching 'stm32f401', unable to select a single
chip. (STM32F401CB, STM32F401CBUx, STM32F401CBYx, STM32F401CC, STM32F401CCUx,
STM32F401CCYx, STM32F401CCFx, STM32F401CD, STM32F401CDUx, STM32F401CDYx,
STM32F401CE, STM32F401CEUx, STM32F401CEYx, STM32F401RB, STM32F401RBTx,
STM32F401RC, STM32F401RCTx, STM32F401RD, STM32F401RDTx, STM32F401RE,
STM32F401RETx, STM32F401VB, STM32F401VBHx, STM32F401VBTx, STM32F401VC,
STM32F401VCTx, STM32F401VCHx, STM32F401VD, STM32F401VDHx, STM32F401VDTx,
STM32F401VE, STM32F401VEHx, STM32F401VETx)
```

5. Build the test project to make sure it's happy
```shell
$ cd blackpill
$ cargo build
info: downloading 11 components
    Updating crates.io index
     Locking 87 packages to latest compatible versions
      Adding embassy-executor v0.9.1 (available: v0.10.0)
      Adding embassy-stm32 v0.4.0 (available: v0.6.0)
      Adding embassy-sync v0.7.2 (available: v0.8.0)
  Downloaded embassy-stm32 v0.4.0
  Downloaded stm32-metapac v18.0.0
  Downloaded stm32-fmc v0.3.2
  Downloaded 3 crates (11.9MiB) in 0.83s (largest was `stm32-metapac` at 11.5MiB)
   Compiling proc-macro2 v1.0.106
   Compiling unicode-ident v1.0.24
   Compiling quote v1.0.45
   Compiling defmt v1.0.1
   Compiling thiserror v2.0.18
   Compiling defmt-macros v1.0.1
   Compiling semver-parser v0.7.0
   Compiling bitflags v1.3.2
   Compiling cortex-m v0.7.7
   Compiling nb v1.1.0
   Compiling critical-section v1.2.0
   Compiling cortex-m-rt v0.7.5
   Compiling semver v0.9.0
   Compiling stable_deref_trait v1.2.1
   Compiling nb v0.1.3
   Compiling void v1.0.2
   Compiling byteorder v1.5.0
   Compiling vcell v0.1.3
   Compiling embedded-hal v0.2.7
   Compiling rustc_version v0.2.3
   Compiling volatile-register v0.2.2
   Compiling futures-core v0.3.32
   Compiling embedded-io-async v0.6.1
   Compiling hash32 v0.3.1
   Compiling bitfield v0.13.2
   Compiling litrs v1.0.0
   Compiling heapless v0.8.0
   Compiling cfg-if v1.0.4
   Compiling bare-metal v0.2.5
   Compiling embassy-time-driver v0.2.2
   Compiling autocfg v1.5.0
   Compiling ident_case v1.0.1
   Compiling embedded-hal v1.0.0
   Compiling stm32-metapac v18.0.0
   Compiling fnv v1.0.7
   Compiling futures-sink v0.3.32
   Compiling heapless v0.9.2
   Compiling strsim v0.11.1
   Compiling embedded-hal-async v1.0.0
   Compiling syn v2.0.117
   Compiling document-features v0.2.12
   Compiling num-traits v0.2.19
   Compiling embassy-sync v0.7.2
   Compiling proc-macro-error-attr2 v2.0.0
   Compiling embassy-sync v0.8.0
   Compiling embassy-time-queue-utils v0.3.0
   Compiling embassy-hal-internal v0.3.0
   Compiling embedded-io v0.7.1
   Compiling embedded-io-async v0.7.0
   Compiling as-slice v0.2.1
   Compiling embedded-storage v0.3.1
   Compiling embassy-executor-timer-queue v0.1.0
   Compiling aligned v0.4.3
   Compiling embedded-storage-async v0.4.1
   Compiling pin-project-lite v0.2.17
   Compiling embassy-executor v0.9.1
   Compiling defmt-rtt v1.1.0
   Compiling panic-probe v1.0.0
   Compiling futures-task v0.3.32
   Compiling embassy-futures v0.1.2
   Compiling futures-util v0.3.32
   Compiling block-device-driver v0.2.0
   Compiling embedded-hal-nb v1.0.0
   Compiling stm32-fmc v0.3.2
   Compiling embedded-can v0.4.1
   Compiling sdio-host v0.9.0
   Compiling bit_field v0.10.3
   Compiling rand_core v0.9.5
   Compiling static_assertions v1.1.0
   Compiling bitflags v2.11.0
   Compiling blackpill v0.1.0 (/home/alan/projects/rust/blackpill)
   Compiling rand_core v0.6.4
   Compiling proc-macro-error2 v2.0.1
   Compiling darling_core v0.20.11
   Compiling thiserror-impl v2.0.18
   Compiling cortex-m-rt-macros v0.7.5
   Compiling darling_macro v0.20.11
   Compiling defmt-parser v1.0.0
   Compiling darling v0.20.11
   Compiling embassy-executor-macros v0.7.0
   Compiling defmt v0.3.100
   Compiling embassy-time v0.5.1
   Compiling embedded-io v0.6.1
   Compiling embassy-net-driver v0.2.0
   Compiling embassy-usb-driver v0.2.0
   Compiling embassy-usb-synopsys-otg v0.3.2
   Compiling embassy-stm32 v0.4.0
   Compiling embassy-embedded-hal v0.5.0
    Finished `dev` profile [optimized + debuginfo] target(s) in 15.92s
```

6. Run the project (if adjustments in main.rs match your MCU)
```shell
$ cargo run
    Finished `dev` profile [optimized + debuginfo] target(s) in 0.04s
     Running `probe-rs run --chip STM32F411CE target/thumbv7em-none-eabihf/debug/blackpill`
      Erasing ✔   0% [--------------------]        0 B @        0 B/s (ETA 0s)
etc etc
```


