Run java server

$ java -jar server.jar

Format

URL: http://localhost:8080/transactions (GET, POST)

Headers:
  -  Content-type  -  application/json
  -  password      -  1000

JSON:

{
    "value": 200.0,
    "contact": {
        "name": "gui",
        "accountNumber": 1000
    }
}