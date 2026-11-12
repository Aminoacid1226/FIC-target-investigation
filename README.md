# 🎯 Target Investigation · FIC 靶点调研技能

> 一套**可直接安装到任意 Agent** 的靶点发现与投资级验证工作流。
> 从候选广筛到立项推荐，完整覆盖商业判断、成药性评估、FIC 验证。

支持 **TRAE / Cursor / Claude Desktop / Cline** 等主流 Agent 产品，一键安装即用。

---

## ✨ 核心能力

| 功能 | 说明 |
|------|------|
| **两层工作流** | 第一层 8 维度广筛（30–100 候选）→ 第二层 S1–S10 十维度投资级验证 |
| **FIC 硬淘汰** | S1 真实性 / S2 临床状态 / S3 工业占位 — 任何一步失败直接淘汰 |
| **100 分评分** | 六维加权（FIC 25 + 成药性 20 + 商业价值 20 + 耐药风险 15 + 化学 10 + 竞争 10） |
| **5 大治疗领域** | 抗感染 / 肿瘤 / 自免 / 代谢 / 神经 — 各有领域配置文件 |
| **标准化输出** | 每个靶点 9 项报告 + 6 个归档文件 |
| **Timeout 降级** | 预设 2h/30min 上限，触发后自动精简 |

---

## 🚀 快速安装

选择你的 Agent，一条命令搞定。

### 📌 TRAE（官方支持 Skill）

```powershell
# Windows PowerShell
cd target-investigation
.\install.ps1 TRAE
```

安装后，在 TRAE 中说「帮我调研 MDR-TB 靶点」就会自动触发。

### 📌 Cursor（Rules）

```powershell
# Windows PowerShell
.\install.ps1 CURSOR

# 手动方式：将 platforms/cursor/target-investigation.mdc 放到
# %USERPROFILE%\.cursor\rules\ 或项目根 .cursor\rules\
```

### 📌 Claude Desktop（CLAUDE.md）

```powershell
# Windows PowerShell
.\install.ps1 CLAUDE

# 手动方式：将 platforms/claude-desktop/CLAUDE.md 内容放到 %USERPROFILE%\CLAUDE.md
```

### 📌 Cline（Custom Prompts）

```powershell
# Windows PowerShell
.\install.ps1 CLINE

# 手动方式：将 platforms/cline/target-investigation.md 放到
# %USERPROFILE%\.cline\custom-prompts\
```

### 🔧 安装全部

```powershell
# Windows PowerShell — 一个脚本装所有 Agent
.\install.ps1 ALL

# Mac/Linux — 同样
bash install.sh ALL
```

---

## 💡 使用示例（安装后）

```markdown
# 场景 A：抗感染 MDR-TB
帮我做一次靶点调研：
- 治疗领域：抗感染
- 病原体：MDR/XDR Mycobacterium tuberculosis
- 靶点类型：蛋白，小分子
- 目标：筛选 1-5 个真正可立项的 FIC 靶点
```

```markdown
# 场景 B：肿瘤合成致死
请使用 target investigation skill：
- 治疗领域：肿瘤 / NSCLC / KRAS G12D 突变
- 方向：合成致死靶点（排除已占领的 SHP2/SOS1）
- 输出目录：靶点调研/KRAS合成致死/
```

```markdown
# 场景 C：自免 IBD
帮我做靶点调研：
- 治疗领域：自免 / IBD（Crohn + UC）
- 方向：补体系统新靶点（排除已占领的 IL-6/JAK）
- 药物形式：小分子，口服或肠道靶向
```

### ⏱️ 时间紧？用精简模式

```markdown
请切换到 Timeout 降级模式执行靶点调研：
- 第一层取前 15 候选，第二层简化评估
- 只要 Top 2-3 推荐 + 明确证据缺口
```

---

## 📂 仓库结构

```
target-investigation/
├── SKILL.md                          ← 🧠 通用核心 Prompt（所有平台共享）
├── workflow.md                       ← 🔍 详细工作流参考（漏斗/证据等级/数据源）
├── install.ps1                       ← 🪟 Windows 一键安装脚本
├── install.sh                        ← 🍎 Mac/Linux 一键安装脚本
│
├── domains/                          ← 💊 治疗领域配置
│   ├── anti-infective.md             │   抗感染（6 类病原体 + 耐药屏障）
│   ├── oncology.md                   │   肿瘤（驱动基因 + 合成致死）
│   ├── autoimmune.md                 │   自免（细胞因子 + 补体系统）
│   ├── metabolic.md                  │   代谢（NASH + 糖尿病）
│   └── neurology.md                  │   神经（BBB 穿透 + PD/AD）
│
├── templates/                        ← 📝 可复用模板
│   ├── scoring-table.md              │   单靶点 10 维度检查清单
│   ├── target-report.md              │   多靶点总表 + Top 5 排序
│   ├── kill-criteria.md              │   淘汰记录 + 漏斗统计
│   └── screening-matrix.md           │   第一层广筛清单
│
├── examples/                         ← 🎬 调用示例
│   ├── MDR-TB-call-example.md        │   端到端完整走查（含真实输出样例）
│   └── quick-copy-scripts.md         │   6 个一键复制场景脚本
│
└── platforms/                        ← 🤖 各平台适配文件
    ├── trae/SKILL.md                 │   TRAE Skill 格式（带 frontmatter）
    ├── cursor/target-investigation.mdc│   Cursor Rules 格式
    ├── claude-desktop/CLAUDE.md      │   Claude Desktop 格式
    └── cline/target-investigation.md │   Cline Custom Prompt 格式
```

---

## 🎯 核心工作流

```
第一层 · 广筛 (30–100 候选)
══════════════════════════════════════════
  8 维度交叉
  ├─ A. Essentiality（必需基因）
  ├─ B. Disease Relevance（疾病相关）
  ├─ C. Virulence/Phenotype（毒力/表型）
  ├─ D. Pathway Importance（通路关键）
  ├─ E. Structural Tractability（结构可成药）
  ├─ F. Chemical Starting Point（化学切入）
  ├─ G. Resistance/Mutation（耐药/突变）
  └─ H. Clinical Unmet Need（临床需求）
  核心池 = A ∩ (B ∪ C) + D/E/F 加分
                  │
                  ▼
第二层 · 投资级验证（严格淘汰）
══════════════════════════════════════════
  S1 FIC 真实性（≥ ★★★ 证据？）  ── 硬淘汰 ──▶ ❌
  S2 临床试验（已上市？）          ── 硬淘汰 ──▶ ❌
  S3 工业占位（后期布局？）        ── 硬淘汰 ──▶ ❌
  S4–S10 六维加权评分（100 分制）
                  │
                  ▼
  >80  🔴 强烈推荐立项
  65–80 🟡 建议进一步验证
  <65   ❌ 淘汰
```

---

## 📊 评分体系（100 分）

| 维度 | 权重 | 核心考量 |
|------|------|---------|
| 真正 FIC | 25 | 无上市 + 无临床 + 无后期工业占位 |
| 成药性 | 20 | 明确 pocket + 适合小分子 |
| 商业价值 | 20 | TAM + unmet need + BD 潜力 |
| 耐药/逃逸风险 | 15 | 单点突变 + 旁路代偿 + 保守性 |
| 化学可进入性 | 10 | 共晶/SAR/tool compound |
| 竞争格局 | 10 | 论文数 + 专利趋势 + 是否拥挤 |

---

## 🧪 已验证的 Agent 兼容性

| Agent | 格式 | 安装方式 | 测试状态 |
|-------|------|---------|---------|
| **TRAE** | `.trae/skills/<name>/SKILL.md` | `install.ps1 TRAE` | ✅ 已测试 |
| **Cursor** | `.cursor/rules/*.mdc` | `install.ps1 CURSOR` | ✅ 已测试 |
| **Claude Desktop** | `~/CLAUDE.md` | `install.ps1 CLAUDE` | ✅ 已测试 |
| **Cline** | `.cline/custom-prompts/` | `install.ps1 CLINE` | ✅ 已测试 |
| **Any agent** | 直接读 `SKILL.md` | 手动复制 | ✅ 通用 |

---

## 📜 License

MIT License — 自由使用、修改、分享，署名即可。

---

## 🤝 贡献

欢迎 PR！如果你使用过其他 Agent 平台，欢迎添加适配文件到 `platforms/` 目录。

---

> 💡 **最初来源**：抗感染领域两个成熟提示词（抗菌 + 抗感染）→ 抽象通用工作流 → 扩展至 5 大治疗领域 → 包装为多平台 Skill 包
