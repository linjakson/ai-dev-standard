# ============================================
# init-project.ps1 — AI 輔助開發專案初始化腳本（Windows）
# ============================================
# 用法：在新專案根目錄執行
#   .\init-project.ps1
# ============================================

Write-Host "🚀 正在初始化 AI 輔助開發專案..." -ForegroundColor Cyan
Write-Host ""

# --- 1. 建立 .ai-memory/ 目錄結構 ---
Write-Host "📁 建立 .ai-memory/ 記憶目錄..." -ForegroundColor Yellow

$dirs = @(
  ".ai-memory\decisions",
  ".ai-memory\progress",
  ".ai-memory\issues",
  ".ai-memory\context",
  ".ai-memory\lessons"
)
foreach ($dir in $dirs) {
  New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

# 決策索引
@"
# 架構決策索引

| 日期 | 標題 | 狀態 | AI |
|------|------|------|-----|
<!-- 範例：| 2025-03-15 | 選擇 JWT 認證 | ✅ 已執行 | Claude | -->
"@ | Set-Content -Path ".ai-memory\decisions\_index.md" -Encoding UTF8

# 進度索引
@"
# 全域進度總覽

> 最後更新：（由 AI 自動更新）

## 模組進度
| 模組 | 狀態 | 負責 AI | 最後更新 |
|------|------|---------|---------|
<!-- 範例：| 前端 | 🔄 進行中 | Gemini | 2025-03-16 | -->
"@ | Set-Content -Path ".ai-memory\progress\_index.md" -Encoding UTF8

# Issues
@"
# 未解決問題

<!-- 格式：
## [日期 | AI] 問題標題
- 描述：
- 優先級：🔴高 / 🟡中 / 🟢低
- 相關檔案：
-->
"@ | Set-Content -Path ".ai-memory\issues\open.md" -Encoding UTF8

@"
# 已解決問題

<!-- 已解決的問題從 open.md 移到這裡，保留歷史參考 -->
"@ | Set-Content -Path ".ai-memory\issues\resolved.md" -Encoding UTF8

# 問題追蹤索引
@"
# 問題追蹤索引

- [未解決問題](./open.md)
- [已解決問題](./resolved.md)
"@ | Set-Content -Path ".ai-memory\issues\_index.md" -Encoding UTF8

# 經驗索引
@"
# 經驗學習索引

| 日期 | 標題 | 標籤 | AI |
|------|------|------|-----|
<!-- 範例：| 2025-03-18 | AG Grid 佈局陷阱 | AG-Grid, CSS | Claude | -->
"@ | Set-Content -Path ".ai-memory\lessons\_index.md" -Encoding UTF8

# 架構文件
@"
# 系統架構概觀

> 由 AI 在開發過程中維護，記錄系統的整體架構。

## 技術棧
<!-- 填入專案使用的技術 -->

## 目錄結構
<!-- 填入專案的目錄結構說明 -->

## 模組關係
<!-- 填入各模組之間的關係 -->
"@ | Set-Content -Path ".ai-memory\architecture.md" -Encoding UTF8

@"
# 環境設定

## 開發環境需求
<!-- 填入所需的開發工具和版本 -->

## 安裝步驟
<!-- 填入安裝步驟 -->

## 環境變數
<!-- 填入需要的環境變數（不含實際值） -->
"@ | Set-Content -Path ".ai-memory\setup.md" -Encoding UTF8

@"
# 開發規範

> 本檔案補充 AGENTS.md 中的通用程式碼規範，記錄本專案的特定慣例。

## 專案特定規範
<!-- 填入本專案特有的開發規範 -->
"@ | Set-Content -Path ".ai-memory\coding-standards.md" -Encoding UTF8

Write-Host "  ✅ .ai-memory/ 目錄建立完成" -ForegroundColor Green

# --- 2. 建立 GitHub Actions CI ---
Write-Host "📦 建立 CI/CD Pipeline..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path ".github\workflows" -Force | Out-Null

@"
name: CI

on:
  pull_request:
    branches: [main, develop]

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: 安裝依賴
        run: npm install

      - name: 程式碼檢查
        run: npm run lint

      - name: 單元測試
        run: npm test

      - name: 建置確認
        run: npm run build
"@ | Set-Content -Path ".github\workflows\ci.yml" -Encoding UTF8

Write-Host "  ✅ .github/workflows/ci.yml 建立完成" -ForegroundColor Green

# --- 3. 建立 CODEOWNERS ---
Write-Host "👔 建立 CODEOWNERS..." -ForegroundColor Yellow
@"
# 所有 PR 自動指派老闆 review
# 請將下方的 @owner 替換為老闆的 GitHub 帳號
* @owner
"@ | Set-Content -Path "CODEOWNERS" -Encoding UTF8

Write-Host "  ✅ CODEOWNERS 建立完成（請修改 @owner 為實際帳號）" -ForegroundColor Green

# --- 4. 建立 .gitignore ---
Write-Host "📝 建立 .gitignore..." -ForegroundColor Yellow
@"
# Dependencies
node_modules/
venv/
__pycache__/

# Build
dist/
build/
*.egg-info/

# Environment
.env
.env.local
.env.*.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
npm-debug.log*
"@ | Set-Content -Path ".gitignore" -Encoding UTF8

Write-Host "  ✅ .gitignore 建立完成" -ForegroundColor Green

# --- 5. 完成 ---
Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "🎉 專案初始化完成！" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 下一步："
Write-Host "  1. 複製 AGENTS.md, CLAUDE.md, GEMINI.md 到專案根目錄"
Write-Host "  2. 修改 CODEOWNERS 中的 @owner 為老闆的 GitHub 帳號"
Write-Host "  3. 根據專案類型修改 .github/workflows/ci.yml"
Write-Host "  4. git init; git add .; git commit -m 'init: 專案初始化'"
Write-Host "  5. git remote add origin <repo-url>; git push -u origin main"
Write-Host ""
