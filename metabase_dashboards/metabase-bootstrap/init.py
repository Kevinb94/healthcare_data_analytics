import requests
import time
import os

METABASE_HOST = os.getenv("METABASE_HOST", "http://localhost:3000")
USERNAME = os.getenv("MB_USER", "admin@yourcompany.com")
PASSWORD = os.getenv("MB_PASSWORD", "password")

def wait_for_metabase():
    print("⏳ Waiting for Metabase to be available...")
    while True:
        try:
            r = requests.get(f"{METABASE_HOST}/api/health")
            if r.status_code == 200:
                print("✅ Metabase is ready.")
                return
        except:
            pass
        time.sleep(2)

def login():
    r = requests.post(f"{METABASE_HOST}/api/session", json={
        "username": USERNAME,
        "password": PASSWORD
    })
    r.raise_for_status()
    return r.json()["id"]

def create_collection(token, name):
    r = requests.post(
        f"{METABASE_HOST}/api/collection",
        headers={"X-Metabase-Session": token},
        json={"name": name}
    )
    print(f"📁 Created collection: {name}")
    return r.json()["id"]

def main():
    wait_for_metabase()
    token = login()
    create_collection(token, "Auto Created Dashboards")

if __name__ == "__main__":
    main()
