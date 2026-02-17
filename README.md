# 🤖 AI Agent 專案預設規則

> 為 AI 編程助手打造的專案預設規則集。

---

## 📌 這是什麼？

一套可直接複製到任何新專案根目錄的 **AI 編程助手規則檔案**，讓 Claude Code、Gemini CLI、GitHub Copilot 等工具在開發時自動遵循統一的工作規範。

### 核心理念
- 🎯 **問題導向** — 從最小可行方案開始，拒絕過度設計
- 🧠 **上下文工程** — 精準管理 AI 的上下文窗口，提升輸出品質
- 🔄 **跨 AI 協作** — 不同 AI 工具可無縫交接同一個專案
- 📁 **目錄化記憶** — 使用 `.ai-memory/` 取代單一檔案，適應大型專案

---

## 📂 檔案結構

```
本目錄/
├── README.md                          ← 本文件
├── AGENTS.md                          ← 共用核心規則（Single Source of Truth）
├── CLAUDE.md                          ← Claude Code 專屬擴展
├── GEMINI.md                          ← Gemini CLI 專屬擴展
├── 新專案開發流程規範.html              ← 開發流程規範（HTML 視覺化版）
├── 為什麼這樣規劃_設計理念說明.html  ← 規則設計理念與背景知識
├── init-project.sh                    ← 一鍵初始化腳本（Linux/Mac）
├── init-project.ps1                   ← 一鍵初始化腳本（Windows）
└── example-project/                   ← 範例專案模板（可直接複製使用）
```

### 規則繼承架構

```
AGENTS.md（共用核心）
  ↑ 繼承              ↑ 繼承
CLAUDE.md            GEMINI.md
（Claude 專屬）      （Gemini 專屬）
```

| 檔案 | 角色 | 內容 |
|------|------|------|
| **AGENTS.md** | 共用核心 | 需求決策樹、上下文工程、`.ai-memory/` 記憶管理、程式碼規範、邊界規則、跨 AI 協作規範 |
| **CLAUDE.md** | 擴展 | 長上下文策略、子任務委派、結構化回寫、Prompt 迭代法 |
| **GEMINI.md** | 擴展 | 分層指令架構、多模態運用、YAML 工具描述模板、效能追蹤指標 |

---

## 🚀 使用方式

### 方法 1：複製範例專案（最快）

```bash
cp -r example-project/ /path/to/your/new-project/
```

### 方法 2：一鍵初始化腳本

```bash
# Linux / Mac
cd /path/to/your/new-project/
bash /path/to/Agent指南/init-project.sh

# Windows PowerShell
cd C:\path\to\your\new-project
.\init-project.ps1
```

腳本會自動建立：`.ai-memory/` 目錄結構、`.github/workflows/ci.yml`、`CODEOWNERS`、`.gitignore`

### 方法 3：手動設定

1. 將 `AGENTS.md`、`CLAUDE.md`、`GEMINI.md` 複製到你的專案根目錄
2. 建立 `.ai-memory/` 目錄結構（參考 AGENTS.md）
3. AI 工具啟動時會自動讀取對應的規則檔

### 搭配不同 AI 工具

| AI 工具 | 會讀取的檔案 |
|---------|-------------|
| **Claude Code** | AGENTS.md → CLAUDE.md → `.ai-memory/` |
| **Gemini CLI** | AGENTS.md → GEMINI.md → `.ai-memory/` |
| **GitHub Copilot / Cursor** | AGENTS.md → `.ai-memory/` |

---

## 📋 涵蓋的專案生命週期

### 前期規劃（PLANNING）
- 需求評估決策樹（API → Workflow → Agent → 混合架構）
- System Prompt 迭代法（3-5 條 → 觀察 → 精煉）

### 中期開發（DEVELOPMENT）
- 上下文工程（資訊品質分級、卸載策略）
- 工具描述標準格式
- `.ai-memory/` 目錄化記憶管理

### 後期驗證（VERIFICATION）
- 除錯 SOP（精確定位 → 最小重現 → 根因 → 最小修復）
- Always / Ask First / Never 邊界規則

### 跨 AI 協作
- 統一記憶寫入格式（`[日期 | AI名]` 標注）
- AI 切換交接清單
- 新 AI 啟動流程

### 📋 新專案開發流程
- 完整的開新專案 SOP（Repo → 開發端 → CI/CD → 伺服端 → 驗收）
- 多工程師協作（分支策略、衝突預防、小 PR 原則）
- AI 第一關 Review + 老闆最終 Approve 的雙層審核
- 詳見：[新專案開發流程規範.html](./新專案開發流程規範.html)

---

## ⚙️ 自訂與擴展

### 修改共用規則
編輯 `AGENTS.md`，所有 AI 工具都會遵循更新後的規則。

### 新增 AI 工具支援
建立新的擴展檔（如 `COPILOT.md`），開頭聲明繼承 AGENTS.md：
```markdown
# 📌 本檔案繼承 AGENTS.md 的所有共用規則。
# 以下僅定義 [工具名稱] 特有的能力優化。
```

### 調整記憶目錄
依據專案規模調整 `.ai-memory/` 的子目錄結構，但保持 `_index.md` 索引機制。

---

## 📄 授權

本規則集為開放使用，歡迎依據自身需求修改與分享。

## Verification
- Last verified: 2026-02-18 (Public Access Test)

