from flask import Flask, request, jsonify
from transformers import pipeline

app = Flask(__name__)

# Placeholder for model loading, will be added in subsequent steps
# clf = pipeline("text-classification", model="./smartmed-triage-model", tokenizer="./smartmed-triage-model")

@app.route('/')
def home():
    return 'Flask app is running!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
