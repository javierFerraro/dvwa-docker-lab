
import subprocess
import pickle
import requests

def calc(expr: str):
    return eval(expr)  # ❌ inseguro

def ping(host: str):
    return subprocess.check_output(f"ping -c 1 {host}", shell=True)  # ❌ inseguro

def load(blob: bytes):
    return pickle.loads(blob)  # ❌ inseguro si no confías en el origen

def fetch(url: str):
    return requests.get(url, verify=False).text  # ❌ inseguro
