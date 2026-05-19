# Soren Superman Identity Implementation Plan

> **For agentic workers:** REQUIRED: Use $subagent-driven-development (if subagents available) or $executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Finish the Soren Superman branding by updating repository naming and icon assets.

**Architecture:** Add one SVG source icon and matching web SVGs, regenerate platform icons with the Tauri icon tool, then rename the GitHub repository and publish a new release from the renamed location.

**Tech Stack:** SVG, Tauri CLI, GitHub CLI, PowerShell

---

### Task 1: Add an identity regression check

**Files:**
- Create: `scripts/check-identity.ps1`
- Test: `scripts/check-identity.ps1`

- [ ] **Step 1: Write the failing test**

Verify that:

- README links point to `Sett1a/soren-superman`
- branded web icon SVGs contain `Soren Superman`
- the source icon file exists

- [ ] **Step 2: Run test to verify it fails**

Run: `powershell -ExecutionPolicy Bypass -File scripts/check-identity.ps1`

Expected: FAIL before the repo rename and icon updates.

### Task 2: Replace icon assets

**Files:**
- Create: `branding/soren-superman-icon.svg`
- Modify: `public/app-icons/icon-dark.svg`
- Modify: `public/app-icons/icon-light.svg`
- Modify: `src-tauri/icons/*` via `tauri icon`

- [ ] **Step 1: Add the new source icon and matching web icons**
- [ ] **Step 2: Regenerate Tauri icons from the source SVG**
- [ ] **Step 3: Run the identity check again**

### Task 3: Rename the repository and republish

**Files:**
- Modify: `README.md`
- Modify: `README.zh-CN.md`

- [ ] **Step 1: Rename the GitHub repository to `soren-superman`**
- [ ] **Step 2: Update links and remotes if needed**
- [ ] **Step 3: Rebuild installers**
- [ ] **Step 4: Create a new release from the renamed repository**
