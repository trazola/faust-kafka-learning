from pydantic import BaseSettings


class KafkaSettings(BaseSettings):
    SERVER: str = "kafka://localhost:9093"  # localhost - workstation
    # SERVER: str = "kafka://kafka:9092"  # docker

    class Config:
        env_file = ".env"
        case_sensitive = True
        fields = {
            "SERVER": {"env": ["KAFKA_SERVER"]},
        }


class Settings(BaseSettings):
    kafka: KafkaSettings = KafkaSettings()
