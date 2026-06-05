# tool_hub

**Catalog of CLI and developer tools used across the FlexNetOS meta workspace.**

A FlexNetOS hub: `registry.json` is the single source of truth, `scripts/validate.py`
keeps it consistent (CI-enforced), and this README mirrors it. Follows the
[Hub Standard](https://github.com/FlexNetOS/template_hub/blob/master/docs/hub-standard.md).

## Scope

In scope: anything a human or agent invokes from a shell — language runtimes, CLIs,
linters, formatters, build tools, VCS helpers, container/test/profiling tooling.

Out of scope: MCP servers → [`mcp_hub`](https://github.com/FlexNetOS/mcp_hub); slash
commands → [`commands`](https://github.com/FlexNetOS/commands); automation workflows →
[`flow_hub`](https://github.com/FlexNetOS/flow_hub). Rule of thumb: *if you run it in a
terminal and it isn't an MCP server, it belongs here.*

## Catalog

_No entries yet — this hub is at v0.1.0 (foundation set, population pending)._

| Tool | Category | Runner | Status | Doc |
|------|----------|--------|--------|-----|
| _(none)_ | | | | |

## Entry shape

Each `tools[]` entry in [`registry.json`](registry.json) looks like:

```json
{
  "id": "ripgrep",
  "displayName": "ripgrep (rg)",
  "category": "cli",
  "status": "stable",
  "summary": "Recursive line-oriented search tool; fast grep replacement.",
  "tags": ["search", "grep"],
  "runner": "cargo",
  "install": "cargo install ripgrep",
  "bin": "rg",
  "verifyCmd": "rg --version",
  "homepage": "https://github.com/BurntSushi/ripgrep",
  "license": "MIT OR Unlicense",
  "hosting": "registry-only",
  "doc": "entries/ripgrep.md",
  "snippet": "snippets/ripgrep.sh"
}
```

`hosting`: `peer` (first-party workspace tool, e.g. envctl, rtk-tokenkill),
`registry-only` (third-party pointer), or `tool_hub-child` (a tool forked and hosted
under this hub via `.meta.yaml`). Full field reference: [`registry.schema.json`](registry.schema.json).

## Adding a tool

Add an entry to `registry.json`, create `entries/<id>.md` (and a `snippets/<id>.sh`
install fragment if useful), add a Catalog row, then run `python3 scripts/validate.py`.
See the [Hub Standard](https://github.com/FlexNetOS/template_hub/blob/master/docs/hub-standard.md).
