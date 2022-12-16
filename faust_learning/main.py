import faust

app = faust.App(id="example_app_01", broker="kafka://kafka:9092")

if __name__ == "__main__":
    app.main()
