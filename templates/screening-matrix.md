# 广筛候选清单模板

> 用于第一层广筛的输出，记录 30–100 个候选靶点及其来源维度

---

## 项目信息

| 字段 | 内容 |
|------|------|
| 治疗领域 | |
| 具体疾病/病原体 | |
| 广筛日期 | |
| 候选总数 | |

---

## 筛选维度说明

| 代号 | 维度 | 说明 | 数据源示例 |
|------|------|------|-----------|
| **A** | Essentiality | 必需基因 | DEG, OGEE, TnCentral, CRISPRi |
| **B** | Infection/Disease Relevance | 疾病相关性 | GEO, BioProject, ArrayExpress |
| **C** | Virulence/Phenotype | 毒力/致病表型 | 文献综述, GO/KEGG |
| **D** | Pathway Importance | 通路关键性 | KEGG, BioCyc, Reactome |
| **E** | Structural Tractability | 结构可成药性 | PDB, AlphaFold, InterPro |
| **F** | Chemical Starting Point | 化学切入点 | ChEMBL, DrugBank, 天然产物库 |
| **G** | Resistance/Mutation | 耐药/突变相关性 | ClinVar, gnomAD, 耐药数据库 |
| **H** | Clinical Unmet Need | 未满足临床需求 | WHO, FDA, EMA 优先级清单 |

---

## 候选池整合规则

```
核心池 = A（必需）∩ (B 或 C)（疾病相关）
最终候选 = 核心池 + 至少一项加分（D 通路 / E 结构 / F 化学）
```

---

## 候选清单

### 按优先病原体/疾病分组

---

#### 病原体/疾病：___（例如：MDR-TB）

| # | 靶点名 | 基因 | UniProt | 功能/通路 | 命中维度 | 证据来源 | 文献支持 | 备注 |
|---|--------|------|---------|---------|---------|---------|---------|------|
| 1 | | | | | A,B,D | DEG + GEO | PMID: ___ | |
| 2 | | | | | A,C,E | Tn-seq + PDB | PMID: ___ | |
| 3 | | | | | A,B,F | CRISPRi + ChEMBL | PMID: ___ | |
| ... | | | | | | | | |

---

#### 病原体/疾病：___
...

---

## 命中维度统计

| 维度 | 命中次数 | 占比 | 说明 |
|------|---------|------|------|
| A 必需 | | | |
| B 疾病相关 | | | |
| C 毒力/表型 | | | |
| D 通路 | | | |
| E 结构 | | | |
| F 化学 | | | |
| G 耐药 | | | |
| H 临床 | | | |

---

## 来源数据库统计

| 数据库 | 引用次数 |
|--------|---------|
| DEG | |
| OGEE | |
| TnCentral | |
| GEO | |
| ... | |

---

## 优先级初步标记（进入第二层前）

每个候选标记进入第二层的初步优先级：
- ⭐⭐⭐ **High Priority**：同时命中 A + B/C + E/F
- ⭐⭐ **Medium Priority**：命中 A + B/C
- ⭐ **Low Priority**：仅命中核心池无加分

| 优先级 | 数量 | 进入第二层建议 |
|--------|------|---------------|
| ⭐⭐⭐ | | 全部进入 |
| ⭐⭐ | | 选 Top 50% 进入 |
| ⭐ | | 仅保留少数特殊情况 |
