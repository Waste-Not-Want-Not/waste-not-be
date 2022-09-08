<div id="top"></div>


<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://waste-not-wn.herokuapp.com/" target="_blank" rel="noopener noreferrer"><img src="logo" alt="logo" width="30%"/></a>
</div>

  <p align="center">
    <a href="https://waste-not-wn.herokuapp.com/"><strong>Checkout Want Not Waste Not Here! »</strong></a>
  </p>
  <p align="center">
    <a href="https://github.com/Waste-Not-Want-Not/waste-not"><strong>Explore the Want Not Waste Not Frontend Application »</strong></a>
  </p>
</div>


[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Waste-Not-Want-Not/waste-not-be/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Waste-Not-Want-Not/waste-not-be/tree/main)

If this is green then the API is in good shape. 

## Built With
   ![RoR](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
   ![pgsql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
   ![heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
## Gems
   ![rspec](https://img.shields.io/gem/v/rspec-rails?label=rspec&style=flat-square)
   ![shoulda](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers&style=flat-square)
   ![simplecov](https://img.shields.io/gem/v/simplecov?label=simplecov&style=flat-square)
   ![VCR](https://img.shields.io/gem/v/vcr?label=VCR&style=flat-square)
   ![webmock](https://img.shields.io/gem/v/webmock?label=webmock&style=flat-square)
   ![figaro](https://img.shields.io/gem/v/figaro?color=blue&label=figaro)
   ![spring](https://img.shields.io/gem/v/spring?color=blue&label=spring)
   ![faker](https://img.shields.io/gem/v/faker?color=blue&label=faker)
   ![faraday](https://img.shields.io/gem/v/faraday?color=blue&label=faraday)
   ![graphql](https://img.shields.io/badge/GraphQL-GraphQL-blue)

---

### API's Consumed
- [Pexels](https://www.pexels.com/api/)
- [Yelp](https://www.yelp.com/developers/documentation/v3/get_started)
- [MapQuest](http://www.mapquestapi.com)

<p align="right">(<a href="#top">back to top</a>)</p>

---


# API Usage
- Base URL:     `https://waste-not-be.herokuapp.com/graphQL`


- Available Endpoints:
	- [User Endpoint](#USER)
	- [Item Endpoints](#ITEM)
	- [Foodbank Endpoint](#FOODBANK)
  - [Mutation Endpoints](#MUTATIONS)

---

# USER

**Get All Users With Items Query:**
```graphql
{
    getUsers {
        name
        email
        items {
            name
            expirationDate
            location
            forDonation
        }
    }
}
```

**Get User By ID With Items:**
```graphql
{
    getUserById(id: 11) {
        name
        email
        items {
            name
            expirationDate
            location
            forDonation
        }
    }
}
```

---

# ITEM

**Get User Freezer Items Query:**
```graphQL
{
    getUserById(id: 1) {
        id
        name
        email
        freezerItems {
            name
            expirationDate
            location
        }
    }
}
```

**Get User Fridge Items Query:**
```graphQL
{
    getUserById(id: 1) {
        id
        name
        email
        fridgeItems {
            name
            expirationDate
            location
        }
    }
}
```

**Get User Pantry Items Query:**
```graphQL
{
    getUserById(id: 1) {
        id
        name
        email
        pantryItems {
            name
            expirationDate
            location
        }
    }
}
```

**Get User Donation Items Query:**
```graphQL
{
    getUserById(id: 1) {
        id
        name
        email
        donationItems {
            name
            expirationDate
            location
        }
    }
}
```
---

# FOODBANK

**Get Nearest Foodbank Information**
```graphql
{
      getFoodBank(location: "denver,co") {
        name
        address
        phoneNumber
        directions
      }
    }
```
---

# MUTATIONS

**Create Item**
```graphQL
    mutation {
      createItem(input: {
        name:"Gnocchi",
        location: "fridge",
        expirationDate: "2023-02-03T04:05:06+00:00"
        userId: 2,
      }) {
        item {
          name,
          location
          expirationDate
          userId
          image
          forDonation
          id
        }
        errors
      }
    }
```

**Update Donation Status**
```graphQL
    mutation {
      updateForDonation(input: { id: 60 })
      {
        item{
            name
            expirationDate
            location
            forDonation
            userId
            image
        }
      }
    }
```

**Delete All Donation Items**
```graphQL
    mutation {
      deleteDonationItems(input: { id: 1 })
      {
        message
        errors
      }
    }
```


<!-- CONTACT -->
## Contributors


Thanks go to these wonderful people:

<table>

   <td align="center"><a href="https://github.com/jenniferhalloran"><img src="https://avatars.githubusercontent.com/u/48455658?v=4" width="100px;" alt=""/><br /><sub><b>Jenn H. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/jenniferlhalloran/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/NickJacobsss"><img src="https://avatars.githubusercontent.com/u/101067754?v=4" width="100px;" alt=""/><br /><sub><b>Nick J. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/nickjacobsatc/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/caden-jarrett"><img src="https://media-exp1.licdn.com/dms/image/D5635AQE1J4ZMO3iiXQ/profile-framedphoto-shrink_200_200/0/1661802246550?e=1663257600&v=beta&t=OoAwnCQ9Su2egELabtZFhMfZxpbRSdxHRwGzfh6BtWQ" width="100px;" alt=""/><br /><sub><b>Caden J. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/caden-jarrett-0655051b6/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>
  </tr>
</table>


