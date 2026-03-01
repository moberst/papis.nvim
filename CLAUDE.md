# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

papis.nvim is a Neovim companion plugin for the bibliography manager [papis](https://papis.readthedocs.io/). It provides search, citation insertion, at-cursor popups, tag completion, and note management backed by a real-time SQLite database synced with the papis library via file-system watchers.

## Development Commands

### Testing
```bash
# Run all tests (requires nlua)
busted

# Run a single test file
busted spec/init_spec.lua
```

Tests use [busted](https://lunarmodules.github.io/busted/) with `nlua` as the Lua interpreter. Configuration is in `.busted`. Environment variables control provider selection in tests:
- `PAPIS_TEST_COMPLETION_PROVIDER` — `cmp` or `blink`
- `PAPIS_TEST_PICKER_PROVIDER` — `telescope` or `snacks`
- `PAPIS_TEST_LOAD_PAPIS` — whether to load the plugin

### Nix
The project uses a Nix flake (`flake.nix`) for CI and development environments. The CI overlay (`nix/ci-overlay.nix`) sets up Neovim with all required plugins for testing.

### Documentation
Vimdoc (`doc/papis.txt`) is auto-generated from Lua annotations via the `panvimdoc.yml` GitHub Action. Do not edit `doc/papis.txt` directly.

### Release
Releases are automated via release-please and published to LuaRocks via GitHub Actions.

## Code Style

- 2-space indentation (spaces, not tabs) — see `.editorconfig`
- Lua code uses Sumneko/LuaCATS type annotations throughout
- Follow existing patterns for `---@class`, `---@param`, `---@return` annotations

## Architecture

### Module System

The plugin is organized into feature modules under `lua/papis/`. Each module follows a consistent pattern with an `init.lua` that exposes a setup interface. Modules are enabled/disabled via config and initialized lazily on first relevant file open.

**Core modules** (always active): `config`, `data`, `sqlite-wrapper`, `fs-watcher`, `commands`, `keymaps`, `health`, `log`

**Feature modules** (toggled via config):
- `search/` — Bibliography picker (Telescope or Snacks provider)
- `at-cursor/` — Citation popup and actions at cursor position
- `completion/` — Tag completion in info.yaml (nvim-cmp or blink.cmp provider)
- `ask/` — LLM integration via papis-ask (disabled by default)
- `formatter` — Note formatting for new entries
- `papis-storage` — YAML file reading/parsing
- `colors` — Highlight group definitions

### Provider Pattern

Search and completion modules use a provider abstraction. Each has subdirectories for specific providers (e.g., `search/telescope/`, `search/snacks/`) with shared logic in `picker_common.lua` or `common.lua`. Provider selection is auto-detected or configured.

### Data Flow

1. `papis-storage` reads `info.yaml` files from the papis library, converts YAML→JSON via `yq`
2. `sqlite-wrapper` stores entries in an SQLite database with configurable schema
3. `fs-watcher` uses libuv to watch library directories for changes, triggering incremental DB updates
4. `data.lua` orchestrates synchronization (dirty checking via mtime in metadata table)
5. Multi-instance coordination: only one Neovim instance runs file-system watchers (tracked by PID in state table)

### Configuration

All defaults and the config schema live in `lua/papis/config.lua`. Citation format definitions per filetype (TeX, Markdown, Org, Norg, Typst) are defined there. The config is deeply merged with user overrides from `setup(opts)`.

### Key Dependencies

- **sqlite.lua** — Database layer (required)
- **nui.nvim** — UI popups (required)
- **papis** CLI + **yq** (go version) — External tools for library access and YAML parsing
