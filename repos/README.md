# `tool_hub/repos/` — staging submodules (not yet catalogued)

Holding area for **upstream tool sources we are not registering yet**. Each entry is a git
**submodule pinned to a specific upstream commit** and left **uninitialized** (no clone) — it carries
forward the *reference* (url + SHA), not the content.

- **Relocated from `.github_org` per [ADR-0002](https://github.com/FlexNetOS/.github)** (lean
  `.github_org` — relocate submodules/repos/marketplaces to hubs-by-type). These are the toolchain
  source pins that used to live at `.github_org/tools/*`.
- They are **NOT** in `../registry.json` yet. The catalog holds the Rust-native / first-class tools;
  these stay here "for now" until classified and promoted to a proper `tool_hub` entry.
- **Never-downgrade:** nothing was deleted — the pins moved here intact. Initialize on demand with
  `git submodule update --init repos/<tool>` (most are `shallow = true`).

| Submodule | Upstream | Pinned commit |
|---|---|---|
| `repos/actionlint` | github.com/rhysd/actionlint | `011a6d15` |
| `repos/bun` | github.com/oven-sh/bun | `db928c24` |
| `repos/cpython` | github.com/python/cpython | `24c6bbc9` |
| `repos/gitleaks` | github.com/gitleaks/gitleaks | `80093b8a` |
| `repos/node` | github.com/nodejs/node | `4639dcb4` |
| `repos/trivy` | github.com/aquasecurity/trivy | `f080e1ec` |
| `repos/uv` | github.com/astral-sh/uv | `67f02f6d` |
