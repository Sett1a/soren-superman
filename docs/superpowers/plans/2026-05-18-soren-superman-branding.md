# Soren Superman Branding Implementation Plan

> **For agentic workers:** REQUIRED: Use $subagent-driven-development (if subagents available) or $executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rebrand the desktop app from `Supremum` to `Soren Superman` in user-visible product surfaces and release artifacts.

**Architecture:** Keep the core Tauri/Rust architecture unchanged while updating configuration, UI strings, packaging metadata, and docs. Add a small branding regression script so the rename remains mechanically verifiable, then rebuild the Windows installers and republish the release assets.

**Tech Stack:** React, TypeScript, Tauri 2, Rust, PowerShell, GitHub CLI

---

### Task 1: Add a branding regression check

**Files:**
- Create: `scripts/check-branding.ps1`
- Test: `scripts/check-branding.ps1`

- [ ] **Step 1: Write the failing test**

Create a PowerShell script that verifies:

- `package.json` uses `soren-superman`
- `src-tauri/tauri.conf.json` uses `Soren Superman` and `com.sett1a.sorensuperman`
- `src-tauri/Cargo.toml` exposes `soren-superman` as the binary name
- user-facing source files use `Soren Superman`
- storage keys use the new `soren-superman.*` prefix

- [ ] **Step 2: Run test to verify it fails**

Run: `powershell -ExecutionPolicy Bypass -File scripts/check-branding.ps1`

Expected: FAIL because the current source still uses `Supremum`.

### Task 2: Rebrand metadata and UI strings

**Files:**
- Modify: `package.json`
- Modify: `src-tauri/tauri.conf.json`
- Modify: `src-tauri/Cargo.toml`
- Modify: `src-tauri/src/lib.rs`
- Modify: `src/WorkspaceContext.tsx`
- Modify: `src/WorkspaceGate.tsx`
- Modify: `src/ChangesPanel.tsx`
- Modify: `src/FileTree.tsx`
- Modify: `src/MainLayout.tsx`
- Modify: `scripts/build-macos-dmg.ts`
- Modify: `README.md`
- Modify: `README.zh-CN.md`

- [ ] **Step 1: Write minimal implementation**

Update the visible product name, identifier, installer/bundle names, terminal program label, and UI strings. Add local storage fallback reads from old `supremum.*` keys but write only new `soren-superman.*` keys.

- [ ] **Step 2: Run branding regression check**

Run: `powershell -ExecutionPolicy Bypass -File scripts/check-branding.ps1`

Expected: PASS.

### Task 3: Rebuild and republish the Windows release

**Files:**
- Test: `scripts/check-branding.ps1`
- Test: `scripts/check-windows-subsystem.ps1`

- [ ] **Step 1: Build the frontend**

Run: `npm run build`

Expected: PASS.

- [ ] **Step 2: Build Windows bundles**

Run: `npx tauri build`

Expected: PASS with new `Soren Superman` installer artifacts.

- [ ] **Step 3: Verify packaged executable behavior**

Run the branding check again.

Run the subsystem check against the built executable.

Expected: branding PASS and subsystem value `2`.

- [ ] **Step 4: Commit and publish**

Commit the branding changes, push `main`, create or update a release/tag for the branded build, and upload the new installer assets.
