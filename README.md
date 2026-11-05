# Multica-Magpie-Memory (MMM)

基于 Magpie 插件的 Multica 外置记忆模块；项目参考 TencentDB Agent Memory 的隔离与记忆架构。

## 分支约定

- `main`：仅 README 与项目文档。
- `dev`：日常集成分支，从 `dev` 开 `feat/<主题>` 功能分支，agent 临时分支用 `agent/<主题>`。
- `test` / `prod` 只接受合并，不直接提交。

## 状态

仓库已完成本地目录与 GitHub 远程连接、最小文档初始化。技术栈与实现目录尚未确定，待确认后再建立。

## 最小骨架建议（待确认，未创建）

```text
docs/                  # 设计文档、ADR、runbook
src/                   # 实现代码（技术栈确定后创建）
tests/                 # 对应测试
.env.example           # 非密钥配置示例
```

参考项目：
- [Magpie](https://github.com/yetone/magpie.git)
- [Multica](https://github.com/multica-ai/multica.git)
- [TencentDB Agent Memory](https://github.com/TencentCloud/TencentDB-Agent-Memory.git)
- [magpie-community plugins](https://github.com/magpie-community/plugins.git)