# AGENTS.local.md — 專案覆寫範本

## 1. 語言與回覆

- 預設回覆語言：繁體中文

## 2. Repo 與主線

- GitHub repo：`https://github.com/<org>/<repo>`
- 預設主線：`main`

## 3. Preview 契約

- `preview_mode`: `required`
- `preview_base_url`: `https://preview.example.com`
- `preview_url_template`: `https://preview.example.com/p/<engineer>/<task>/`
- `preview_branch_pattern`: `ai/<engineer>/<task>`
- `preview_target_page_rule`: 回報時只附本次修改目標頁；若使用者指定單號 / ID，預覽網址必須帶完整路徑或 query
- `preview_required_checks`:
  - `/api/auth/me`
  - `/api/auth/login`
  - 目標頁主流程
  - 相關 API 無 500
- `preview_runtime_note`: preview 必須部署到專案自有 staging / preview host，或受控的隔離路徑；不得以 `ngrok` / `localtunnel` / `localhost.run` 當成正式 preview

## 4. 無 Preview 時的暫行 fallback

- 若目前沒有穩定 preview，改為：
  - `preview_mode`: `fallback_artifact`
  - 必附：截圖、artifact、最小重現步驟
  - 必填：建立 preview 基礎設施的追蹤 issue / change / task
