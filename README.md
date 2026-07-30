# AI 輔助研究與專案模板

這是一個可重複使用的研究與專案工作空間，適用於理論研究、實證研究、
資料科學，以及統計或資料相關的軟體與應用程式開發。它同時提供一套可選的
每週團隊協作流程，讓 Git、內部週報與 AI 輔助工具共同形成可追溯的專案記憶。

## 1. 使用方式與核心原則

- 不必使用所有資料夾或流程。應依專案性質選用需要的部分。
- Markdown 是研究脈絡、專案背景、協作紀錄與決策的主要工作記憶。
- 論文專案以 `deliverable/paper/` 中最相關的 LaTeX 草稿作為正式論述與
  符號的主要依據；實證與軟體專案則以相關程式碼、資料說明與當前成果為準。
- 優先使用 repo 內的文件與 Git 證據，不以缺乏依據的假設補足專案內容。
- Git commit 能證明變更已被記錄，但不能單獨證明成果品質、完成度、投入程度
  或唯一作者身分。
- AI 用來協助整理、檢查、分析與提出建議，不會自動管理團隊，也不會把建議
  當成已核准的決策。
- 每週團隊流程是選用功能。若專案沒有固定週會，可直接使用研究、寫作、模擬、
  簡報或審稿相關資料夾與 skills。
- 若啟用每週團隊流程，定稿的內部週報是工作分配、決策、backlog、風險與
  未解問題的歷史來源；最新週報的 `Next Actions` 是目前任務與分工的完整快照。
- 團隊成員可以修改自己的工作成果與下一次週會的 draft report；管理用的
  root documents 由 manager 維護，或在 manager 明確授權後由 AI 同步。

## 2. 資料夾內容與用途

| 路徑 | 內容與用途 |
| --- | --- |
| `references/` | 論文 PDF、外部資料來源與可重複使用的 Markdown 閱讀筆記。 |
| `attachments/meetings/` | 內部週報使用的白板、截圖或其他圖片。從 `report/` 連結時使用相對路徑。 |
| `attachments/references/` | 論文與閱讀筆記使用的圖片；需要時可再依 paper slug 建立子資料夾。 |
| `data/raw/` | 原始資料。原則上保留原貌，避免直接覆寫。 |
| `data/processed/` | 清理、轉換或整併後，可供分析使用的資料。 |
| `data/temp/` | 可以重新產生或刪除的中間資料。 |
| `data/code/` | 資料處理、清理與分析程式碼；若專案已有其他 code layout，可沿用既有結構。 |
| `finding/` | 實證結果、模擬、圖表及其他中間研究成果。 |
| `report/` | Markdown 報告與內部週報。週報直接命名為 `YYYY-MM-DD-weekly-meeting.md`，不建立專用的 `meetings/` 或 `weekly/` 子資料夾。其他報告可依任務需要分組。 |
| `deliverable/paper/` | LaTeX manuscript、論文草稿與正式文字成果。 |
| `deliverable/slides/` | Beamer 或其他簡報成果，通常由論文、findings 或已核准內容衍生。 |
| `deliverable/app/` | 軟體或應用程式的交付內容；目前是選用路徑，需要時再建立。 |
| `templates/` | 資料處理、finding 與 report 的共用模板；此路徑是 Git submodule。 |
| `yc-ai-assistant/` | 共用 AI 規則、skills、英文週報模板與詳細 workflow；此路徑是 Git submodule。 |
| `yc-ai-assistant/skills/` | 各種研究、寫作、審稿與團隊管理 skills。 |
| `yc-ai-assistant/templates/` | AI workflow 使用的模板，包括 `weekly-meeting.md`。 |
| `.vscode/` | 此工作空間的 VS Code 設定。 |

## 3. 專案初始化

### 3.1 初始化共用模板

clone repository 後，先初始化兩個 submodules：

```bash
git submodule update --init --recursive
```

`templates` submodule 使用 GitHub SSH URL；執行前需先確認本機已設定可用的
GitHub SSH access。

也可以使用 Makefile 分別初始化：

```bash
make templates
make ai-template-setup
```

`make ai-template-setup` 也會把共用的 `yc-ai-assistant/AGENTS.md` 同步到
root `AGENTS.md`。以下兩個 update targets 的作用不同：

```bash
make update
make ai-template-update
```

- `make update`：讓 `templates` 回到父 repo 目前記錄的 submodule commit；
  它不會自動抓取 remote 最新版本。
- `make ai-template-update`：從 `yc-ai-assistant` 的 remote branch 取得更新，
  並重新同步 root `AGENTS.md`。

### 3.2 填寫 root documents

初始化時先建立足夠的專案背景，不要把臨時討論或未核准的推測寫成正式狀態。

| 檔案 | 初始化時應填入的資訊 | 使用方式 |
| --- | --- | --- |
| `PROJECT.md` | 專案目的、目前階段、預期成果與成功標準、範圍、非目標、限制、workstreams 與目前焦點。 | 建議所有專案填寫，由 manager 維護。 |
| `TEAM.md` | 每位成員的固定 ID、姓名、角色、責任、所有 Git author name/email、可投入程度、review 領域與分工限制。 | 多人專案或週會流程使用。Git identity 只用來對應 commit，不是績效指標。 |
| `ROADMAP.md` | 目前最重要成果，以及每個 milestone 的 ID、outcome、definition of done、owner、預計期間、狀態與依賴關係。 | 有里程碑或多人協作時使用，由 manager 維護。 |
| `BACKLOG.md` | 目前尚未處理但不能遺忘的事項。 | 啟用週會流程時使用；初始化通常保留空表。 |
| `DECISIONS.md` | 目前仍有效的正式決策。 | 啟用週會流程時使用；初始化通常保留空表。 |
| `RISKS.md` | 目前尚未解除的風險、指標、影響、緩解方式與 owner。 | 啟用週會流程時使用；初始化通常保留空表。 |

`BACKLOG.md`、`DECISIONS.md` 與 `RISKS.md` 是 current-state views，不是另一套
會議紀錄。它們只能根據定稿的內部週報建立或更新；完整歷史仍保留在
`report/` 的週報中。

`AGENTS.md` 是 AI 在整個 repo 中使用的共同解讀與操作規則，不應拿來記錄
單一專案的進度。專案內容應寫在上述 root documents、研究文件或交付成果中。
`yc-ai-assistant/TASKS.md` 只記錄共用 AI template 本身的維護工作，也不是
專案或團隊的 task register。

### 3.3 啟用每週團隊流程

若專案採用固定週會，從英文模板建立第一份 internal report：

```bash
cp yc-ai-assistant/templates/weekly-meeting.md \
  report/YYYY-MM-DD-weekly-meeting.md
```

替換檔名、frontmatter 與標題中的日期，填入 attendees，並在會議前保持
`status: draft`。第一次使用 `$review-weekly-progress` 時，manager 必須明確
提供 review 的 base commit SHA（建議）或起始日期；沒有可辨識的 baseline，
AI 只能回報 evidence gap，不能把舊 commit 當成本週進度。

## 4. 日常工作、GitHub 與每週報告

### 4.1 工作期間

每位成員先完成自己的研究、分析或實作，將變更拆成可理解、可追溯的 commit，
並在填寫週報前 push 到 GitHub。依團隊既有的 branch 或 pull request 規則工作。

```bash
git status
git add -- path/to/file
git commit -m "Describe the completed work"
git push
```

不要 commit 密碼、token、私密資料或不應進入版本控制的大型暫存檔。若工作有
task ID，可將它放入 commit message 或週報，方便連結 assignment、commit 與
definition of done。

### 4.2 工作完成後，由成員自行寫週報

團隊成員應自行更新下一次會議的
`report/YYYY-MM-DD-weekly-meeting.md`，不要由 AI 代寫自己的進度。每位成員在
`Key Takeaways` 中至少說明：

- 被分配的 task；
- 已完成的工作；
- commit SHA、changed files 或其他 evidence；
- definition of done 的完成情況；
- blocker 或 dependency；
- 建議的 next step。

對專案管理紀錄而言，draft 週報是團隊成員唯一可以更新的位置。成員仍可正常
修改自己負責的程式碼、研究檔案與交付成果，但不直接修改 `BACKLOG.md`、
`DECISIONS.md`、`RISKS.md`、`PROJECT.md`、`TEAM.md` 或 `ROADMAP.md`。

填寫完成後，也要 commit 並 push 這份 draft report，確保 manager 與其他
成員在會議前看到同一版本。若多人同時更新同一份報告，應先整合並處理衝突，
再進行會前 review。

### 4.3 會議前與會議中

AI review 讀取的是 manager 當前 checkout 中可見的本機 Git history，而不是
直接把 GitHub 上所有 branches 或 pull requests 都視為已載入。會議前，manager
應先 fetch 遠端更新，並確認要評估的 commits 已存在於本機且位於正確的
review 範圍：

```bash
git fetch --all --prune
```

manager 可呼叫 `$review-weekly-progress`。AI 只會讀取成員自填的週報、前次
定稿週報、新 commits、diffs 與連結的 evidence，並在 chat 中整理：

- 每位成員聲明完成了什麼，以及有哪些 repo evidence；
- 尚未完成、無法驗證或缺乏證據的部分；
- blockers、dependencies 與沒有寫入週報的新 committed work；
- 最重要的下一步；
- 供會議討論的工作拆解與可能 owner。

此 review 是唯讀的。AI 不會修改任何檔案，也不會執行 build、test、notebook、
simulation、server 或 application code。Git 證據與 AI 建議都要由 manager
和團隊在會議中討論，不能自動視為驗收結果或正式分工。

### 4.4 會議結束後

manager 先依實際討論結果修改週報，確認共識、決策、下一步、分工、backlog、
風險與未解問題都已正確記錄，再明確呼叫 `$finalize-weekly-meeting`。

finalizer 只有在 manager 確認會議結束、指定目標週報，並同時要求 finalize
與 synchronize 時才能寫入。它會：

1. 將指定週報整理成英文定稿；
2. 保留六個固定 sections；
3. 確保 `Next Actions` 是下一週任務與分工的完整快照；
4. 只根據定稿週報同步 `BACKLOG.md`、`DECISIONS.md` 與 `RISKS.md`。

任務歷史留在每週 internal reports 中，不另外維護 root `TASKS.md`。
`PROJECT.md`、`TEAM.md` 與 `ROADMAP.md` 仍由 manager 另行維護，不會被
finalizer 自動修改。

finalizer 完成後，manager 應先檢查 diff，確認週報與三份 current-state views
正確，再將會後紀錄 commit 並 push 到 GitHub：

```bash
git diff -- report/YYYY-MM-DD-weekly-meeting.md \
  BACKLOG.md DECISIONS.md RISKS.md
git add -- report/YYYY-MM-DD-weekly-meeting.md \
  BACKLOG.md DECISIONS.md RISKS.md
git commit -m "Finalize weekly report YYYY-MM-DD"
git push
```

## 5. 可使用的 AI skills

Skills 位於 `yc-ai-assistant/skills/`。它們只在任務符合時使用，不會在每個
專案或每次對話中自動全部執行。若要明確指定，可在 prompt 中使用
`$skill-name`。

### 文獻與研究記憶

| Skill | 用途 |
| --- | --- |
| `$paper-note` | 將論文、PDF 或閱讀內容整理成 `references/` 下的結構化 Markdown 筆記，並在需要時處理論文圖片。 |
| `$paper-search` | 依本地研究脈絡搜尋、分組及比較文獻，說明 relevance 並安排閱讀順序，而不是只列出搜尋結果。 |

### 理論、模擬、論文與簡報

| Skill | 用途 |
| --- | --- |
| `$theory-workbench` | 梳理命題、假設、直覺、proof sketch、反例與論證缺口，並清楚區分猜想與已證明結果。 |
| `$simulation-runner` | 設計、實作、檢視與摘要 simulation 或 numerical experiment；除非專案已有其他語言，預設使用 R。 |
| `$chat-to-latex` | 在使用者明確要求時，把目前討論整合進 `deliverable/paper/`；寫入前先核對符號並在 chat 提出 LaTeX 草稿。 |
| `$beamer-slides` | 從論文、研究筆記或 outline 初始化新的 Beamer deck 或第一版 frames。 |
| `$revise-beamer-slides` | 依現有 Beamer deck 的 inline comments 與 `GPT-*` tags 修改指定 frames，保留 deck 的既有結構、符號與風格。 |

### 學術審稿

| Skill | 用途 |
| --- | --- |
| `$chinese-referee-report` | 撰寫或修改繁體中文的作者導向 referee report。 |
| `$english-referee-report` | 撰寫或修改英文的作者導向 referee report。 |
| `$letter-to-editor` | 根據論文、referee report 與 manager 的額外判斷，撰寫給 editor 的 confidential letter 或 recommendation。 |

### 每週團隊管理

| Skill | 用途與限制 |
| --- | --- |
| `$review-weekly-progress` | 會前唯讀 review；比較成員聲明與新 Git evidence，分析每位成員的貢獻、blockers 與 next step。只在 chat 回報，不修改檔案或執行成果。 |
| `$finalize-weekly-meeting` | 會後定稿與同步；只有 manager 明確授權後，才能修改指定週報及 `BACKLOG.md`、`DECISIONS.md`、`RISKS.md`。 |

使用範例：

```text
使用 $paper-note 將這篇論文整理成 references/ 下的閱讀筆記。
```

```text
使用 $review-weekly-progress 檢查
report/YYYY-MM-DD-weekly-meeting.md 與本週的新 commits。
第一次 review 的 base commit 是 <commit-sha>。
```

```text
會議已結束。使用 $finalize-weekly-meeting 定稿
report/YYYY-MM-DD-weekly-meeting.md，並同步 BACKLOG.md、DECISIONS.md
與 RISKS.md。
```
