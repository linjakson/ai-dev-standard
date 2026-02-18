# 範例專案模板

此目錄包含一個已初始化完成的專案範本，可直接複製到新專案使用。

## 目錄結構

```
example-project/
├── .ai-memory/              ← AI 共用記憶庫（已初始化）
│   ├── decisions/
│   │   └── _index.md
│   ├── progress/
│   │   └── _index.md
│   ├── issues/
│   │   ├── open.md
│   │   ├── resolved.md
│   │   └── _index.md
│   ├── context/
│   ├── architecture.md
│   ├── setup.md
│   └── coding-standards.md
├── .github/
│   └── workflows/
│       └── ci.yml           ← GitHub Actions CI 範本
├── AGENTS.md                ← AI 共用核心規則
├── CLAUDE.md                ← Claude 專屬擴展
├── GEMINI.md                ← Gemini 專屬擴展
├── CODEOWNERS               ← PR 審核指派（需修改 @owner）
├── .gitignore               ← Git 忽略規則
└── README.md                ← 本文件
```

## 使用方式

```bash
# 方法 1：複製整個目錄
cp -r example-project/ /path/to/your/new-project/

# 方法 2：在新專案中執行初始化腳本
cd /path/to/your/new-project/
bash ../Agent指南/init-project.sh

# 方法 3（Windows）
cd C:\path\to\your\new-project\
powershell -File ..\Agent指南\init-project.ps1
```

## 初始化後必做

1. 修改 `CODEOWNERS` 中的 `@owner` 為老闆的 GitHub 帳號
2. 根據專案類型調整 `.github/workflows/ci.yml`
3. 填寫 `.ai-memory/architecture.md` 的技術棧資訊
4. 填寫 `.ai-memory/setup.md` 的環境設定

## 佈署與核可節奏（建議）

1. 工程師在 `ai/<工程師>/<任務>` 分支完成實作與本地驗證。
2. push 後以 `https://sp-staging.kwanxin.com/p/<github-使用者>/<分支名>/` 進行分支預覽自我驗證。
3. 驗證項目至少包含登入流程、主頁進入、目標 API 回應與基本流程可操作。
4. 將驗證截圖與結果回報 PM，由 PM 給最終「可上線」判定。
5. 通過後提 PR 到 `surprise/bootstrap`，並要求 CI 完全通過（含 `/api` 健檢與 healthcheck）。
6. 以 PM 最終核准為前提完成 merge，並於 merge 後回報 staging 覆核結果。

此流程可將「開發者自我驗證」與「PM 最終核可」分層，避免未授權直接推上主線或未測回歸的代碼上線。
