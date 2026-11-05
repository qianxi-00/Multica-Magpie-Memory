import os
from pathlib import Path


def load_dotenv(path: Path | None = None) -> None:
    env_path = path or Path(__file__).with_name(".env")
    if not env_path.is_file():
        return
    for raw_line in env_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        key = key.strip()
        value = value.strip().strip("'\"")
        if key:
            os.environ.setdefault(key, value)


load_dotenv()


def env(name: str, default: str) -> str:
    return os.environ.get(name, default)


SERVICE_HOST = env("MMM_SERVICE_HOST", "127.0.0.1")
SERVICE_PORT = int(env("MMM_SERVICE_PORT", "8000"))
DATABASE_PATH = env("MMM_DATABASE_PATH", "mmm.sqlite3")