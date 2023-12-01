# CampusThrift: A clothing resell app for Cornell students

## Description
CampusThrift is an iOS application designed for Cornell University students, providing a convenient platform to both buy and resell clothing items. Users can list their own clothing by inputting a title, description, price, and image. While the item has still not been sold, any of these fields can be edited.

<img src="https://github.com/daisychangm/CampusThrift/assets/146611553/6cfad367-65f1-4852-8308-894ead59c6b3" width="300">

Users can also view listings that other students have made and either buy the item directly or add it to their shopping cart. Additionally, they can also like posts, follow users, and view posts only from those they follow.

<img src="https://github.com/daisychangm/CampusThrift/assets/146611553/c104b87d-4aa4-43d1-bc30-8679dc9ed046" width="300">

Within the profile section of the app, users can view their like history, post history, and transaction history, and they can add funds to their balance.

<img src="https://github.com/daisychangm/CampusThrift/assets/146611553/3600011f-9c1d-44c0-ae63-fe74c49db2a1" width="300">


## Addressing Requirements
### IOS
- The bottom tab view has three clickable icons (home, add, and profile) that allow the user to  view each of the three main screens.
- The Home Screen, Profile, listing, and like screens each have a feature where users can scroll through the clothing items.
- Networking integration with a backend API: When users choose an image from their camera roll and fill out the required text they are able to post a clothing item which will show on the profile listing and other users home feed.
### Backend
- Designed an API to handle endpoints to manage and store data for users and posts using database modeling and implemented it using the Flase boilerplate code. (See API Specification below for more details)
- Deployed backend to Google Cloud.

## API Specification
### Get all users
GET /api/users/

Response:
```
{
    "users": [
        {
            "id": 1,
            "name": "Daisy Chang",
            "netid": "dmc387",
            "balance": 10.00,
            "followers": [ <SERIALIZED FOLLOWER WITH ONLY ID, NAME, NETID, AND BALANCE>, ... ],
            "followed": [ <SERIALIZED FOLLOWER WITH ONLY ID, NAME, NETID, AND BALANCE>, ... ],
            "posts": [ <SERIALIZED POST WITHOUT THE USER POST AND BUY ID>, ... ],
            "bought": [ <SERIALIZED POST WITHOUT THE USER POST AND BUY ID>, ... ],
            "cart": [ <SERIALIZED POST WITHOUT THE USER POST AND BUY ID>, ... ],
            "liked": [ <SERIALIZED POST WITHOUT THE USER POST AND BUY ID>, ... ]
        },
        ...
    ]
}
```

### Create a new user
POST /api/users/

Note: the balance field is optional

Request:
```
{
    "name": "Daisy Chang",
    "netid": "dmc387"
    "balance": 100.0
}
```
Response:
```
{
    "id": 1,
    "name": "Daisy Chang",
    "netid": "dmc387",
    "balance": 100.0,
    "followers": [],
    "followed": [],
    "posts": [],
    "bought": [],
    "cart": [],
    "liked": []
}
```

### Get user by id
GET /api/users/{user_id}/

Response:
```
{
    "id": 1,
    "name": "Daisy Chang",
    "netid": "dmc387",
    "balance": 100.0,
    "followers": [],
    "followed": [],
    "posts": [],
    "bought": [],
    "cart": [],
    "liked": []
}
```

### Update user by id
POST /api/users/{user_id}/

Note: all fields are optional

Request:
```
{
    "name": "John Smith",
    "balance": 200.0
}
```
Response:
```
{
    "id": 1,
    "name": "John Smith",
    "netid": "dmc387",
    "balance": 200.0,
    "followers": [],
    "followed": [],
    "posts": [],
    "bought": [],
    "cart": [],
    "liked": []
}
```

### Delete user by id
DEL /api/users/{user_id}

Response:
```
{
    "id": 1,
    "name": "Daisy Chang",
    "netid": "dmc387",
    "balance": 200.0,
    "followers": [],
    "followed": [],
    "posts": [],
    "bought": [],
    "cart": [],
    "liked": []
}
```

### Follow user
POST /api/users/{user_id}/follow/

Request:
```
{
    "user_id": 2
}
```
Response:
```
{
    "id": 1,
    "name": "Daisy Chang",
    "netid": "dmc387",
    "balance": 200.0,
    "followers": [],
    "followed": [
        {
            "id": 2,
            "name": "Naakai McDonald",
            "netid": "nm563",
            "balance": 30.0
        }
    ],
    "posts": [],
    "bought": [],
    "cart": [],
    "liked": []
}
```

### Unfollow user
POST /api/users/{user_id}/unfollow/

Request:
```
{
    "user_id": 2
}
```
Response:
```
{
    "id": 1,
    "name": "Daisy Chang",
    "netid": "dmc387",
    "balance": 200.0,
    "followers": [],
    "followed": [],
    "posts": [],
    "bought": [],
    "cart": [],
    "liked": []
}
```

### Get all posts in cart
GET /api/users/{user_id}/cart/

Response:
```
{
    "Cart": [
        {
            "id": 2,
            "username": "Naakai McDonald",
            "timestamp": "2023-12-01 05:10:13",
            "photo": "https://ik.imagekit.io/pi9lsweb7gk/tr:w-344,h-340/87257c8a92c00154694fef7c863cb0cf_thumb.jpeg",
            "title": "Plaid Pajama Sweatpants",
            "description": "Size L, lightly worn.",
            "price": 20.0,
            "user_id_post": 3,
            "user_id_buy": -1
        },
        {
            "id": 3,
            "username": "Naakai McDonald",
            "timestamp": "2023-12-01 21:15:24",
            "photo": "https://di2ponv0v5otw.cloudfront.net/posts/2023/02/19/63f2acada0e6c682324b05e2/s_63f2acbb8d7a3c1fec5f0393.jpg",
            "title": "Cornell Hockey Beanie",
            "description": "Moderately worn, some fraying on the ends.",
            "price": 15.0,
            "user_id_post": 3,
            "user_id_buy": -1
        },
        ...
    ]
}
```

### Remove post from cart
DEL /api/users/{user_id}/cart/{post_id}/

Response:
```
{
    "Cart": [
        {
            "id": 2,
            "username": "Naakai McDonald",
            "timestamp": "2023-12-01 05:10:13",
            "photo": "https://ik.imagekit.io/pi9lsweb7gk/tr:w-344,h-340/87257c8a92c00154694fef7c863cb0cf_thumb.jpeg",
            "title": "Plaid Pajama Sweatpants",
            "description": "Size L, lightly worn.",
            "price": 20.0,
            "user_id_post": 3,
            "user_id_buy": -1
        },
        ...
    ]
}
```

### Checkout cart
POST /api/users/{user_id}/cart/checkout/

Response:
```
{
    "Cart": []
}
```

### Get all posts
GET /api/posts/

Response:
```
{
    "Posts": [
        {
            "id": 2,
            "username": "Naakai McDonald",
            "timestamp": "2023-12-01 05:10:13",
            "photo": "https://ik.imagekit.io/pi9lsweb7gk/tr:w-344,h-340/87257c8a92c00154694fef7c863cb0cf_thumb.jpeg",
            "title": "Plaid Pajama Sweatpants",
            "description": "Size L, lightly worn.",
            "price": 20.0,
            "user_id_post": 3,
            "user_id_buy": -1
        },
        {
            "id": 3,
            "username": "Naakai McDonald",
            "timestamp": "2023-12-01 21:15:24",
            "photo": "https://di2ponv0v5otw.cloudfront.net/posts/2023/02/19/63f2acada0e6c682324b05e2/s_63f2acbb8d7a3c1fec5f0393.jpg",
            "title": "Cornell Hockey Beanie",
            "description": "Moderately worn, some fraying on the ends.",
            "price": 15.0,
            "user_id_post": 3,
            "user_id_buy": -1
        },
        ...
    ]
}
```

### Create a post
POST /api/posts/{user_id}/create/

Request:
```
{
    "photo": "https://web.com/myimage.jpg",
    "title": "Red Shirt",
    "descripttion": "Size medium",
    "price": 20.00
}
```
Response:
```
{
    "id": 1,
    "username": "Daisy Chang",
    "timestamp": "2023-12-01 05:10:13",
    "photo": "https://web.com/myimage.jpg",
    "title": "Red Shirt",
    "description": "Size medium",
    "price": 20.0,
    "user_id_post": 1,
    "user_id_buy": -1
}
```

### Get post by id
GET /api/posts/{post_id}/

Response:
```
{
    "id": 1,
    "username": "Daisy Chang",
    "timestamp": "2023-12-01 05:10:13",
    "photo": "https://web.com/myimage.jpg",
    "title": "Red Shirt",
    "description": "Size medium",
    "price": 20.0,
    "user_id_post": 1,
    "user_id_buy": -1
}
```

### Delete post by id
DEL /api/posts/{post_id}/{user_id}/

Response:
```
{
    "id": 1,
    "username": "Daisy Chang",
    "timestamp": "2023-12-01 05:10:13",
    "photo": "https://web.com/myimage.jpg",
    "title": "Red Shirt",
    "description": "Size medium",
    "price": 20.0,
    "user_id_post": 1,
    "user_id_buy": -1
}
```

### Buy post
POST /api/posts/{post_id}/{buyer_id}/buy/

Response:
```
{
    "id": 1,
    "username": "Daisy Chang",
    "timestamp": "2023-12-01 05:10:13",
    "photo": "https://web.com/myimage.jpg",
    "title": "Red Shirt",
    "description": "Size medium",
    "price": 20.0,
    "user_id_post": 1,
    "user_id_buy": 2
}
```

### Update post by id
POST /api/posts/{post_id}/{user_id}/update/

Note: all fields are optional

Request:
```
{
    "photo": "https://web.com/newimage.jpg",
    "title": "Blue Shirt",
    "description": "Size large",
    "price": "15.0"
}
```
Response:
```
{
    "id": 1,
    "username": "Daisy Chang",
    "timestamp": "2023-12-01 05:10:13",
    "photo": "https://web.com/newimage.jpg",
    "title": "Blue Shirt",
    "description": "Size large",
    "price": 15.0,
    "user_id_post": 1,
    "user_id_buy": -1
}
```

### Like post
POST /api/posts/{post_id}/{user_id}/like/

Response:
```
{
    "id": 1,
    "name": "Daisy Chang",
    "netid": "dmc387",
    "balance": 200.0,
    "followers": [],
    "followed": [],
    "posts": [],
    "bought": [],
    "cart": [],
    "liked": [
        {
            "id": 2,
            "username": "Naakai McDonald",
            "timestamp": "2023-12-01 05:10:13",
            "photo": "https://web.com/pants.jpg",
            "title": "Pants",
            "description": "Size 2 women's",
            "price": 25.0,
            "user_id_post": 1,
            "user_id_buy": -1
        }
    ]
}
```

### Unlike post
POST /api/posts/{post_id}/{user_id}/removelike/

Response:
```
{
    "id": 1,
    "name": "Daisy Chang",
    "netid": "dmc387",
    "balance": 200.0,
    "followers": [],
    "followed": [],
    "posts": [],
    "bought": [],
    "cart": [],
    "liked": []
}
```

### Add post to cart
POST /api/posts/{post_id}/{user_id}/addtocart/

Response:
```
{
    "id": 1,
    "name": "Daisy Chang",
    "netid": "dmc387",
    "balance": 200.0,
    "followers": [],
    "followed": [],
    "posts": [],
    "bought": [],
    "cart": [
        {
            "id": 2,
            "username": "Naakai McDonald",
            "timestamp": "2023-12-01 05:10:13",
            "photo": "https://web.com/pants.jpg",
            "title": "Pants",
            "description": "Size 2 women's",
            "price": 25.0,
            "user_id_post": 1,
            "user_id_buy": -1
        }
    ],
    "liked": []
}
```
