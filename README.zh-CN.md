# Soren Superman

![Soren Superman 工作区预览](docs/images/workspace-overview-ai-editor-terminal.png)

Soren Superman 是一个面向终端工作流的本地桌面应用，适合习惯直接使用 coding CLI，而不是只在网页聊天框里写代码的人。

它不会替代真实终端，而是在终端外面补上一层更顺手的工作区能力：文件浏览、代码编辑、变更查看、Diff 审查，以及更省事的上下文传递。

## 它是做什么的

Soren Superman 的核心思路很直接：

- 用桌面应用来启动常见 coding CLI，而不是每次都手动拼工作流
- 在同一个界面里完成文件、编辑器、终端、变更和 Diff 之间的切换
- 把文件、文件夹、代码选区、终端输出更快地送进 AI 会话
- 需要并行工作时，可以保留多列面板同时查看

## 适合什么人

如果你真正工作的核心还在 shell 里，而不是 IDE 的侧边功能里，这个项目会更适合你。

它的定位不是“大而全”的编辑器，而是一个围绕 CLI 搭起来的轻量控制台：

- 终端是真的终端
- 本地项目是真的本地项目
- UI 只负责把这些能力组织得更顺手

## 当前重点

目前这份仓库主要聚焦在下面几件事上：

- Claude Code 的启动与历史会话恢复
- 本地文件、改动、Diff 的快速切换
- macOS 与 Windows 的轻量桌面打包
- Windows 安装版启动时直接打开主界面，不再先弹出额外终端窗口

## 内置工作区

- `AI Coding CLI`：启动支持的 AI 编码 CLI，并管理会话式工作流
- `Terminal`：运行本地终端，并把选中的输出发给 AI
- `Editor`：查看和编辑文件，支持把代码选区直接加入上下文
- `Files`：浏览本地仓库文件树
- `Changes`：查看 Git 改动
- `Diff`：在独立视图里审查代码差异

## 当前内置的 CLI 启动项

现在的 launcher 预置了这些入口：

- Claude Code
- Codex
- Gemini
- OpenCode
- Copilot
- Cursor Agent

不同 CLI 的集成深度并不完全一样，目前 Claude Code 的工作流支持最完整。

## 下载

当前仓库与发布地址：

- 仓库：[Sett1a/soren-superman](https://github.com/Sett1a/soren-superman)
- Release：[点这里下载](https://github.com/Sett1a/soren-superman/releases)

当前 Windows 安装包文件名：

- `Soren.Superman_0.0.3_x64-setup.exe`
- `Soren.Superman_0.0.3_x64_en-US.msi`

## 快速开始

### 环境依赖

- [Bun](https://bun.sh/)
- Rust toolchain
- 当前平台所需的 Tauri 依赖
- 你想启动的 coding CLI，并且它们需要已经在 `PATH` 中可用

### 安装依赖

```bash
bun install
```

### 开发模式运行

```bash
bun run tauri dev
```

### 构建前端

```bash
bun run build
```

### 打包安装程序

```bash
bun run tauri build
```

Windows 产物默认位于：

- `src-tauri/target/release/bundle/nsis/Soren Superman_<version>_x64-setup.exe`
- `src-tauri/target/release/bundle/msi/Soren Superman_<version>_x64_en-US.msi`

macOS DMG 相关命令：

- `bun run build:dmg:arm64`
- `bun run build:dmg:x64`
- `bun run build:dmg:universal`
- `bun run build:dmg:all`

## 平台说明

### Windows

当前 Release 安装包还没有代码签名。如果 SmartScreen 弹出警告，点 `More info` 再点 `Run anyway` 即可继续。

这个分支还包含了一个 Windows 打包修复：安装后的应用会直接作为 GUI 程序启动，而不会先弹出一个额外终端窗口。

### macOS

当前 Release 还没有做 notarization。如果系统阻止应用启动，可以手动去掉 quarantine：

```bash
xattr -dr com.apple.quarantine "/Applications/Soren Superman.app"
```

如果是 DMG 本身在安装前就被系统拦截，也可以先对下载下来的 DMG 执行同样处理后再试。

## 技术栈

- Tauri 2
- React 19
- Vite
- xterm.js
- CodeMirror 6
- Rust 后端 PTY 与文件操作能力

## 项目现状

这个项目已经可以实际使用，但目前仍然属于早期版本。

当前限制包括：

- 历史会话恢复目前主要围绕 Claude Code
- 某些 launcher 集成还是预置式支持，而不是完全统一抽象
- 外部 CLI 需要用户自行安装

## 来源与许可

Soren Superman 是基于 Supremum 派生出来的 GPL 分支，在这个仓库中继续维护了 Windows 打包修复、品牌更新和新的发布流程。

许可证：[GNU GPL v3.0](./LICENSE)
