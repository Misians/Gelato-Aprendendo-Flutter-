# Gelato on Ice 🍦

Bem-vindo ao projeto Gelato on Ice!

A API tem apenas uma endpoint no momento:

## API Endpoints:

`https://www.serverurl.com/api/`


|Method|Endpoint|Description|
|-|-|-|
|`POST`|`/icecream`| Creates a new Record  the parameters are: (image, name, price, quantity, is_vegan, no_sugar, likes)|
|`GET`|`/icecream`| Returns all recodors from this endpoint (icecreams)|
|`GET`|`/icecream/{id}`| Returns The record with {id} id OBS: {id} must be a number|
|`Patch`|`/icecream/{id}`| Updates the recordo with the specified id, the parameters can be ( name, price, quantity, is_vegan, no_sugar, likes) |
|`Delete`|`/icecream/{id}`| Deletes a recordo from the database |

Javascript Ex:

```js

const data = "image=&name=Gelato%20Acqua%20Specialit%C3%A1&price=50.00&quantity=20&is_vegan=no&no_sugar=no&likes=10";

const xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === this.DONE) {
    console.log(this.responseText);
  }
});

xhr.open("POST", ".../api/icecream/16");
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

xhr.send(data);

```

API Result

```js

{
    "current_page": 1, // The id of current page, you can use it to get the records from the first page
    "data": [
        {
            "id": 16, //Record ID
            "name": "Gelato Acqua Specialitá", 
            "price": "50.00", 
            "quantity": "20",
            "is_vegan": "no",
            "no_sugar": "no",
            "image": "images/1666124639.png",
            "likes": "10",
            "created_at": "2022-10-18T20:23:59.000000Z",
            "updated_at": "2022-10-18T20:23:59.000000Z"
        }
    ],
    "first_page_url": ".../api/icecream?page=1",
    "from": 1,
    "last_page": 1,
    "last_page_url": ".../api/icecream?page=1",
    "links": [
        {
            "url": null,
            "label": "&laquo; Previous",
            "active": false
        },
        {
            "url": ".../api/icecream?page=1",
            "label": "1",
            "active": true
        },
        {
            "url": null,
            "label": "Next &raquo;",
            "active": false
        }
    ],
    "next_page_url": null,
    "path": ".../api/icecream",
    "per_page": 15,
    "prev_page_url": null,
    "to": 1,
    "total": 1
}
```