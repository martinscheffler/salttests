import pepper

client = pepper.Pepper('https://localhost:8000')
client.login('salt', 'mysecretpassword', 'sharedsecret')
ret = client.low([{'client': 'local', 'tgt': '*', 'fun': 'test.ping'}])
print(ret)