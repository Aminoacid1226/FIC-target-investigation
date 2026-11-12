---
name: target-investigation
description: 靶点发现与投资级验证工作流，输出 1-5 个可立项的 FIC 小分子靶点。Use when the user asks for 靶点调研、靶点发现、靶点筛选、FIC 靶点、target discovery. 支持所有治疗领域。
---

# Target Investigation（靶点调研）

## 做什么

针对指定治疗领域，筛选 1–5 个真正具备商业开发价值的 FIC（First-in-Class）小分子靶点。

## 核心流程

1. **第一层广筛**：8 维度交叉 → 30–100 候选
2. **第二层验证**：S1 FIC → S2 临床 → S3 工业占位（硬淘汰）→ S4–S10 六维加权（100 分）
3. **输出 6 个文件**到 `{OUTPUT_DIR}`

## 触发

用户说以下任一关键词时加载：
- 中文：靶点调研 / 靶点发现 / FIC 靶点 / 帮我筛选靶点
- 英文：target investigation / FIC target discovery / target screening

## 参数化

提取 THERAPEUTIC_AREA / PATHOGEN_OR_INDICATION / TARGET_TYPE / MODALITY / FUNDING_STAGE / OUTPUT_DIR

根据 THERAPEUTIC_AREA 加载本 skill 目录下的领域配置：
- 抗感染 → `domains/anti-infective.md`
- 肿瘤 → `domains/oncology.md`
- 自免 → `domains/autoimmune.md`
- 代谢 → `domains/metabolic.md`
- 神经 → `domains/neurology.md`

## 完整指令

读取仓库根目录的 `SKILL.md` 或访问 https://github.com/{owner}/target-investigation 获取完整指令。
