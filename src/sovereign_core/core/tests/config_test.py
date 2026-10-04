import pytest
from pydantic import ValidationError

from sovereign_core.core.config import EngineConfig, get_default_config


def test_default_config_instantiation() -> None:
    """Verify that default configuration initializes with expected localhost defaults."""
    config = get_default_config()

    assert config.host == "127.0.0.1"
    assert config.port == 8765
    assert config.max_vram_gb == 12.0


def test_custom_config_values() -> None:
    """Verify that custom fields override defaults correctly."""
    config = EngineConfig(host="0.0.0.0", port=9000, max_vram_gb=16.5)

    assert config.host == "0.0.0.0"
    assert config.port == 9000
    assert config.max_vram_gb == 16.5


def test_invalid_port_validation() -> None:
    """Verify that invalid types or values raise a Pydantic ValidationError."""
    with pytest.raises(ValidationError):
        # Passing an invalid type or invalid data structure
        EngineConfig(port="invalid_port_number")  # type: ignore[arg-type]
