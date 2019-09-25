# Decodable_Sample
Good Practices using Codable/Decodable

## Json Samples
* Admin List
```
[
    {
        "name": "Onur",
        "accessLevel": 11,
        "supervisor": "Rogier"
    },
    {
        "name": "Andrei",
        "accessLevel": 10
    }
]
```

* Message List

```
[
    {
        "type":"audio",
        "caption": "some audio data"
    },
    {
        "type":"video",
        "caption": "some video data"
    },
    {
        "type":"video"
    },
    {
        "type":"audio"
    },
    {
        "type":"text",
        "caption": "some text data"
    }
]
```

* Person List

```
[
    {
        "name": "Onur",
        "surname": "Cantay",
        "birthday": "2017-11-16T02:02:55.000-08:00"
    },
    {
        "name": "Onur",
        "accessLevel": 11,
        "supervisor": "Rogier"
    },
    {
        "name": "Andrei",
        "accessLevel": 10
    },
    {
        "name": "Ege",
        "surname": "Kuzubasioglu",
        "birthday": "2017-11-16T02:02:55.000-08:00"
    }
]
```
* Todo List
```
[
    {
        "id": 123123,
        "title": "Learn Coding",
        "description": "Start from Swift",
        "date": "2016-02-29 12:24:26"
    },
    {
        "id": 123123,
        "title": "Learn Swimming",
        "description": "Start from Swimming Pool",
        "date": "2016-02-29 12:24:26"
    },
    {
        "id": 1241,
        "title": "Learn Playing Guitar",
        "description": "Start from ACDC",
        "date": "2016-02-29 12:24:26"
    },
    {
        "id": 51251,
        "title": "Learn Coding",
        "description": "Start from Swift",
        "date": "2016-02-29 12:24:26"
    },
    {
        "id": 1231235,
        "title": "Learn Coding",
        "description": "Start from Swift",
        "date": "2016-02-29 12:24:26"
    },
    {
        "id": 12315123123,
        "title": "Learn Coding",
        "description": "Start from Swift",
        "date": "2016-02-29 12:24:26"
    }
]
```
* User List
```
{
    "roomName": "Tech Support",
    "users": [
        {
            "name": "Onur",
            "surname": "Cantay",
            "birthday": "2017-11-16T02:02:55.000-08:00"
        },{
            "name": "Beytullah",
            "surname": "Bovatekin",
            "birthday": "2017-11-16T02:02:55.000-08:00"
        },{
            "name": "Ege",
            "surname": "Kuzubasioglu",
            "birthday": "2017-11-16T02:02:55.000-08:00"
        },{
            "name": "Acelya",
            "surname": "Ozkan",
            "birthday": "2017-11-16T02:02:55.000-08:00"
        }
    ]

}
```
### Decodables
As Seen above we have different patterns that the json response follows so the question comnes up how do we do the best json decoding with less code and more efficient way.
before we continue we should know that `Codable` is a Typealias which is `Decodable & Encodable` so when we want to parse data from json to object and vice verse we need to implement `Codable` but if we know that the object it self will never parsed to json then Decodable Protocol would be enough.
Don't need to make the object havier then it is. if struct conforms more then 1 protocol it means that the struct itself is not anymore value type so it turns into a reference type.

# Good Things To Remember
1. Admin List
    1. Optional values means that the value can exist or not so if the object is not in the json response the decoder sets the value nil and doesn't throw a Decoding error.
    2. If the response is not Key value but an array rather than doing `[AdminModel].self` each time we create `typealias AdminList = [AdminModel].self` so we can use `AdminList.self` everywhere and it makes the code more readable.
2. Message List
    1. Decodable is a Protocol and as we know Swift is a powerfull language so we should be more open and think in a different way like conforming this protocol to an Enum and try to decode possible cases which is possible.
3. Person List
    1. Here is the same but the cases are dynamic type and its also Decodable
4. Todo List
    1. normally we dont need to provide the encoding initializers but this time we want to decode the time based on our implementation so its a custom decoding so we need to provide
    2. if the names are the same we dont provide CodingKeys but if the names are different we can provide the names as String so we can keep the code structured based on Swift Guide Lines
5. User List
    1. this example is for nested json responses so we can also provide nested type of structures do decode

# Contributers
[<kbd>
<img width="50" alt="onurhuseyincantay" src="https://avatars0.githubusercontent.com/u/24936965?s=460&v=4">
</kbd>](https://github.com/onurhuseyincantay)
