from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/productos")
def productos():
    return jsonify({
        "productos": [
            {"id": 1, "nombre": "Producto A"},
            {"id": 2, "nombre": "Producto B"}
        ]
    })

@app.route("/status")
def status():
    return jsonify({"status": "ok"})

if __name__ == "__main__":
    app.run(port=8080)
