# Soren Superman Branding Design

**Problem**

The repository has been republished, but the desktop app and its packaging still present the upstream `Supremum` branding in user-visible places.

**Goal**

Rebrand the user-facing application identity to `Soren Superman` across the desktop UI, Tauri packaging metadata, release artifact names, and release documentation.

**Recommended Approach**

Apply a user-facing branding pass while keeping low-risk internal implementation pieces stable:

- Change visible app metadata in `src-tauri/tauri.conf.json`
- Change the packaged binary name in `src-tauri/Cargo.toml`
- Update frontend labels, dialog titles, and welcome copy
- Migrate local storage keys to the new prefix while preserving read compatibility with old keys
- Update documentation and build scripts to reference the new app name and artifact names

**Why This Approach**

- It removes the leftover upstream branding from the product experience
- It keeps the Rust library wiring intact, minimizing unnecessary build risk
- It preserves existing local data for users who already launched earlier builds
- It keeps release packaging aligned with the new brand name

**Out of Scope**

- Changing the repository slug on GitHub
- Replacing icons or redesigning the visual identity
- Refactoring unrelated application logic

**Validation**

1. Run a branding regression check that expects the new name and identifiers.
2. Build the frontend successfully.
3. Build the Windows installer successfully.
4. Verify the packaged Windows executable still uses the GUI subsystem.
5. Publish updated source and release assets to GitHub.
