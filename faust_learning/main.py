import faust

from .config import settings

app = faust.App(id="example_app_01", broker=settings.kafka.SERVER)


if __name__ == "__main__":
    app.main()
