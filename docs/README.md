# Neovim Configuration Overview

基于 **lazy.nvim** 的模块化 Neovim 配置，使用 Lua 编写。

## 目录结构

```
~/.config/nvim/
├── init.lua                       # 入口文件，引导 lazy.nvim，加载所有插件
├── lazy-lock.json                 # lazy.nvim 插件版本锁定文件
├── usage-suggestions.md           # 使用建议
└── lua/config/
    ├── options.lua                # 编辑器核心设置与浮动终端
    └── plugins/                   # 各插件独立配置文件
        ├── alpha.lua              # 启动画面
        ├── autocompletion.lua     # 代码补全
        ├── autoformatting.lua     # 代码格式化与 Lint
        ├── auto-pairs.lua         # 自动配对括号
        ├── autotag.lua            # 自动闭合 HTML/JSX 标签
        ├── bufferline.lua         # 顶部缓冲区标签栏
        ├── colorscheme.lua        # 主题配色
        ├── flash.lua              # 快速跳转
        ├── gitsigns.lua           # Git 行号指示
        ├── hover.lua              # 悬浮文档
        ├── indent-blankline.lua   # 缩进指示线
        ├── lsp.lua                # LSP 语言服务
        ├── lualine.lua            # 底部状态栏
        ├── neotree.lua            # 文件浏览器侧栏
        ├── surround.lua           # 环绕字符操作
        ├── telescope.lua          # 模糊查找器
        ├── treesitter.lua         # 语法高亮与文本对象
        ├── trouble.lua            # 诊断面板
        └── which-key.lua          # 快捷键提示与管理
```

---

## 模块功能详解

### 1. 入口文件 (`init.lua`)

- 首先加载 `options.lua` 中的基础设置
- 自动引导安装 **lazy.nvim** 插件管理器（如未安装）
- 通过 `import("config.plugins")` 自动加载 `lua/config/plugins/` 下所有插件
- 设置主题为 `tokyonight`，若不可用则回退到 `unokai`

### 2. 编辑器核心设置 (`options.lua`)

**视觉与界面：**
- 行号：绝对行号 + 相对行号
- 当前行高亮、24-bit 真彩色
- 右侧 100 字符参考线
- 始终显示 sign column（用于 LSP/Git 标记）
- 补全菜单透明（`pumblend = 10`）

**缩进：**
- Tab 宽度 = 2 空格，使用空格替代 Tab
- 智能缩进与自动缩进

**搜索：**
- 智能大小写（全小写忽略大小写，含大写则区分）
- 增量搜索，不持久高亮搜索结果

**文件处理：**
- 不创建 swap/backup 文件
- 启用持久撤销（undo history）
- 自动重载外部修改的文件
- 系统剪贴板集成

**代码折叠：**
- 基于 Treesitter 的语法折叠
- 默认展开所有折叠（`foldlevel = 99`）

**自动命令：**
- `TextYankPost`：高亮复制文本
- `TermOpen`：终端缓冲区禁行号
- `FileType markdown`：自动换行，80 字符参考线

**浮动终端（`<leader>t`）：**
- 80% 屏幕尺寸的浮动窗口终端
- 支持切换开关（重复按 `<leader>t` 关闭）
- 终端模式下按 `<Esc>` 关闭
- 透明背景，圆角边框

### 3. 插件模块

#### 启动画面 - `alpha.lua`
- **插件**: `goolord/alpha-nvim`
- 使用 `startify` 主题
- 自定义 ASCII art 标题 "ICAMS"（红色）
- 显示最近文件、快捷按钮等

#### 代码补全 - `autocompletion.lua`
- **主引擎**: `saghen/blink.cmp`（新一代高性能补全引擎）
- **片段引擎**: `L3MON4D3/LuaSnip`（含 regex 支持）
- 补全源: LSP、路径、代码片段、lazydev
- 预设 `default` 键位映射（`<C-y>` 确认，`<C-n>/<C-p>` 选择）
- Nerd Font Mono 图标对齐
- 内置模糊匹配（Lua 实现）
- 函数签名帮助已启用

#### LSP 语言服务 - `lsp.lua`
- **插件**: `neovim/nvim-lspconfig`
- **依赖**:
  - `mason.nvim` — LSP 服务器管理
  - `mason-lspconfig.nvim` — Mason 与 lspconfig 桥接
  - `mason-tool-installer.nvim` — 自动安装工具
  - `fidget.nvim` — LSP 加载状态指示
- **已配置语言服务器**:
  - `clangd` — C/C++
  - `pyright` — Python
  - `vtsls` — TypeScript/JavaScript（含 inlay hints 和函数调用补全）
  - `lua_ls` — Lua（含 Neovim 运行时库配置）
- **自动安装工具**: `stylua`, `vtsls`, `eslint_d`
- **LSP 快捷键**（`<leader>g` 前缀）:
  - `gr` — 重命名
  - `ga` — 代码操作
  - `gd` — 跳转定义
  - `gD` — 跳转声明
  - `gI` — 跳转实现
  - `gR` — 查找引用
  - `gt` — 跳转类型定义
  - `gO` — 文档符号
  - `gW` — 工作区符号
- **诊断配置**: 圆角浮动窗口，Nerd Font 图标，虚拟文本显示错误信息

#### 语法高亮 - `treesitter.lua`
- **插件**: `nvim-treesitter/nvim-treesitter`
- **依赖**: `nvim-treesitter-textobjects`（文本对象支持）
- **已安装语言**: bash, c, diff, html, lua, markdown, python, javascript, typescript, tsx, css, scss, json, yaml 等
- **功能**:
  - 语法高亮（>100KB 文件自动禁用）
  - 增量选择（`<C-space>` 展开选择）
  - 代码折叠
  - **文本对象** — `af`/`if`（函数）、`ac`/`ic`（类）、`ab`/`ib`（块）
  - **跳转移动** — `]f`/`[f`（函数间跳转）、`]c`/`[c`（类间跳转）

#### 模糊查找器 - `telescope.lua`
- **插件**: `nvim-telescope/telescope.nvim`
- **依赖**: `telescope-fzf-native`（原生模糊排序）、`telescope-ui-select`（UI 选择增强）
- **快捷键**（`<leader>f` 前缀）:
  - `ff` — 查找文件
  - `fg` — 实时 grep
  - `fw` — 查找当前单词
  - `fd` — 查找诊断
  - `fk` — 查找快捷键
  - `fr` — 最近文件
  - `f.` — 恢复上次搜索
  - `fc` — 查找命令
  - `fh` — 查找帮助
  - `fb` — 当前缓冲区模糊查找
  - `f/` — 已打开文件中 grep

#### 文件浏览器 - `neotree.lua`
- **插件**: `nvim-neo-tree/neo-tree.nvim`（v3.x）
- `<leader>e` 切换文件树
- 显示隐藏文件和 `.gitignore` 文件

#### 缓冲区标签栏 - `bufferline.lua`
- **插件**: `akinsho/bufferline.nvim`
- `buffer` 模式（非 tab 模式）
- 显示关闭按钮、修改指示器
- 按插入顺序排序，最大宽度 15 字符
- Nord 风格分隔符配色

#### 状态栏 - `lualine.lua`
- **插件**: `nvim-lualine/lualine.nvim`
- Nord 主题配色
- **左区域**: 模式（带图标）、Git 分支、文件名
- **右区域**: 诊断信息、Git 差异、编码、文件类型、光标位置、进度
- 窄窗口（≤100 列）自动隐藏部分组件
- 在 `alpha`/`neo-tree` 中禁用

#### 主题配色 - `colorscheme.lua`
- **插件**: `folke/tokyonight.nvim`
- 高优先级加载（`priority = 1000`）

#### 快捷键提示 - `which-key.lua`
- **插件**: `folke/which-key.nvim`
- **核心快捷键管理文件**，所有快捷键在此集中定义
- 500ms 延迟弹出提示
- Modern 预设样式

**快捷键汇总：**

| 前缀 | 功能 |
|---+---|
| `<leader>b` | 缓冲区操作（切换、删除、列表） |
| `<leader>w` | 窗口操作（分割、关闭、跳转） |
| `<leader>f` | Telescope 查找 |
| `<leader>g` | LSP 跳转 |
| `<leader>z` | 代码折叠 |
| `<leader>x` | Trouble 诊断面板 |
| `<leader>d` | 无复制删除 |
| `<leader>e` | 切换文件树 |
| `<leader>t` | 浮动终端 |
| `<C-h/j/k/l>` | 窗口间跳转 |
| `<C-↑/↓/←/→>` | 窗口大小调整 |
| `<A-j/k>` | 移动行/选区 |

#### Git 集成 - `gitsigns.nvim`
- **插件**: `lewis6991/gitsigns.nvim`
- 行号列显示增/删/改标记
- 使用 ASCII 字符 `+`/`~`/`_`

#### 诊断面板 - `trouble.nvim`
- **插件**: `folke/trouble.nvim`
- **快捷键**（`<leader>x` 前缀）:
  - `xx` — 切换诊断列表
  - `xX` — 当前缓冲区诊断
  - `xs` — LSP 符号列表
  - `xl` — LSP 引用/定义
  - `xL` — 位置列表
  - `xQ` — Quickfix 列表

#### 快速跳转 - `flash.nvim`
- **插件**: `folke/flash.nvim`
- 比 easymotion 更快的跳转导航
- `s` — 字符跳转（n/x/o 模式）
- `S` — Treesitter 节点跳转
- `r` — 远程跳转（o 模式）
- `R` — Treesitter 搜索（o/x 模式）

#### 环绕字符 - `surround.lua`
- **插件**: `kylechui/nvim-surround`
- 类 vim-surround 功能
- 额外添加 LaTeX `\text{}` 环绕（`T` 键）

#### 自动配对 - `auto-pairs.lua`
- **插件**: `windwp/nvim-autopairs`
- 自动补全括号、引号等配对字符
- `<C-e>` 快速包裹

#### 自动闭合标签 - `autotag.lua`
- **插件**: `windwp/nvim-ts-autotag`
- 基于 Treesitter 自动闭合 HTML/JSX 标签
- 支持文件类型: html, javascript, typescript, tsx, xml, markdown

#### 代码格式化 - `autoformatting.lua`
- **插件**: `nvimtools/none-ls.nvim`
- **格式化工具**:
  - `prettier` — HTML/JSON/YAML/Markdown/JS/TS/CSS/SCSS
  - `stylua` — Lua
  - `shfmt` — Shell（4 空格缩进）
  - `terraform_fmt` — Terraform
  - `clang-format` — C/C++/ObjC/CUDA
  - `ruff` / `ruff_format` — Python
- **Lint 工具**:
  - `eslint_d` — JavaScript/TypeScript
  - `checkmake` — Makefile
  - `ruff` — Python
- 保存时自动格式化（`BufWritePre` 事件）

#### 悬浮文档 - `hover.nvim`
- **插件**: `lewis6991/hover.nvim`
- `K` — 显示悬浮文档（LSP + 诊断）
- `gK` — 选择 hover 来源
- `<C-n>/<C-p>` — 切换 hover 来源
- 支持鼠标悬停显示（1 秒延迟）

#### 缩进指示线 - `indent-blankline.nvim`
- **插件**: `lukas-reineke/indent-blankline.nvim`
- 彩虹色缩进线（红/黄/蓝/橙/绿/紫/青）
- 在帮助、启动画面等特定文件类型中禁用
- 禁用了 scope 指示器

---

## 键位速查

| 快捷键 | 模式 | 功能 |
|---+---|
| `<space>` | — | Leader 键 |
| `<leader>t` | n | 浮动终端切换 |
| `<leader>e` | n | 文件树切换 |
| `<leader>d` | n/v | 无复制删除 |
| `<leader>ff` | n | 查找文件 |
| `<leader>fg` | n | 实时 Grep |
| `<leader>fr` | n | 最近文件 |
| `<leader>fb` | n | 当前缓冲区模糊查找 |
| `<leader>f/` | n | 已打开文件中 Grep |
| `<leader>gd` | n | 跳转定义 |
| `<leader>gr` | n | 重命名 |
| `<leader>ga` | n/x | 代码操作 |
| `<leader>gR` | n | 查找引用 |
| `<leader>xx` | n | Trouble 诊断切换 |
| `K` | n | Hover 文档 |
| `s` | n/x/o | Flash 快速跳转 |
| `S` | n/o/x | Flash Treesitter 跳转 |
| `]f`/`[f` | n | 函数间跳转 |
| `]c`/`[c` | n | 类间跳转 |
| `<A-j>`/`<A-k>` | n/v | 移动行/选区 |
| `<C-h/j/k/l>` | n | 窗口跳转 |
| `<C-↑/↓/←/→>` | n | 窗口大小调整 |
| `<leader>z` | n | 折叠操作前缀 |

## 技术选型

| 类别 | 选择 | 说明 |
|---+---|
| 包管理器 | lazy.nvim | 高性能、懒加载 |
| 补全引擎 | blink.cmp | 新一代 Rust/Lua 补全，替代 nvim-cmp |
| 片段引擎 | LuaSnip | Lua 原生，性能优异 |
| LSP 安装 | Mason | 自动化 LSP/工具管理 |
| 格式化 | none-ls | null-ls 社区继任 |
| TypeScript LSP | vtsls | 比 tsserver 更快，功能更多 |
