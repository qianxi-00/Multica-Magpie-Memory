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
## 双语言脚手架（本分支）

本分支按 QXI-18 定案初始化两侧最小可运行环境，`main` 的文档说明是否同步更新待确认。

- Python 3.12+ / FastAPI / Pydantic v2 / uvicorn：见 `pyproject.toml`、`uv.lock`、`health.py`、`config.py`。
- JS/TS `.hooks.mjs` 适配层（Bun host）：见 `.hooks.mjs`、`package.json`、`package-lock.json`。
- 本机缓存/临时目录约束：`verify-scaffold.ps1` 将 `UV_CACHE_DIR` / `TEMP` / `TMP` / npm cache 指到仓库内 `.scaffold-runtime/`；该目录被 `.gitignore` 忽略。
- 环境变量示例见 `.env.example`；`.env` 不提交，密钥走 `.env` 或 GitHub Secrets。

验证入口：

```powershell
pwsh -NoProfile -File .\verify-scaffold.ps1
```