#!/usr/bin/env python3
from pymongo import MongoClient

def log_stats():
    client = MongoClient('localhost', 27017)
    db = client.logs
    collection = db.nginx

    # Number of logs
    total_logs = collection.count_documents({})
    print(f"{total_logs} logs")

    # Methods
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    method_counts = {method: collection.count_documents({"method": method}) for method in methods}
    
    print("Methods:")
    for method in methods:
        print(f"\tmethod {method}: {method_counts[method]}")

    # GET requests to /status
    status_check = collection.count_documents({"method": "GET", "path": "/status"})
    print(f"{status_check} status check")

if __name__ == "__main__":
    log_stats()
