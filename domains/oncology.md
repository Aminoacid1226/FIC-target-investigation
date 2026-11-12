# 治疗领域配置：肿瘤（Oncology）

> 覆盖实体瘤、血液瘤、罕见肿瘤

---

## 1. 优先肿瘤类型

| 类别 | 优先清单 | 依据 |
|------|---------|------|
| 高频实体瘤 | NSCLC, 乳腺癌（三阴性/HR+/HER2+）, 胰腺癌, 前列腺癌 | 发病率 + 未满足需求 |
| 消化道 | 肝细胞癌, 结直肠癌, 胃癌, 食管癌 | 死亡率排名 |
| 妇科 | 卵巢癌, 宫颈癌, 子宫内膜癌 | 未满足需求 |
| 神经 | 胶质瘤/GBM, 神经母细胞瘤 | 预后差 |
| 血液瘤 | AML, ALL, MCL, CLL | 靶向空间大 |
| 罕见肿瘤 | 肉瘤, 甲状腺髓样癌, 小细胞肺癌 | 孤儿药激励 |

---

## 2. 肿瘤靶点分类体系

### 2.1 驱动因子靶点（Oncogene/tumor suppressor）

**明确致癌驱动：**
- RAS 家族（KRAS G12C/G12D/G12V, HRAS, NRAS）
- BRAF V600E/K
- HER2/EGFR（exon 20 ins, exon 19 del, L858R）
- FGFR1-4 融合/扩增
- MET exon 14 skipping / 扩增
- RET 融合（KIF5B-RET 等）
- ALK 融合（EML4-ALK 等）
- NTRK1-3 融合
- ROS1 融合
- IDH1/2 突变（R132 等）
- SDHx 缺失
- VHL 缺失

**重点通路：**
- RTK → RAS → RAF → MEK → ERK
- PI3K → AKT → mTOR
- CDK4/6 → RB
- TP53 → MDM2/MDMX
- Wnt/β-catenin
- Hedgehog（SMO）
- Notch

### 2.2 肿瘤代谢靶点

**Warburg 效应相关：**
- 糖酵解（HK2, PFKFB3, LDHA）
- 谷氨酰胺代谢（GLS, GDH）
- 脂肪酸合成（FASN, SCD1）
- 线粒体功能（VDAC1, DHODH）
- 一碳代谢（SHMT1/2, MTHFD1/2）

**合成致死策略：**
- 与 PARP 抑制剂联用：ATM/ATR/CHK1/CHK2/WEE1
- 与 KRAS 抑制剂联用：SHP2, SOS1/2, MEK
- 免疫代谢：CDK4/6 + 免疫检查点

### 2.3 表观遗传靶点

- Histone deacetylase（HDAC 1-11）
- Histone methyltransferase（EZH2, G9a, PRMT5）
- Histone demethylase（KDM5A/JARID1A, LSD1）
- Bromodomain（BRD4, BET）
- DNA methyltransferase（DNMT1/3A/3B）
- SWI/SNF 复合体（ARID1A, SMARCA4）

### 2.4 免疫微环境靶点

**肿瘤免疫（direct on tumor）：**
- PD-L1（肿瘤细胞上）
- LAG-3（肿瘤或 T 细胞）
- TIGIT（肿瘤或 T 细胞）

**肿瘤依赖型免疫：**
- 肿瘤特异性新抗原（Neoantigen）
- 肿瘤微环境代谢物（ADA, CD38）
- 免疫逃逸（HLA-G, B7-H3, B7-H4）

### 2.5 合成致死/合成增强靶点

| 主靶点已靶向 | 合成致死伙伴 |
|-------------|-------------|
| PARP（olaparib 等） | ATM, ATR, CHK1, WEE1, RAD51 |
| KRAS | SHP2, SOS1/2, MEK, RAF dimer |
| CDK4/6 | ROCK1/2, MCL1, BCL-2 |
| EGFR | MET, HER3, AXL |
| BRAF V600 | MEK |
| HER2 | HER3 |

---

## 3. 肿瘤特别评估维度

### 3.1 选择性与安全性

- 肿瘤依赖性等级（Oncogene Addiction Scale）
- 突变位点特异性（是否仅突变体有口袋）
- 野生型脱靶抑制（IC50 vs 突变体 IC50 比值）
- 组织分布（是否仅在肿瘤组织表达/激活）
- 胚系突变 vs 体细胞突变

### 3.2 耐药机制预判

**靶向治疗常见耐药：**
- 靶点二次突变（gatekeeper）
- 旁路激活（Bypass）
- 组织学转变（EMT、小细胞化）
- 拷贝数扩增
- 基因融合变体新增

### 3.3 临床可操作性

- 伴随诊断可用性（是否有 FDA 批准的 biomarker 伴随测试）
- 检测方法（NGS / qPCR / IHC / FISH）
- 患者筛选比例（目标突变占比 ≥ 5% 才有商业可行性）
- 联合用药空间（与哪些获批药联用）

### 3.4 商业化路径

| 阶段 | 策略 |
|------|------|
| FIC 新靶点 | 罕见癌种先切入（孤儿药 + 快速通道）→ 扩展至大癌种 |
| 快速跟进 | 比 FIC 更好的安全性/药代 → 一线联合 |
| 合成致死 | 与已有靶点抑制剂联用 → 快速进入市场 |
| 伴随 biomarker | 锁定精准人群 → 高定价策略 |

---

## 4. 肿瘤优先数据源

| 维度 | 数据源 |
|------|--------|
| 驱动基因 | TCGA, COMSIC, cBioPortal, OncoKB |
| 必需基因 | DepMap (CRISPR/Cas9), Achilles, CERES |
| 突变频率 | gnomAD, ClinVar, TCGA PanCan |
| 结构 | PDB, AlphaFold, InterPro |
| 已知配体 | ChEMBL, DrugBank, BindingDB |
| 专利 | Cortellis, PharmaProjects, PubChem Patents |
| 临床试验 | ClinicalTrials.gov, NMPA, EMA CTIS |
| 合成致死 | SynLethDB, SLHub |

---

## 5. 肿瘤常见淘汰原因 Top 10

| 排名 | 淘汰原因 |
|------|---------|
| 1 | 靶点已有同类产品获批或 III 期 |
| 2 | 无明确 pocket（无法做小分子） |
| 3 | 野生型抑制导致严重毒性 |
| 4 | 缺乏明确致癌驱动证据 |
| 5 | 候选人群比例 < 1% |
| 6 | 已有多家 Big Pharma 布局 |
| 7 | 合成致死验证不充分（仅细胞水平） |
| 8 | 靶点表达过于广泛 |
| 9 | 药代/膜通透性无法优化 |
| 10 | 伴随诊断开发难度过高 |
