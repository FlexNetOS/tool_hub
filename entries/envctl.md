# envctl

GPU-aware, source-building **environment manager** for the FlexNetOS workstation. One
Rust workspace: a shared engine, the `envctl` CLI, and a native `envctl-gui` desktop app.
It manages the box declaratively — every tool is a TOML **component** whose lifecycle
hooks wrap proven bash rather than rewriting it.

| | |
|---|---|
| **Repo** | [`FlexNetOS/envctl`](https://github.com/FlexNetOS/envctl) |
| **Category** | env (environment manager) |
| **Runner** | cargo (builds from source) |
| **Binary** | `envctl` (+ `envctl-gui`) |
| **License** | MIT OR Apache-2.0 |
| **Status** | beta |
| **Hosting** | peer (workspace member `envctl/`) |

## What it does

Declarative, idempotent management of the workstation's tools and toolchains:

| Verb | What it does | Default |
|---|---|---|
| `auto-detect` | read-only inventory: host, GPU (works pre-driver), tools, component drift | — |
| `install` | bring components to present+verified, in dependency order | acts (idempotent) |
| `auto-fix` | repair broken/partial components | dry-run (`--apply`) |
| `reset` | uninstall + unwire toward baseline | dry-run (`--apply`) |
| `add-repo` | build any repo from source (incl. AI port-to-Rust) + wire-in | preview (`--build`) |
| `graph` | dependency-DAG intelligence: `--impact` blast-radius, `--why` paths, `--dot`/`--json` | — |
| `lock` | content-hashed `envctl.lock` + `--check` CI gate (exit 1 on drift) | writes |
| `doctor` | read-only health: writability, toolchains, sudo, UEFI/Secure-Boot, GPU | — |

## Install & run

Requires Rust (the repo pins stable via `rust-toolchain.toml`). Build the engine + CLI
(zero system deps):

```bash
cargo build -p envctl-engine -p envctl
cargo run -p envctl -- auto-detect        # read-only; safe anytime
cargo run -p envctl -- auto-detect --json # machine-readable EnvReport
```

The native GUI (`envctl-gui`) needs system dev libs (winit/glow + a native file dialog).
The manifest dir defaults to `./manifest` (override with `ENVCTL_MANIFEST_DIR`).

Verify a build: `envctl doctor`.

## Why it's in tool_hub (not vault_hub)

`envctl` is a CLI tool you run in a terminal → it belongs in `tool_hub`. It overlaps with
[`vault_hub`](https://github.com/FlexNetOS/vault_hub) only because vault_hub *bundles*
`kasetto`, which is also a declarative environment manager. They're **siblings**, not
duplicates:

- **envctl** — targets the local workstation/GPU box; builds tools from source; lifecycle + lockfile + GPU awareness.
- **vault_hub:kasetto** — targets reproducible **AI-agent skill** environments across machines/agents.

vault_hub remains a *capability vault* (1,508 agent skills + kasetto to deploy them); it is
not a tools registry. Cross-reference, don't duplicate.
