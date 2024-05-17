#!/usr/bin/env python3
'''A module with tools for request caching and tracking.
'''
import redis
import requests
from functools import wraps
from typing import Callable

redis_store = redis.Redis()
'''The module-level Redis instance.
'''


def data_cacher(method: Callable) -> Callable:
    '''Caches the output of fetched data.
    '''
    @wraps(method)
    def invoker(url) -> str:
        '''The wrapper function for caching the output.
        '''
        redis_store.incr(f'count:{url}')
        result = redis_store.get(f'result:{url}')
        if result:
            return result.decode('utf-8')
        result = method(url)
        redis_store.set(f'count:{url}', 0)
        redis_store.setex(f'result:{url}', 10, result)
        return result
    return invoker


@data_cacher
def get_page(url: str) -> str:
    '''Returns the content of a URL after caching the request's response,
    and tracking the request.
    '''
    return requests.get(url).text


''' Initialize the Redis client '''
redis_client = redis.Redis(host='localhost', port=6379, db=0)


def test_redis():
    redis_client.set('test', 'value')
    value = redis_client.get('test')
    print(value.decode('utf-8'))

# Example usage
    test_url = ("http://slowwly.robertomurray.co.uk/delay/5000/"
                "url/http://www.example.com")
    print(get_page(test_url))
    print(get_page(test_url))  # This should be a cache hit
    # To see the count
    count = redis_client.get(f"count:{test_url}").decode('utf-8')
    print(f"Access count for {test_url}: {count}")
