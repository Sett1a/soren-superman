# Soren Superman Identity Design

**Problem**

The app is rebranded in text, but the repository slug and icon assets still reflect the previous identity.

**Goal**

Unify the remaining product identity under `Soren Superman` by:

- renaming the GitHub repository slug to `soren-superman`
- replacing the app icon with a new modern `S` crest mark
- regenerating Tauri icon assets from one branded source icon
- updating links and release metadata to the renamed repository

**Recommended Approach**

Use a single SVG source icon with a dark terminal-native aesthetic and a bright `S` crest. Regenerate the Tauri icon set from that source with `tauri icon`, keep matching SVG variants for the web app, rename the repository through GitHub CLI, then publish a new release from the renamed repository.

**Why This Approach**

- one canonical icon source reduces drift across platforms
- repository rename and icon refresh finish the branding pass consistently
- using the Tauri icon generator is safer than hand-editing every raster asset

**Validation**

1. Run an identity check that expects the new repo slug and branded icon assets.
2. Regenerate Tauri icons from the new source SVG.
3. Rename the GitHub repository to `soren-superman`.
4. Rebuild Windows installers and publish a new release from the renamed repo.
