# Windows Startup Console Suppression Design

**Problem**

The packaged Windows build opens an extra console window before the main Tauri UI appears. For a desktop app, that startup behavior is undesirable and makes the release feel unfinished.

**Goal**

Make the packaged Windows app launch directly into its GUI without showing an extra console window, while preserving the in-app terminal functionality.

**Recommended Approach**

Add the Rust crate attribute `windows_subsystem = "windows"` to the Windows entrypoint in `src-tauri/src/main.rs`, gated to Windows release builds.

**Why This Approach**

- It is the standard Rust fix for Windows GUI binaries that should not allocate a console.
- It keeps the change local to the application entrypoint.
- It does not change the PTY-based terminal implementation used inside the app.
- It minimizes regression risk compared with launcher or build-pipeline workarounds.

**Out of Scope**

- Changing terminal features inside the app
- Refactoring the Tauri backend
- Reworking installer packaging, signing, or branding

**Validation**

1. Build the Windows release executable from `src-tauri`.
2. Inspect the PE subsystem value for the produced `Supremum.exe`.
3. Verify the subsystem is `Windows GUI (2)` instead of `Windows CUI (3)`.
