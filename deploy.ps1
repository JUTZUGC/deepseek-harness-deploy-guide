# DeepSeek Harness npm 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/deepseek-ai/deepseek-harness#quick-start
# 更新日期：2026-10-27
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw '需要先安装 Node.js' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

npm.cmd install -g @deepseek-ai/dsh
dsh --version
Write-Host '安装完成：运行 dsh web 打开工作台；首次使用按提示配置模型与 API Key'

Write-Host ''

Write-Host '部署完成：运行 dsh web 打开工作台，或 dsh --help 查看全部子命令'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/deepseek-ai/deepseek-harness#quick-start'
