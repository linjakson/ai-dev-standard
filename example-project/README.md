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

1. 工程師完成開發後，先推到 `ai/<工程師>/<任務>` 分支做自我驗證（含前端/API 驗收）。
2. 將預覽結果提交給 PM，由 PM 做最終確認。
3. 確認無虞後透過 PR 合併到整合分支。
4. 以 `CI` 成功作為合併條件，合併後再進行後續環境部署。

此流程可將「先確認品質」與「最後權責」分開，避免非預期直接推上主線。
