
def calc(expr: str):
    return eval(expr)  # ❌ code injection


import subprocess

def ping(host):
    cmd = f"ping -c 1 {host}"
    return subprocess.check_output(cmd, shell=True)  # ❌


import subprocess

def ping(host):
    return subprocess.check_output(["ping", "-c", "1", host], shell=False)  # ✅


import pickle

def load_user(blob: bytes):
    return pickle.loads(blob)  # ❌ nunca en data no confiable


AWS_SECRET = "AKIA...SUPERSECRETO..."  # ❌
DB_PASSWORD = "password123"            # ❌


import requests
requests.get("https://example.com", verify=False)  # ❌ MITM risk


const { exec } = require("child_process");
const express = require("express");
const app = express();
app.use(express.json());

app.post("/calc", (req, res) => {
  const expr = req.body.expr;
  const result = eval(expr); // ❌ inseguro
  res.json({ result });
});

app.get("/ping", (req, res) => {
  const host = req.query.host;
  exec("ping -c 1 " + host, (err, out) => { // ❌ inseguro
    if (err) return res.status(500).send("error");
    res.type("text").send(out);
  });
});

app.listen(3000);
