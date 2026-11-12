---
name: target-investigation
description: 靶点发现与投资级验证工作流，输出 1-5 个可立项的 FIC 小分子靶点。Use when the user asks for 靶点调研、靶点发现、靶点筛选、FIC 靶点、target discovery. 支持所有治疗领域。
---

# Target Investigation（靶点调研）

从项目根目录加载 `SKILL.md` 作为完整指令。简要说明：

## 做什么

针对指定治疗领域，筛选 1–5 个真正具备商业开发价值的 FIC（First-in-Class）小分子靶点。

## 核心流程

1. **第一层广筛**：8 维度交叉 → 30–100 候选
2. **第二层验证**：S1 FIC → S2 临床 → S3 工业占位（硬淘汰）→ S4–S10 评分
3. **输出 6 个文件**：00 配置 / 01 候选 / 02 淘汰 / 03 验证 / 04 总表 / 05 推荐

## 怎么触发

用户说以下任一关键词时加载：
- 中文：靶点调研 / 靶点发现 / FIC 靶点 / 帮我筛选靶点
- 英文：target investigation / FIC target discovery / target screening

## 更多详情

读取本 skill 同级目录下的 `SKILL.md` 获取完整指令，或访问仓库根目录。
