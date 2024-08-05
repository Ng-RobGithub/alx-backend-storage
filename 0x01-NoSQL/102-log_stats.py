#!/usr/bin/env python3
'''Script to analyze Nginx logs in MongoDB.
'''

from pymongo import MongoClient


def print_nginx_request_logs(nginx_collection):
    '''Prints statistics about Nginx request logs.
    '''
    total_logs = nginx_collection.count_documents({})
    print(f'{total_logs} logs')

    methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    print('Methods:')
    for method in methods:
        req_count = nginx_collection.count_documents({'method': method})
        print(f'\tmethod {method}: {req_count}')

    status_checks_count = nginx_collection.count_documents({
        'method': 'GET', 'path': '/status'})
    print(f'{status_checks_count} status check')


def print_top_ips(nginx_collection):
    '''Prints statistics about the top 10 IPs in the Nginx logs collection.
    '''
    print('Top IPs:')
    pipeline = [
        {'$group': {'_id': "$ip", 'totalRequests': {'$sum': 1}}},
        {'$sort': {'totalRequests': -1}},
        {'$limit': 10},
    ]

    top_ips = nginx_collection.aggregate(pipeline)
    for ip_record in top_ips:
        ip = ip_record['_id']
        request_count = ip_record['totalRequests']
        print(f'\t{ip}: {request_count}')


def run():
    '''Connects to MongoDB and provides statistics about Nginx logs.
    '''
    client = MongoClient('mongodb://127.0.0.1:27017')
    nginx_collection = client.logs.nginx

    print_nginx_request_logs(nginx_collection)
    print_top_ips(nginx_collection)


if __name__ == '__main__':
    run()
