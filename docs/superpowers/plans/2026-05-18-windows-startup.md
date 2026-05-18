# Windows Startup Console Suppression Implementation Plan

> **For agentic workers:** REQUIRED: Use $subagent-driven-development (if subagents available) or $executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Remove the extra Windows console window from the packaged app startup flow without changing in-app terminal behavior.

**Architecture:** Keep the fix at the Rust/Tauri entrypoint by switching the Windows executable subsystem to GUI for release builds. Add a small verification script that inspects the built PE header so the behavior stays covered by a repeatable regression check.

**Tech Stack:** Rust, Tauri 2, PowerShell, Windows PE header inspection

---

### Task 1: Add a regression check for the built executable

**Files:**
- Create: `scripts/check-windows-subsystem.ps1`
- Test: `scripts/check-windows-subsystem.ps1`

- [ ] **Step 1: Write the failing test**

Create a PowerShell script that reads the built executable's PE header and exits non-zero unless the subsystem equals `2` (`Windows GUI`).

- [ ] **Step 2: Run test to verify it fails**

Run: `cargo build --release --manifest-path src-tauri/Cargo.toml`

Run: `powershell -ExecutionPolicy Bypass -File scripts/check-windows-subsystem.ps1 src-tauri/target/release/Supremum.exe`

Expected: FAIL because the current executable is built as console subsystem.

- [ ] **Step 3: Keep the script as the regression guard**

Use the script unchanged after the code fix so it serves as an executable check instead of a one-off manual inspection.

### Task 2: Change the Windows entrypoint subsystem

**Files:**
- Modify: `src-tauri/src/main.rs`
- Test: `scripts/check-windows-subsystem.ps1`

- [ ] **Step 1: Write minimal implementation**

Add the Windows-only crate attribute for release builds:

```rust
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]
```

- [ ] **Step 2: Run the regression check again**

Run: `cargo build --release --manifest-path src-tauri/Cargo.toml`

Run: `powershell -ExecutionPolicy Bypass -File scripts/check-windows-subsystem.ps1 src-tauri/target/release/Supremum.exe`

Expected: PASS with subsystem `2`.

- [ ] **Step 3: Run a final targeted verification**

Run: `cargo test --manifest-path src-tauri/Cargo.toml`

Expected: PASS.
