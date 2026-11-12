# 治疗领域配置：抗感染（Anti-infective）

> 覆盖细菌、真菌、病毒、寄生虫、支原体、衣原体

---

## 1. 优先病原体

| 类别 | 优先清单 | 依据 |
|------|---------|------|
| **革兰阴性菌** | Acinetobacter baumannii, Pseudomonas aeruginosa, Enterobacterales (CRE) | WHO Critical |
| **革兰阳性菌** | Staphylococcus aureus (MRSA/VISA), Enterococcus (VRE) | WHO High |
| **结核** | MDR/XDR Mycobacterium tuberculosis | WHO High |
| **性传播** | Neisseria gonorrhoeae | WHO High |
| **艰难梭菌** | Clostridioides difficile | 美国 CDC Urgent |
| **真菌** | Candida auris, Aspergillus fumigatus, Cryptococcus neoformans | WHO Watchlist |
| **病毒** | 流感、RSV、诺如、新冠变异、登革热、HIV-1 耐药株 | 公共卫生优先级 |
| **寄生虫** | Plasmodium falciparum, Trypanosoma cruzi, Leishmania major | WHO Neglected |

---

## 2. 各亚类重点通路与方向

### 🦠 细菌

**重点通路：**
- 细胞壁合成（peptidoglycan, LPS, teichoic acid）
- 脂质代谢（脂肪酸合成, isoprenoid, 膜蛋白修饰）
- DNA 复制/修复/重组
- 铁代谢与铁摄取
- 应激应答（oxidative, heat, osmotic）
- 毒力系统（T3SS, T4SS, adhesion）
- 生物被膜形成
- 群体感应（quorum sensing）
- 持留与 Persister
- 外排泵（efflux pumps）
- 耐药机制（beta-lactamase, ribosome protection）

**优先数据源：**
- 必需基因：DEG (http://www.essentialgene.org/), OGEE (https://ogee.medgen.cn/)
- Tn-seq：TnCentral (https://tncentral.nccs.nus.edu.sg/)
- 转录组：GEO (https://www.ncbi.nlm.nih.gov/geo/), BioProject
- 通路：KEGG, BioCyc, Reactome
- 蛋白交互：IntAct, StringDB
- 耐药：ResFams, CARD (https://card.mcmaster.ca/)

### 🍄 真菌

**重点通路：**
- 细胞壁合成（β-glucan, chitin, mannan）
- Ergosterol 生物合成
- 蛋白稳态（chaperone, proteasome）
- 热激应答（HSP70/HSP90）
- 氧化应激（ROS 清除, GSH）
- 形态转换（酵母↔菌丝）
- 生物被膜
- 外排泵（ABC, MFS）
- 铁/锌代谢

**特别评估项：**
- 真菌特异性 vs 人类同源性
- 细胞壁穿透机制
- 宿主毒性窗口

### 🦠 病毒

**病毒靶点优先：**
- Polymerase（RNA-dependent DNA/RNA）
- Protease（3CLpro, NS3, HIV-1 protease）
- Integrase
- Helicase
- Methyltransferase / Cap 合成
- Endonuclease
- Glycoprotein（Entry 抑制剂）

**宿主靶点（仅保留）：**
- 毒性窗口明确
- 病毒强依赖（essential for replication）
- 广谱潜力明确（多病毒共用）

**重点方向：**
- 复制周期关键节点
- 宿主免疫逃逸机制
- 突变热点与耐药屏障

### 🐛 寄生虫（原虫/蠕虫/外寄生虫）

**重点通路：**
- 生命周期关键节点（invasion → replication → egress）
- 营养摄取与转运
- 运动/骨架（微管、肌动蛋白）
- 顶复体（Apicomplexa 特异）
- 线粒体（与人类高度不同）
- 解毒系统（GST, 细胞色素 P450）
- 特异代谢通路（如 heme、polyamine）

**优先数据库：**
- TDR Targets (https://www.tdrtargets.org/)
- PlasmoDB (https://plasmodb.org/)
- TriTrypDB (https://tritrypdb.org/)
- EuPathDB (https://eupathdb.org/)
- WormBase ParaSite (https://parasite.wormbase.org/)

### 支原体/衣原体（胞内菌）

**支原体重点：**
- 极简基因组必需基因
- 膜蛋白（黏附、免疫逃逸）
- 营养摄取转运蛋白
- DNA 复制修复
- 蛋白稳态系统

**衣原体重点：**
- Type III secretion system（注射效应因子）
- 细胞内复制（包涵体）
- 进入/脱出宿主细胞
- 持留状态转换（EB → RB）
- 宿主营养获取（氨基酸、ATP）

---

## 3. 抗感染特别评估维度

### 3.1 药物可及性

| 病原体类别 | 评估重点 |
|-----------|---------|
| 革兰阴性菌 | 外膜穿透（Porin 通路）、外排泵（AcrAB-TolC）、化合物累积 |
| 真菌 | 细胞壁穿透、膜流动性、主动外排 |
| 病毒 | 细胞内可达性、免疫细胞内浓度 |
| 胞内菌/寄生虫 | 宿主细胞穿透（感染器官/组织）、吞噬体逃逸、细胞内 pH 稳定 |

### 3.2 耐药屏障

**理想特征：**
- 必需基因高度保守（单点突变致死）
- 多蛋白复合物（突变成本高）
- 无旁路代偿通路
- 靶点不可通过低丰度表达逃逸
- 有协同药物（联合延缓耐药）

### 3.3 商业化考虑

**监管激励：**
- FDA QIDP（Qualified Infectious Disease Product）资格
- 快速通道（Fast Track）
- 孤儿药（Orphan Drug）
- 儿童罕见病（Paediatric Orphan）
- 推进新抗菌药物激励项目（PAMDA）

**市场差异：**
- 院内感染 vs 社区感染
- 急性重症（高 $/患者）vs 慢性维持
- 广谱 vs 窄谱（精准治疗优势）

---

## 4. 抗感染常见淘汰原因 Top 10

| 排名 | 淘汰原因 | 典型例子 |
|------|---------|---------|
| 1 | 靶点有已上市药物 | Beta-lactam binding proteins |
| 2 | 已有多家公司进入 preclinical | FabF（脂肪酸合成） |
| 3 | 无明确小分子结合口袋 | 纯 RNA 结合蛋白 |
| 4 | 化合物难以穿膜/累积 | 革兰阴性菌膜蛋白 |
| 5 | 靶点保守性差，容易突变耐药 | 病毒 RdRp 部分位点 |
| 6 | 生物学证据仅生信预测 | 无敲除/抑制验证 |
| 7 | 宿主毒性窗口太窄 | 与人类高度同源的代谢酶 |
| 8 | 竞争太拥挤 | 热休克蛋白、外排泵 |
| 9 | 市场规模太小 | 罕见热带病靶点 |
| 10 | 无化学切入点 | 完全无已知配体 |
