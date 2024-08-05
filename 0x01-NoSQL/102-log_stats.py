#!/usr/bin/env python3
'''Task 12's module with enhanced functionality.
'''

from pymongo import MongoClient


def print_nginx_request_logs(nginx_collection):
    '''Prints stats about Nginx request logs.
    '''
    # Print total number of logs
    total_logs = nginx_collection.count_documents({})
    print('{} logs'.format(total_logs))

    # Print count of each HTTP method
    print('Methods:')
    methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    for method in methods:
        req_count = nginx_collection.count_documents({'method': method})
        print('\tmethod {}: {}'.format(method, req_count))

    # Print count of status checks
    status_checks_count = nginx_collection.count_documents({
        'method': 'GET', 'path': '/status'})
    print('{} status check'.format(status_checks_count))

    # Print top 10 IP addresses
    print('IPs:')
    top_ips = nginx_collection.aggregate([
        {'$group': {'_id': '$ip', 'totalRequests': {'$sum': 1}}},
        {'$sort': {'totalRequests': -1}},
        {'$limit': 10}
    ])
    for ip in top_ips:
        print('\t{}: {}'.format(ip['_id'], ip['totalRequests']))


def run():
    '''Provides some stats about Nginx logs stored in MongoDB.
    '''
    client = MongoClient('mongodb://127.0.0.1:27017')
    print_nginx_request_logs(client.logs.nginx)


if __name__ == '__main__':
    run()
