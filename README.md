# Soren Superman

Soren Superman is a local desktop workspace for terminal-first developers who want AI coding tools, native shell access, file navigation, editing, and diff review in one place.

Instead of replacing the terminal, it builds a practical layer around it. You keep working with real local repositories and real CLI tools, while the app makes the surrounding workflow faster and easier to manage.

## Overview

Soren Superman is designed for people who prefer coding assistants that run as CLIs instead of browser chat tabs. It brings together the parts that usually get spread across several tools:

- AI coding launcher and session workspace
- Native terminal panes
- Local file explorer
- Built-in editor
- Change list and diff review surfaces
- Context handoff from files, selections, and terminal output into AI sessions

The goal is not to become a full IDE. The goal is to make CLI-driven development feel more fluid, especially when you move frequently between shell commands, file inspection, patch review, and assistant-guided work.

## Who It Is For

Soren Superman works best for developers who:

- spend most of their day in a shell
- prefer local tools and repositories over browser-only workflows
- use AI coding CLIs as part of daily implementation and debugging
- want a lighter desktop workspace than a traditional editor-centered setup
- need quick switching between AI, terminal, editing, and review tasks

## Core Experience

The app is built around a few practical ideas:

- The terminal stays real. Commands run in native shell sessions rather than simulated chat-only environments.
- Files stay local. Repositories are opened from your machine and worked on directly.
- AI sessions stay close to the code. You can move from file browsing to editing to terminal output to prompt context without repeatedly rebuilding the same state.
- Review is part of the workspace. Changes and diffs are available alongside the active coding session instead of being pushed off into another tool.

## Workspace Areas

Soren Superman currently includes these main surfaces:

- `AI Coding CLI`: launch supported coding assistants and manage session-oriented workflows
- `Terminal`: open and use native shell panes inside the app
- `Editor`: inspect and edit local files with targeted selection handoff
- `Files`: browse the repository tree from the current workspace
- `Changes`: inspect working tree changes
- `Diff`: review deltas in a dedicated pane

One of the recent workflow improvements in this fork is split-pane choice. When you split from an AI Coding CLI pane, the new pane can now be chosen as:

- `AI Coding CLI`
- `Terminal`
- `Editor`
- `Diff`

That makes the app more useful as a mixed workspace instead of forcing every split to remain another AI pane.

## Supported AI Coding CLIs

The launcher currently includes presets for:

- Claude Code
- Codex
- Gemini
- OpenCode
- Copilot
- Cursor Agent

Integration depth is not identical across every launcher. Claude Code currently has the most complete session-oriented flow, while other launchers may still rely more heavily on preset startup behavior.

## Why This Fork Exists

This repository continues the upstream Supremum codebase as a branded and actively adjusted fork focused on practical desktop polish, especially for Windows users.

This fork already includes several user-facing improvements:

- `Soren Superman` branding across app surfaces and packaging
- Windows GUI packaging so the installed app no longer opens an extra console window before the main window
- Windows Git command execution updated to avoid flashing terminal windows when the app probes a newly selected workspace
- better split-pane behavior for AI Coding CLI panes
- refreshed project documentation and release packaging

## Typical Workflow

A common flow inside Soren Superman looks like this:

1. Open a local repository as the current workspace.
2. Start an AI Coding CLI session from the launcher.
3. Split the layout into an AI pane plus terminal, editor, or diff panes.
4. Inspect files or changes while running commands locally.
5. Send relevant selections or terminal output into the AI session.
6. Review diffs before finalizing the change.

This is especially useful when debugging, refactoring, or iterating on features that require both shell output and code review context.

## Installation

Latest builds are published on GitHub Releases:

- Repository: [Sett1a/soren-superman](https://github.com/Sett1a/soren-superman)
- Releases: [https://github.com/Sett1a/soren-superman/releases](https://github.com/Sett1a/soren-superman/releases)

Current Windows installer artifacts include:

- `Soren.Superman_0.0.4_x64-setup.exe`
- `Soren.Superman_0.0.4_x64_en-US.msi`

## Development

### Prerequisites

- [Bun](https://bun.sh/)
- Rust toolchain
- platform prerequisites required by Tauri
- any external coding CLIs you want to launch, available on `PATH`

### Install dependencies

```bash
bun install
```

### Start development mode

```bash
bun run tauri dev
```

### Build the frontend

```bash
bun run build
```

### Build desktop installers

```bash
bun run tauri build
```

Windows output paths:

- `src-tauri/target/release/bundle/nsis/Soren Superman_<version>_x64-setup.exe`
- `src-tauri/target/release/bundle/msi/Soren Superman_<version>_x64_en-US.msi`

macOS helper commands:

- `bun run build:dmg:arm64`
- `bun run build:dmg:x64`
- `bun run build:dmg:universal`
- `bun run build:dmg:all`

## Platform Notes

### Windows

This fork includes Windows-specific fixes aimed at making first-run and packaged-launch behavior feel more like a native desktop app:

- release builds run as a GUI app instead of spawning an extra console window first
- background Git probing for workspace detection is configured to avoid flashing terminal windows

Release installers are not code-signed yet. If SmartScreen shows a warning, choose `More info` and then `Run anyway`.

### macOS

Release builds are not notarized yet. If macOS blocks the app after installation, remove quarantine:

```bash
xattr -dr com.apple.quarantine "/Applications/Soren Superman.app"
```

If the DMG itself is blocked before installation, remove quarantine from the downloaded DMG and try again.

## Tech Stack

- Tauri 2
- React 19
- Vite
- xterm.js
- CodeMirror 6
- Rust backend services for PTY, Git integration, and file operations

## Project Status

The project is already usable, but it is still early-stage software. The current focus is on making the desktop workflow smoother rather than trying to solve every editor problem at once.

Known limitations today:

- session resume is strongest for Claude Code
- some launchers are still preset-driven rather than fully abstracted
- external CLIs must be installed separately
- release signing and notarization are not finished yet

## Roadmap Direction

Likely improvement areas for future work include:

- stronger parity across supported AI coding CLIs
- more robust workspace restore behavior
- improved review and diff ergonomics
- better onboarding for first-time Windows users
- cleaner packaging and release automation

## Origin And License

Soren Superman is a GPL-licensed fork derived from the Supremum project, with branding, packaging, Windows behavior fixes, workflow improvements, and release maintenance continued in this repository.

License: [GNU GPL v3.0](./LICENSE)
