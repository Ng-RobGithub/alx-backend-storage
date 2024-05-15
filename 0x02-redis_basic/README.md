0x02-redis_basic

Redis is an open-source, in-memory data structure store that can be used as a database, cache, and message broker.

Task 0. Writing strings to Redis
Create a Cache class. In the __init__ method, store an instance of the Redis client as a private variable named _redis (using redis.Redis()) and flush the instance using flushdb.

Task 1. Reading from Redis and recovering original type
Redis only allows to store string, bytes and numbers (and lists thereof). Whatever you store as single elements, it will be returned as a byte string. Hence if you store "a" as a UTF-8 string, it will be returned as b"a" when retrieved from the server.

Task 2. Incrementing values
Familiarize yourself with the INCR command and its python equivalent.
In this task, we will implement a system to count how many times methods of the Cache class are called.

Task 3. Storing lists
Familiarize yourself with redis commands RPUSH, LPUSH, LRANGE, etc.
In this task, we will define a call_history decorator to store the history of inputs and outputs for a particular function.

Task 4. Retrieving lists
In this tasks, we will implement a replay function to display the history of calls of a particular function.

5. Implementing an expiring web cache and tracker
In this tasks, we will implement a get_page function (prototype: def get_page(url: str) -> str:). The core of the function is very simple. It uses the requests module to obtain the HTML content of a particular URL and returns it.
