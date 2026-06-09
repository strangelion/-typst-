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
- **灵活配置** — 封面信息、显示顺序、附加功能（装订线、评分表、页眉）均可自由调整

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
head: (name: "主标题", value: "XXXX期末", visible: true, depth: 1),
title: (name: "副标题", value: "考核论文", visible: true, depth: 2),
author: (name: "学生姓名", value: "XXX", visible: true, depth: 9),
student-id: (name: "学号", value: "XXXXXXXXXX", visible: true, depth: 10),
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
├── template.typ              # 核心样式模板（封面、标题、三线表、公式编号等）
├── config.typ                # 元数据配置
├── references.bib            # 文献数据库
├── typst.toml                # 项目配置文件
├── resource/
│   ├── logo.png              # 河北大学 Logo
│   └── fonts/                # 自定义字体
├── content/
│   ├── abstract.typ          # 中英文摘要
│   ├── acknowledgments.typ   # 致谢
│   └── chapter1.typ~6.typ    # 各章内容
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

### 正文页眉

在 `config.typ` 中设置页眉：

```typst
header-text: "河北大学 课程论文",  // 正文页眉，设为 none 则不显示
```

页眉在封面页不显示，从摘要、目录到正文所有页面均显示。

---

## 内置功能

### 三线表

学术论文标准表格：顶线粗、栏目线细、底线粗，无竖线。

```typst
#three-line-table(
  columns: (1fr, auto, auto),
  [名称], [数量], [价格],
  table.hline(stroke: 0.5pt),
  [苹果], [3], [¥5],
  [香蕉], [2], [¥3],
)
```

### 带编号的公式

块级公式，编号自动右对齐，格式为 `(章号-序号)`，换章自动重置。

```typst
#eq-block[$ a^2 + b^2 = c^2 $] <eq:pythagoras>
```

引用：`@eq:pythagoras`

### 附录模式

在附录内容前添加：

```typst
#appendix()
```

后续标题编号自动切换为 "附录A" "附录B" ...

### 代码块样式

行内代码 `raw` 和代码块都有等宽字体 + 浅灰背景 + 圆角样式，直接原生使用即可。

---

## 参考文献

使用 GB/T 7714-2015 中文国标引用样式（numeric）。在 `references.bib` 中填入文献信息，正文用 `@key` 引用：

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
