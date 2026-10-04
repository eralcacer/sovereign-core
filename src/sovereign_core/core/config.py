from pydantic import BaseModel, Field


class EngineConfig(BaseModel):
    host: str = Field(default="127.0.0.1")
    port: int = Field(default=8765)
    max_vram_gb: float = Field(default=12.0)


def get_default_config() -> EngineConfig:
    return EngineConfig()
