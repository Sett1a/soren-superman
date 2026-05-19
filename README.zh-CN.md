# Soren Superman

Soren Superman 是一个面向终端工作流的本地桌面应用，适合那些把 AI Coding CLI、原生终端、文件浏览、代码编辑和差异审查都放在同一套本地开发流程里的开发者。

它不是拿来替代终端的，而是在终端外围补上一层更顺手的工作区能力。你仍然使用本地仓库、真实 CLI 和真实 shell，只是把原本分散在多个工具之间的操作收拢到一个更连贯的桌面界面里。

## 项目定位

Soren Superman 的核心思路很直接：如果你真正写代码、调试、运行命令、查看变更的中心一直都在终端里，那么桌面应用就不该反过来强迫你离开这个工作方式。

它把这些高频操作组合在一起：

- AI 编码 CLI 启动与会话承载
- 原生终端面板
- 本地文件树浏览
- 内置编辑器
- 变更列表与 Diff 审查界面
- 把文件、代码选区和终端输出快速送入 AI 上下文

所以它更像是一个围绕 CLI 搭起来的轻量工作台，而不是一个试图包办一切的传统 IDE。

## 适合什么人

如果你符合下面这些情况，这个项目会更适合你：

- 日常开发主要依赖 shell 而不是浏览器聊天框
- 更喜欢在本地仓库上工作，而不是把上下文交给远程网页
- 会频繁使用 Claude Code、Codex、Gemini 等 AI Coding CLI
- 想要比传统编辑器更轻、更直接的桌面工作区
- 需要在 AI、终端、编辑器和 Diff 之间快速切换

## 主要能力

当前版本重点提供这些能力：

- 启动支持的 AI Coding CLI，并在桌面界面中承载会话流程
- 在同一个工作区中并排打开终端、编辑器和 Diff 视图
- 直接浏览仓库文件、查看当前改动、审查补丁
- 把文件、目录、选中文本和终端输出更顺手地转给 AI 会话
- 在本地开发环境中工作，而不是切换到一套脱离项目现场的网页上下文

## 工作区组成

Soren Superman 目前包含这些主要区域：

- `AI Coding CLI`：启动支持的 AI 编码工具，并承载会话式工作流
- `Terminal`：运行本地 shell，会话输出可继续送入 AI 上下文
- `Editor`：查看和编辑文件，支持把选中代码直接带入上下文
- `Files`：浏览当前工作区的文件树
- `Changes`：查看当前仓库改动
- `Diff`：在独立面板中审查代码差异

这个分支最近还补上了一个很实用的交互改进：当你从 `AI Coding CLI` 面板执行上下或左右分屏时，新 pane 不再被强制生成为另一个 AI 面板，而是先让你自己选择：

- `AI Coding CLI`
- `Terminal`
- `Editor`
- `Diff`

这样它更像一个真正可组合的开发工作区，而不是单一类型面板的复制器。

## 当前支持的 AI Coding CLI

Launcher 目前内置了这些入口：

- Claude Code
- Codex
- Gemini
- OpenCode
- Copilot
- Cursor Agent

不同 CLI 的集成深度目前还不完全一致。现阶段 Claude Code 的会话型工作流支持最完整，其他入口则还有继续统一体验的空间。

## 这个分支已经做过什么

这个仓库是在上游 Supremum 的基础上继续维护的 `Soren Superman` 分支，当前已经加入了一些更偏实际使用体验的调整，尤其照顾了 Windows 场景：

- 全部对外品牌已统一为 `Soren Superman`
- Windows 安装版启动时不再先弹一个额外的控制台窗口
- 第一次选择工作区后，后台执行 Git 探测时不再闪终端弹窗
- AI Coding CLI 分屏后可以自由选择新 pane 类型
- README、打包信息和发布内容已同步整理

## 一个典型的使用流程

你可以这样理解它的日常用法：

1. 打开本地项目目录作为当前工作区。
2. 在 `AI Coding CLI` 中启动一个 AI 编码会话。
3. 根据需要分屏，打开终端、编辑器或 Diff。
4. 一边运行本地命令，一边查看文件或变更。
5. 把有价值的输出、代码片段或文件上下文交给 AI。
6. 在提交前回到 `Changes` 或 `Diff` 视图确认结果。

这套流程尤其适合调试、重构、批量修改和需要反复对照终端输出的开发任务。

## 下载与安装

当前仓库与发布地址：

- 仓库：[Sett1a/soren-superman](https://github.com/Sett1a/soren-superman)
- Releases：[https://github.com/Sett1a/soren-superman/releases](https://github.com/Sett1a/soren-superman/releases)

当前 Windows 安装包文件名包括：

- `Soren.Superman_0.0.4_x64-setup.exe`
- `Soren.Superman_0.0.4_x64_en-US.msi`

## 本地开发

### 环境依赖

- [Bun](https://bun.sh/)
- Rust toolchain
- 当前平台所需的 Tauri 依赖
- 你想启动的外部 AI Coding CLI，并且它们已经在 `PATH` 中可用

### 安装依赖

```bash
bun install
```

### 启动开发模式

```bash
bun run tauri dev
```

### 构建前端

```bash
bun run build
```

### 打包桌面安装程序

```bash
bun run tauri build
```

Windows 产物默认位于：

- `src-tauri/target/release/bundle/nsis/Soren Superman_<version>_x64-setup.exe`
- `src-tauri/target/release/bundle/msi/Soren Superman_<version>_x64_en-US.msi`

macOS 相关辅助命令：

- `bun run build:dmg:arm64`
- `bun run build:dmg:x64`
- `bun run build:dmg:universal`
- `bun run build:dmg:all`

## 平台说明

### Windows

这个分支已经专门处理过一些 Windows 体验问题，重点包括：

- Release 构建后的应用以 GUI 程序方式启动，不再先弹系统终端
- 后台 Git 探测命令在首次选择工作区时不会再闪出额外终端窗口

当前安装包还没有做代码签名。如果 SmartScreen 弹出提示，可以选择 `More info` 后再点 `Run anyway`。

### macOS

当前 Release 还没有 notarization。如果系统阻止应用启动，可以手动去掉 quarantine：

```bash
xattr -dr com.apple.quarantine "/Applications/Soren Superman.app"
```

如果是在安装前 DMG 就被系统拦截，也可以先对下载下来的 DMG 做同样处理后再试。

## 技术栈

- Tauri 2
- React 19
- Vite
- xterm.js
- CodeMirror 6
- Rust 后端 PTY、Git 与文件操作能力

## 当前状态

这个项目已经可以实际使用，但仍然属于早期阶段。当前更重视的是把终端驱动型开发工作流做顺，而不是一次性把所有 IDE 能力都堆进来。

目前已知限制包括：

- 会话恢复能力主要还是围绕 Claude Code 最完整
- 某些 launcher 还是偏预设式接入，还没有完全统一抽象
- 外部 CLI 需要用户自行安装
- Release 签名与 notarization 还未完成

## 后续方向

接下来比较自然的改进方向包括：

- 让不同 AI Coding CLI 的体验更接近
- 继续增强工作区恢复与会话续接
- 优化 Changes 与 Diff 的审查体验
- 改善 Windows 首次使用与安装后的细节体验
- 让打包和发布流程更稳定、更自动化

## 来源与许可

Soren Superman 是基于 Supremum 延续维护的 GPL 分支，当前仓库继续承载品牌化、打包修复、Windows 行为优化、工作流改进和后续发布维护。

许可证：[GNU GPL v3.0](./LICENSE)
