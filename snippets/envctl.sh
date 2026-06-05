#!/usr/bin/env bash
# envctl — GPU-aware environment manager (FlexNetOS/envctl). Builds from source.
# Requires Rust (rustup). The repo pins stable via rust-toolchain.toml.

# 1) get it (as a meta workspace peer it's already cloned; otherwise:)
#    git clone git@github.com:FlexNetOS/envctl.git && cd envctl

# 2) build the engine + CLI (zero system deps)
cargo build -p envctl-engine -p envctl

# 3) verify + read-only inventory (safe anytime)
cargo run -p envctl -- doctor
cargo run -p envctl -- auto-detect --json

# 4) install a component (idempotent); dry-run the risky verbs first
cargo run -p envctl -- install bun --dry-run
cargo run -p envctl -- reset boot-repair-dev      # dry-run by default; --apply to act

# Optional: put `envctl` on PATH
# cargo install --path envctl --bin envctl
