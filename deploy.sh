#!/usr/bin/env bash
set -euo pipefail
# DeepSeek Harness npm 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/deepseek-ai/deepseek-harness#quick-start
# 更新日期：2026-10-27
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "需要先安装 Node.js"; exit 1; }

mkdir -p .download
cd .download

npm install -g @deepseek-ai/dsh
dsh --version
echo '安装完成：运行 dsh web 打开工作台；首次使用按提示配置模型与 API Key'

echo ""

echo "部署完成：运行 dsh web 打开工作台，或 dsh --help 查看全部子命令"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/deepseek-ai/deepseek-harness#quick-start"
