# DeepSeek Harness npm 安装指南

> 第三方部署指南 · 非 DeepSeek Harness 官方仓库。官方项目：[deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://github.com/deepseek-ai/deepseek-harness#quick-start)为准。

[![⚡ npm 安装](https://img.shields.io/badge/%E2%9A%A1_npm_%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#npm安装推荐用百度搭子)

## npm 安装（推荐：用百度搭子）

> [!TIP]
> 想在本地跑 DeepSeek 的编码 Agent，让百度搭子把 dsh 装好，一条命令打开 Web 工作台。

⚠️ 当前 npm 版本是 0.2.1-rc.2 预发布版，接口和行为可能变化。需要 Node.js 20 以上；Web 工作台默认只监听本机。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/deepseek-harness-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子用 npm 全局安装 @deepseek-ai/dsh，再启动本地 Web 界面，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## DeepSeek Harness 是什么？

DeepSeek Harness 是开源的263.2k stars，MIT，DeepSeek 的编码 Agent 框架，一切皆插件（协议：MIT，<img src="https://img.shields.io/github/stars/deepseek-ai/deepseek-harness?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

DeepSeek 的编码 Agent 框架：把模型、工具、界面都做成插件，通过 CLI 或 Web 工作台驱动代码读写、命令执行与多步任务。

- 263.2k stars：两个月冲到 26 万，十一月大概率继续霸榜
- 一切皆插件：模型、工具、界面都可替换
- CLI + Web：`dsh web` 直接开浏览器工作台
- MIT：完全开源
- 插件生态：桌面端、Web 端、插件市场都已出现
- DeepSeek 官方团队维护

（来源：[官方仓库](https://github.com/deepseek-ai/deepseek-harness)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 263.2k stars | 两个月成为现象级项目 |
| 插件化彻底 | 模型和界面都能换 |
| CLI + Web 双入口 | 终端和浏览器都能用 |
| MIT | 可改可分发 |
| 生态已成型 | 桌面端与插件市场都有 |

| 需要注意 | 说明 |
|---|---|
| 仍是 RC | 0.2.1-rc.2，接口会变 |
| 插件版本要对齐 | 混用容易报错 |
| 需要模型额度 | 框架本身不含模型 |
| 生态项目多且杂 | 质量参差 |
| 文档跟进快 | 旧教程容易失效 |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 快速部署（官方方式）

```bash
npm install -g @deepseek-ai/dsh
dsh --version
echo '安装完成：运行 dsh web 打开工作台；首次使用按提示配置模型与 API Key'
```

部署步骤来源：[https://github.com/deepseek-ai/deepseek-harness#quick-start](https://github.com/deepseek-ai/deepseek-harness#quick-start)

## 验证状态

| 场景 | 状态 |
|---|---|
| npm 包 @deepseek-ai/dsh 最新版 0.2.1-rc.2，bin 为 dsh | 已核对 2026-10-27 |
| 仓库元数据已核对：263.2k stars、MIT、2026-08 建仓 | 已核对 2026-10-27 |
| README 确认 npx @deepseek-ai/dsh web 为启动方式 | 已核对 2026-10-27 |
| 未实测安装与 Web 工作台 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

dsh 自带插件体系，部分插件可接 MCP；本仓库只负责安装与启动，不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\deepseek-harness-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后

```bash
dsh web            # 启动 Web 工作台
dsh --help         # 查看全部子命令
```

### 从源码跑

```bash
git clone https://github.com/deepseek-ai/deepseek-harness.git
cd deepseek-harness
pnpm install
pnpm build
```

### 首次配置

按 `dsh web` 页面提示填模型与 API Key；也可以先跑 `dsh` 走一遍终端向导。

### 插件生态

| 项目 | 作用 |
|---|---|
| `anywhere-labs/dsh-desktop` | 桌面客户端 |
| `dataelement/dsh-desktop` | 另一套桌面端 |
| `dsh-market/dsh-market` | 可视化插件市场 |
| `zhu1090093659/dsh-web` | Web 插件聚合 |

> ⚠️ 预发布版本升级频繁，插件与主程序版本要对齐；升级前先备份配置目录。

## 常见坑

- Node 版本太低：先升到 20 以上
- `dsh web` 打不开：看端口占用，或换端口启动
- 插件装完不生效：确认插件版本与主程序匹配
- 升级后配置失效：先备份 `~/.dsh` 一类配置目录
- 模型报 401：检查 API Key 与环境变量
- 别混装桌面端与 CLI 的旧版本

## 免责声明

本仓库为第三方指南，与 DeepSeek Harness 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://github.com/deepseek-ai/deepseek-harness#quick-start)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
