# 调用示例：MDR-TB 靶点调研

> 本示例展示如何用**一条结构化消息**调用靶点调研技能，以及调用后会生成什么。

---

## 📥 输入：调用消息（直接复制给 Agent）

```markdown
# 靶点调研请求

## 参数（必填 + 可选）

| 参数 | 值 | 说明 |
|------|---|------|
| THERAPEUTIC_AREA | 抗感染 | 决定加载哪个 domains/*.md |
| PATHOGEN_OR_INDICATION | 细菌 - MDR/XDR Mycobacterium tuberculosis | 聚焦具体病原体 |
| PRIORITY_PATHOGENS | MDR-TB, XDR-TB, pre-XDR-TB, rifampicin-resistant TB | 锁定耐药亚型 |
| TARGET_TYPE | 蛋白 | 小分子优先（默认） |
| MODALITY | 小分子 | 可改为 抗体/ADC/基因治疗 |
| FUNDING_STAGE | FIC | 真正 First-in-Class，排除所有已上市产品 |
| OUTPUT_DIR | 靶点调研/结核/ | 所有文件保存到此目录 |
| TIME_BUDGET | 充足 | 可选：充足 / 紧张（触发 timeout 降级） |

## 任务目标
筛选出 1–5 个真正具备商业开发价值的小分子 FIC 靶点，用于：
- 新药研发立项
- 创业孵化
- BD/License 授权

## 执行要求
- 严格遵循 skill.md 中定义的两层工作流
- 第一层广筛 30–100 候选（8维度交叉）
- 第二层投资级验证（S1 FIC → S2 临床 → S3 工业占位 硬淘汰）
- S4–S10 六维加权评分（100分制）
- 核心优先级：商业可开发性 > 真正 FIC > 成药性 > 临床价值 > 学术新颖性
- 每一步淘汰必须记录原因，所有证据必须标注来源

## 输出文件
保存到 {OUTPUT_DIR} 下，结构：
靶点调研/结核/
├── 00_项目配置.md
├── 01_广筛候选清单.md
├── 02_淘汰记录.md
├── 03_投资级验证报告.md
├── 04_靶点评分总表.md
└── 05_最终推荐报告.md
```

---

## 📊 输出：调用后生成的文件结构

```
靶点调研/
└── 结核/
    ├── 00_项目配置.md               # 参数快照 + 时间戳
    ├── 01_广筛候选清单.md           # 82 个初筛候选
    ├── 02_淘汰记录.md               # 67 个被淘汰 + 原因
    ├── 03_投资级验证报告.md         # 15 个通过 S1-S3
    ├── 04_靶点评分总表.md           # 15 个评分总表
    ├── 05_最终推荐报告.md           # Top 3 推荐靶点
    └── 附件/
        ├── 参考文献/
        └── 结构文件/
```

---

## 📄 输出示例：05_最终推荐报告.md（精选前 3 个靶点）

下面展示最终推荐报告的完整样子——这就是调用你会得到的**核心交付物**。

### 🦠 靶点 #1：DprE1（Decaprenylphosphoryl-β-D-ribose 2'-epimerase）

| 字段 | 内容 |
|------|------|
| **靶点快照** | 基因：Rv3790 / 蛋白：DprE1 / 物种：Mycobacterium tuberculosis / 功能：细胞壁合成（阿拉伯糖侧链前体 epimerization）/ 通路：脂质代谢 → 细胞壁生物发生 / PDB：4K14, 4F4Q, 4YJM |
| **评分** | **88/100** 🔴 |

#### 生物学证据链
- **必需性**（★★★★★）：CRISPRi 敲低后 MDR-TB 在 THP-1 巨噬细胞中完全无法存活（PMID: 31831678）；Tn-seq 在 6 种 Mtb 菌株中均显示 synthetic lethal with DprE2（PMID: 24097472）
- **感染相关性**：痰液中 MDR-TB 的 dprE1 mRNA 上调 3.2×（GEO GSE108654）
- **动物模型**：小鼠感染模型中，DprE1 抑制剂 PBTZ169 给药后肺部 CFU 下降 3–4 log，生存率从 0% → 80%（PMID: 27760735, 28832091）

#### FIC 验证
| 检查项 | 结果 | 来源 |
|--------|------|------|
| 临床试验 | ❌ 无同靶点任何适应症临床 | ClinicalTrials.gov, WHO ICTRP（2024年12月检索） |
| 上市状态 | ❌ 无已上市药物 | Drugs.com, FDA Orange Book |
| 工业管线 | ⚠️ 2 家公司有 preclinical（PBTZ169 衍生物、TMC207 analog） | Cortellis, Tb Alliance |
| 专利 | ⚠️ PBTZ169 已授权专利覆盖 Mtb 领域，但保护范围较窄（仅 PBTZ 类结构） | WIPO WO2014029808, WO2018011069 |
| **是否 FIC** | ✅ **是** — 无上市、无临床、工业占位仍早期 | |

#### 成药性与化学可行性
- **Pocket**：活性位点口袋深度 ~12 Å，保守残基 Asp138/Tyr148/Phe149；ligandability 评分 0.82（alpha affinity）
- **已知配体**：PBTZ169（IC50 10 nM, 动物有效）、TMC207 衍生物、一系列 arylsulfonamides（IC50 100–500 nM）
- **化学切入点**：共晶结构 4YJM（PBTZ169 复合物）；SAR 已有约 50 个类似物可参考（ChEMBL 1234567）

#### 耐药/逃逸风险
- **单点突变**：DprE1 耐药突变（Asp138Glu, Tyr148Cys）在临床分离株中仅 0.3% 频率；但 PBTZ169 体外诱变可得耐药突变体
- **旁路代偿**：无旁路——DprE1 催化的反应在 Mtb 基因组中唯一，人类无同源蛋白
- **联合用药**：可与 INH、RIF 联用，体外已验证协同效应（PMID: 29712839）

#### 商业分析
- **未满足需求**：MDR/XDR-TB 患者需要口服用药；当前只有 bedaquiline（2012）、delamanid（2014）、pretomanid（2019）三个新药，均非 FIC（靶点已验证）
- **市场规模**：MDR-TB 全球患者 ~55 万/年，xDR-TB ~5 万；假设 30% 采用 FIC 新药，定价 $5000/疗程 → TAM ~$1B/年
- **差异化**：DprE1 是真正的 FIC 靶点（新通路、新口袋、全新 SAR），且口服生物利用度已在动物中验证
- **BD 潜力**：高——Big Pharma（GSK, Novartis, Merck）均在结核病领域有收购需求

#### TPP
| 项目 | 内容 |
|------|------|
| 适应症 | 成人 MDR-TB 肺部感染，对一线治疗耐药 |
| 治疗地位 | 二线联合用药（与 bedaquiline + linezolid 联用） |
| 给药途径 | 口服（PO，每日一次） |
| 感染类型 | 急性活动性 MDR-TB |
| 特殊人群 | 可考虑 HIV 合并感染（当前方案效果差） |

#### 评分表

| 维度 | 权重 | 得分 | 加权分 | 关键依据 |
|------|------|------|--------|---------|
| 真正 FIC | 25 | 23 | 23.0 | 无上市/临床/后期工业占位；仅 2 家 preclinical |
| 成药性 | 20 | 18 | 18.0 | 有共晶 + 明确 pocket + 多个已知配体 |
| 商业价值 | 20 | 17 | 17.0 | MDR-TB 明确未满足需求；TAM ~$1B；Big Pharma 有收购需求 |
| 耐药风险 | 15 | 13 | 13.0 | 单点突变风险中等；无旁路代偿；可联合延缓耐药 |
| 化学可进入性 | 10 | 9 | 9.0 | 共晶 + SAR + tool compound 全有 |
| 竞争格局 | 10 | 8 | 8.0 | 近 5 年论文 ~40 篇；竞争中等，PBTZ169 保护范围窄 |
| **总计** | **100** | | **88.0** | |

#### 结论
🔴 **强烈推荐立项**（88 分，第 1 名）

#### 下一步行动
1. 立即启动 DprE1 → 人类同源性分析，确认完全无交叉反应
2. 基于 PBTZ169 共晶结构，开展差异化 SAR 设计（避开现有专利保护范围）
3. 18 个月内完成 IND-enabling studies

---

### 🦠 靶点 #2：PKS15（Type I PKS module）

| 字段 | 内容 |
|------|------|
| **靶点快照** | 基因：Rv2949c / 蛋白：PKS15 / 物种：Mycobacterium tuberculosis / 功能：分枝菌酸合成（polyketide extender）/ 通路：脂质代谢 → 细胞壁 / PDB：无共晶 |
| **评分** | **76/100** 🟡 |

#### 生物学证据链（简要）
- 必需性：Tn-seq + CRISPRi 显示 MDR-TB 中 essential（PMID: 27354400）
- 动物模型：敲除后小鼠肺部 CFU 下降 2 log，但不致死（PMID: 30029176）

#### FIC 验证
- 临床试验：无 ✅
- 工业管线：无明确布局 ✅
- 专利：仅 academic patents ✅
- **是否 FIC**：✅ 是

#### 主要缺陷
- **无共晶结构**：AlphaFold 置信度中等（pLDDT 72），pocket 预测不确定
- **化学切入点弱**：仅 1 个天然产物有弱抑制（IC50 20 μM），无 tool compound
- **人类同源性**：FASN（人脂肪酸合酶）有 32% 同源性，选择性困难

#### 结论
🟡 **建议进一步验证**（76 分，第 2 名）
→ 需要补充：PKS15 人类选择性验证 + AlphaFold pocket 确认

---

### 🦠 靶点 #3：NrvA（ATP-Binding Cassette Transporter）

| 字段 | 内容 |
|------|------|
| **靶点快照** | 基因：Rv1473 / 蛋白：NrvA（也叫 MdrA, EfA）/ 物种：Mycobacterium tuberculosis / 功能：铁摄取相关转运（ferrisiderophore）/ 通路：铁代谢 / PDB：无共晶 |
| **评分** | **69/100** 🟡 |

#### 生物学证据链（简要）
- 必需性：MDR-TB 中 essential（PMID: 25134021），但 H37Rv 中可敲除（conditional）
- 动物模型：敲除后毒力下降但感染仍可建立（PMID: 26981899）

#### FIC 验证
- 临床试验：无 ✅
- 工业管线：无明确布局 ✅
- **是否 FIC**：✅ 是

#### 主要缺陷
- **结构信息差**：AlphaFold 置信度低（pLDDT 58），预测 pocket 不稳定
- **转运蛋白选择性**：ABC 转运蛋白与人类有 40%+ 同源性
- **生物证据不完全一致**：不同菌株必需性不同

#### 结论
🟡 **建议进一步验证**（69 分，第 3 名）
→ 需要补充：结构生物学研究（Cryo-EM 合适，因为膜蛋白）+ 人类同源物选择性筛选

---

## 📈 补充：漏斗转化图

```
第一层广筛                     第二层投资级验证
═══════════                    ═══════════════════
82 个候选 ←── 8 维度交叉       
    │                          ┌── 6 淘汰：有上市药物（INH/RIF target）
    │                          ├── 12 淘汰：已有临床（bedaquiline target QcrB）
    │                          ├── 18 淘汰：工业后期占位（PBTZ169 同靶点 DprE2）
    ▼                          └── 31 淘汰：无足够 FIC 证据 或 无明确 pocket
15 个通过 S1-S3 ────────────────────────────────────────────────
    │                          ┌── 2 淘汰：评分 < 50
    ▼                          ├── 4 进入 50–65（暂不推荐）
  9 个进入评分                 ├── 3 进入 65–80（建议进一步验证）
                               └── 1 进入 > 80（强烈推荐）
```

---

## 🎯 使用方式总结

```
┌─────────────────────────────────────────────────────┐
│                   调用流程                          │
├─────────────────────────────────────────────────────┤
│                                                     │
│  1. 选择治疗领域                                      │
│     → 加载 domains/anti-infective.md                │
│                                                     │
│  2. 提供具体参数                                      │
│     → 病原体 / 适应症 / 靶点类型 / 药物形式            │
│                                                     │
│  3. 执行两层工作流                                    │
│     → 第一层：82 个候选                              │
│     → 第二层：S1-S3 硬淘汰 + S4-S10 评分              │
│                                                     │
│  4. 输出 6 个文件到 {OUTPUT_DIR}                     │
│     → 00 配置 / 01 候选 / 02 淘汰 / 03 验证 / 04 总表 / 05 推荐  │
│                                                     │
│  5. 最终得到 1–5 个可立项靶点                         │
│     → 每个靶点有完整的 9 项报告 + 100 分评分          │
│                                                     │
└─────────────────────────────────────────────────────┘
```

---

## 🔁 其他领域调用示例（简化版）

### 肿瘤 - KRAS 突变靶点调研
```
# 参数
THERAPEUTIC_AREA: 肿瘤
PATHOGEN_OR_INDICATION: NSCLC - KRAS G12D/G12V
TARGET_TYPE: 蛋白
MODALITY: 小分子
PRIORITY_PATHOGENS: KRAS G12D, KRAS G12V, KRAS G12R
OUTPUT_DIR: 靶点调研/KRAS突变/
FUNDING_STAGE: FIC
# 目标：找 KRAS 抑制剂之外的合成致死靶点（如 SOS1/2, SHP2, MEK）
```

### 自免 - IBD 新靶点
```
# 参数
THERAPEUTIC_AREA: 自身免疫与炎症
PATHOGEN_OR_INDICATION: 炎症性肠病（IBD - Crohn's + UC）
PRIORITY_PATHOGENS: Crohn's disease, Ulcerative colitis
TARGET_TYPE: 蛋白
MODALITY: 小分子
OUTPUT_DIR: 靶点调研/IBD/
FUNDING_STAGE: FIC
# 目标：找 IL-23p19 之外的新机制靶点
```

### 神经 - PD 靶点调研
```
# 参数
THERAPEUTIC_AREA: 神经系统疾病
PATHOGEN_OR_INDICATION: 帕金森病（家族性 + 散发性）
PRIORITY_PATHOGENS: LRRK2-G2019S, GBA-N370S, sporadic PD
TARGET_TYPE: 蛋白
MODALITY: 小分子（需 BBB 穿透）
OUTPUT_DIR: 靶点调研/帕金森/
FUNDING_STAGE: FIC
# 目标：LRRK2 抑制剂之外的 FIC 靶点（如 VPS13C, TM237）
```

---

*本示例中所有生物学证据链、评分数据均为模拟演示，真实调用由 Agent 通过 WebSearch/WebFetch 获取实际文献和数据库内容。*
