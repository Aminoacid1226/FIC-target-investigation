# 一键调用脚本（直接复制使用）

> 选择一个场景，复制下面的内容给 Agent 即可启动完整靶点调研。

---

## 场景 A：抗感染 - MDR-TB（演示最完整）

```markdown
# 靶点调研：MDR/XDR 结核

请使用靶点调研技能（skill.md），围绕 MDR/XDR Mycobacterium tuberculosis 筛选 1–5 个真正具备商业开发价值的小分子 FIC 靶点。

## 参数
- 治疗领域：抗感染 → 加载 domains/anti-infective.md
- 病原体：MDR-TB, XDR-TB, pre-XDR-TB, rifampicin-resistant TB
- 靶点类型：蛋白
- 药物形式：小分子
- 研发阶段：FIC（排除所有已上市产品）
- 输出目录：靶点调研/结核/

## 核心原则
- 优先级：商业可开发性 > 真正 FIC > 成药性 > 临床价值 > 学术新颖性
- 宁可少，不可滥
- 每一步淘汰必须记录原因，所有证据标注来源

## 执行流程
1. 第一层：8 维度交叉广筛（必需性 ∩ 疾病相关 ∪ 通路 ∪ 结构 ∪ 化学）→ 30–100 候选
2. 第二层：S1 FIC 真实性 → S2 临床试验 → S3 工业占位（硬淘汰）→ S4–S10 六维加权（100 分制）
3. 输出 6 个文件到 靶点调研/结核/

## 完成自查
- [ ] 推荐靶点是否通过 S1–S3？
- [ ] 淘汰是否有明确原因？
- [ ] 证据是否标注来源？
- [ ] 最终推荐 ≤ 5 个？
```

---

## 场景 B：抗感染 - 革兰阴性菌（鲍曼/铜绿/克雷伯）

```markdown
# 靶点调研：多重耐药革兰阴性菌

请使用靶点调研技能（skill.md），围绕 WHO 高优先级革兰阴性菌筛选 1–5 个真正具备商业开发价值的小分子 FIC 靶点。

## 参数
- 治疗领域：抗感染 → 加载 domains/anti-infective.md
- 优先病原体：Acinetobacter baumannii, Pseudomonas aeruginosa, Enterobacterales (CRE)
- 靶点类型：蛋白
- 药物形式：小分子（需考虑穿膜性和外排泵）
- 研发阶段：FIC
- 输出目录：靶点调研/革兰阴性菌/

## 特别关注
- 细胞壁合成（peptidoglycan, LPS）
- 脂质代谢
- DNA 复制修复
- 铁代谢
- 外排泵（efflux pumps）
- 穿膜化合物累积（compound accumulation）
```

---

## 场景 C：肿瘤 - 合成致死（KRAS 突变 NSCLC）

```markdown
# 靶点调研：KRAS 突变 NSCLC 合成致死靶点

请使用靶点调研技能（skill.md），围绕 KRAS G12D/G12V/G12R 突变的 NSCLC 筛选 1–5 个真正具备商业开发价值的小分子 FIC 靶点（合成致死方向）。

## 参数
- 治疗领域：肿瘤 → 加载 domains/oncology.md
- 适应症：NSCLC - KRAS 突变（G12D/G12V/G12R）
- 靶点类型：蛋白
- 药物形式：小分子
- 研发阶段：FIC（排除已上市的 KRAS 抑制剂和已知合成致死靶点如 SHP2/SOS1）
- 输出目录：靶点调研/KRAS合成致死/

## 特别关注
- 与 KRAS 突变合成致死的通路节点
- DEG/CERES 数据集中 KRAS 细胞系的必需基因
- 同家族但 KRAS 抑制剂未覆盖的亚型
```

---

## 场景 D：自免 - IBD 新机制靶点

```markdown
# 靶点调研：炎症性肠病新机制靶点

请使用靶点调研技能（skill.md），围绕 Crohn's disease 和 Ulcerative colitis 筛选 1–5 个真正具备商业开发价值的小分子 FIC 靶点。

## 参数
- 治疗领域：自身免疫与炎症 → 加载 domains/autoimmune.md
- 适应症：Crohn's disease + Ulcerative colitis
- 靶点类型：蛋白
- 药物形式：小分子（口服或肠道靶向）
- 研发阶段：FIC（排除已占领的 IL-6/IL-17/IL-23/JAK 靶点）
- 输出目录：靶点调研/IBD/

## 特别关注
- 肠道特异性靶点（低全身暴露）
- 补体系统（C3, Factor B, Factor D, MASP1/2）
- 黏膜屏障相关（claudins, tight junction）
- 先天免疫（TLR, NLRP3, RIG-I）
```

---

## 场景 E：代谢 - NASH

```markdown
# 靶点调研：NASH/NAFLD

请使用靶点调研技能（skill.md），围绕非酒精性脂肪性肝炎筛选 1–5 个真正具备商业开发价值的小分子 FIC 靶点。

## 参数
- 治疗领域：代谢疾病 → 加载 domains/metabolic.md
- 适应症：NASH (Non-alcoholic steatohepatitis)
- 靶点类型：蛋白（肝脏富集）
- 药物形式：小分子（口服，肝脏靶向优先）
- 研发阶段：FIC（排除已进入 III 期的靶点如 FXR/PPARβδ/ACC1/2/SCD1）
- 输出目录：靶点调研/NASH/

## 特别关注
- 代谢：DGAT1/2, APOB, PCSK9 之外的脂代谢靶点
- 炎症：NF-κB 调节因子、JNK/ASK1
- 纤维化：TGFβ 激活、LOXL2、FAK
- 氧化应激/线粒体功能
```

---

## 场景 F：神经 - PD 新靶点（含 BBB 穿透评估）

```markdown
# 靶点调研：帕金森病新靶点

请使用靶点调研技能（skill.md），围绕家族性和散发性帕金森病筛选 1–5 个真正具备商业开发价值的小分子 FIC 靶点。

## 参数
- 治疗领域：神经系统疾病 → 加载 domains/neurology.md
- 适应症：家族性 PD (LRRK2-G2019S, GBA-N370S) + 散发性 PD
- 靶点类型：蛋白
- 药物形式：小分子（必须评估血脑屏障穿透）
- 研发阶段：FIC（排除 LRRK2 抑制剂等已进入 III 期的靶点）
- 输出目录：靶点调研/帕金森/

## BBB 穿透标准（必须满足）
- LogD 2.0–3.0（中枢最优化范围）
- MW < 450
- PSA < 90 Å²
- 非 P-gp 底物
- fU > 5%（低蛋白结合）

## 特别关注
- 线粒体功能（PINK1/Parkin 通路）
- 蛋白稳态（α-synuclein 聚集）
- 先天免疫（TREM2, CSF1R）
- 氧化应激
```

---

## 🧩 自定义模板（填括号即可）

```markdown
# 靶点调研请求

请使用靶点调研技能（skill.md），围绕【{PATHOGEN_OR_INDICATION}】筛选 1–5 个真正具备商业开发价值的小分子 FIC 靶点。

## 参数
- 治疗领域：{THERAPEUTIC_AREA} → 加载 domains/{domain_file}.md
- 病原体/适应症：{PATHOGEN_OR_INDICATION}
- 靶点类型：{TARGET_TYPE}
- 药物形式：{MODALITY}
- 研发阶段：{FUNDING_STAGE}
- 输出目录：{OUTPUT_DIR}

## 核心原则
- 优先级：商业可开发性 > 真正 FIC > 成药性 > 临床价值 > 学术新颖性
- 宁可少，不可滥
- 每一步淘汰必须记录原因，所有证据标注来源

## 执行流程
1. 第一层：8 维度交叉广筛（必需性 ∩ 疾病相关 ∪ 通路 ∪ 结构 ∪ 化学）→ 30–100 候选
2. 第二层：S1 FIC → S2 临床 → S3 工业占位（硬淘汰）→ S4–S10 六维加权（100 分制）
3. 输出 6 个文件到 {OUTPUT_DIR}

## 特别关注（领域特有）
- {特殊关注点 1}
- {特殊关注点 2}
- {特殊关注点 3}

## 完成自查
- [ ] 推荐靶点是否通过 S1–S3？
- [ ] 淘汰是否有明确原因？
- [ ] 证据是否标注来源？
- [ ] 最终推荐 ≤ 5 个？
```

---

## ⏱️ Timeout 降级调用（时间紧时使用）

```markdown
# 靶点调研（精简模式）

请使用靶点调研技能（skill.md），但因时间紧张，请切换到 **timeout 降级模式**：

## 参数
- 治疗领域：抗感染 → 加载 domains/anti-infective.md
- 病原体：MDR-TB
- 输出目录：靶点调研/结核/精简版/

## 降级策略
- 第一层广筛：取前 20 个候选进入第二层（不完整广筛）
- S1–S3 硬淘汰：完整执行（不降级，因为这是核心）
- S4–S6：简化为 checklist（Yes/No），不做深度分析
- S7–S10：仅定性评估，不做定量评分
- 最终输出：Top 2–3 个推荐 + 明确的证据缺口列表

## 交付物
- 精简版报告（1–2 页）
- 关键证据缺口清单（明确后续补什么）
- 推荐靶点 + 立项优先级排序
```
