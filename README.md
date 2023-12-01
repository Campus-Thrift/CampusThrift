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

### Create a new user
POST /api/users/

### Get user by id
GET /api/users/{user_id}/

### Update user by id
POST /api/users/{user_id}/

### Delete user by id
DEL /api/users/{user_id}

### Follow user
POST /api/users/{user_id}/follow/

### Unfollow user
POST /api/users/{user_id}/unfollow/

### Get all posts in cart
GET /api/users/{user_id}/cart/

### Remove post from cart
DEL /api/users/{user_id}/cart/{post_id}/

### Checkout cart
POST /api/users/{user_id}/cart/checkout/

### Get all posts
GET /api/posts/

### Create a post
POST /api/posts/{user_id}/create/

### Get post by id
GET /api/posts/{post_id}/

### Delete post by id
DEL /api/posts/{post_id}/{user_id}/

### Buy post
POST /api/posts/{post_id}/{buyer_id}/buy/

### Update post by id
POST /api/posts/{post_id}/{user_id}/update/

### Like post
POST /api/posts/{post_id}/{user_id}/like/

### Unlike post
POST /api/posts/{post_id}/{user_id}/removelike/

### Add post to cart
POST /api/posts/{post_id}/{user_id}/addtocart/

### Get post status
GET /api/posts/{post_id}/checkstatus/
