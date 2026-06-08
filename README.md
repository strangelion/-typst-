# HeBeiUniversity-template-Typst

河北大学 **非官方** Typst 论文/考核模板。

基于中文学术规范设计，帮助快速完成论文封面、章节排版和参考文献，让使用者专注于写作本身。

> ⚠️ **免责声明**：本模板为个人制作，与河北大学官方无关。使用前请确认是否符合您的课程/学院的具体要求。

---

## 特点

- **简洁写作** — 全程使用标记式语法，告别复杂的 LaTeX 命令
- **符合学术规范** — 内置中文论文标准格式（封面、各级标题、图表编号等）
- **快速渲染** — 基于 Typst 引擎，实时编译，所见即所得
- **完整的章节结构** — 预设从"摘要"到"致谢"的完整文档框架
- **参考文献支持** — 集成 GB/T 7714 中文国标引用样式
- **灵活配置** — 封面信息、显示顺序、附加功能（装订线、评分表）均可自由调整

---

## 快速开始

### 1. 环境准备

- **本地安装**（推荐）：
  - Windows：[GitHub Releases](https://github.com/typst/typst/releases) 下载 `typst-x86_64-pc-windows-msvc.zip`，解压后加入 PATH
  - macOS/Linux：`brew install typst` / `cargo install typst-cli`
  - VS Code 插件（推荐）：安装 "Tinymist Typst"，保存即自动刷新预览
- **在线使用**：[Typst 官网](https://typst.app/) 或 [GitHub Codespaces](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=strangelion/HeBeiUniversity-template-Typst)

### 2. 获取模板

```bash
git clone https://github.com/strangelion/HeBeiUniversity-template-Typst.git
cd HeBeiUniversity-template-Typst
```

### 3. 配置信息

编辑 `config.typ`，修改个人信息：

```typst
head: (name: "主标题", value: "物理科学与技术学院期末", visible: true, depth: 1),
title: (name: "副标题", value: "考核论文", visible: true, depth: 2),
author: (name: "学生姓名", value: "王文轩", visible: true, depth: 9),
student-id: (name: "学号", value: "20231301022", visible: true, depth: 10),
```

- `value` — 字段内容
- `visible` — `true` 显示，`false` 隐藏
- `info-order` — 控制封面信息的显示顺序（如 `(4, 6, 7, 13, 10, 9, 11)`）

### 4. 编译

```bash
typst compile main.typ paper.pdf
```

**字体问题**：若编译报字体错误，请手动指定字体路径：

```bash
typst compile --font-path ./resource/fonts main.typ paper.pdf
```

使用 VS Code 插件时，固定 `main.typ` 为主文件（`Ctrl+Shift+P` → "Typst: Pin the Main File to the Currently Open Document"），之后会自动预览。

---

## 项目结构

```
HeBeiUniversity-template-Typst/
├── main.typ                  # 论文入口文件
├── template.typ              # 核心样式模板
├── config.typ                # 元数据配置
├── references.bib            # 文献数据库
├── typst.toml                # 项目配置文件
├── resource/
│   ├── logo.png              # 河北大学 Logo
│   └── fonts/                # 自定义字体
├── content/
│   ├── abstract.typ          # 中英文摘要
│   ├── acknowledgments.typ   # 致谢
│   ├── chapter1.typ~6.typ    # 各章内容
├── modules/
│   └── utils.typ             # 工具函数
└── README.md
```

---

## 配置说明

### 封面信息

所有字段在 `config.typ` 的 `conf` 字典中统一管理，修改一次即可全局生效。

| depth | 字段 | 说明 |
|-------|------|------|
| 1 | head | 主标题 |
| 2 | title | 副标题 |
| 3 | title-en | 英文标题 |
| 4 | school-semester | 学期信息 |
| 5 | school | 学校名称 |
| 6 | course-id | 课程号 |
| 7 | course-name | 课程名称 |
| 8 | college | 学院名称 |
| 9 | author | 学生姓名 |
| 10 | student-id | 学号 |
| 11 | class | 班级信息 |
| 12 | major | 专业名称 |
| 13 | supervisor | 指导教师 |

### 信息显示顺序

通过 `info-order` 控制封面信息表格的排列顺序（填入 depth 值），例如：

```typst
info-order: (4, 6, 7, 13, 10, 9, 11),
```

### 附加功能

```typst
add-on: (1, 2),  // 1 = 装订线，2 = 评分表
evaluation: (evaluation-data, evaluation-style),  // 评分表内容与样式
```

---

## 参考文献

使用 GB/T 7714-2015 中文国标引用样式（numeric）。在 `references.bib` 中填入文献信息，正文用 `#cite` 引用：

```typst
根据文献 @ref1 的研究……
```

如需引用全部文献，在 `main.typ` 中启用：

```typst
#bibliography("references.bib", title: "参考文献", full: true, style: "gb-7714-2015-numeric")
```

---

## LaTeX 版本

本模板的 LaTeX 移植版：[HeBeiUniversity-template-LaTeX](https://github.com/strangelion/HeBeiUniversity-template-LaTeX)

---

## License

MIT
