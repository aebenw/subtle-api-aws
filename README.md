A Rails backend for _Subtle_ **URL**

Hosted on AWS
Uses AWS S3 to store files uses upload

Uses 'Shallow Serializers' to render nested data with more specific information
When requesting a channel the frontend needs to know about not only the authors of a channel, but the names of the authors. By default Rails Active Model Serializer just renders the user information as it appears in the database








For Models

Need to make comments one to many self-joining
Need to work on likes
  What's the relationship between like and object, not user
Add pending to relationship status


Relationships
  For now, just not worrying about pending, but need to do this

Set up Validations for user
  -New User
    Uniq email
    too short of password
  -Log in
    no match
    wrong pass

~AUTH
  Need to create a secret and store it somewhere hidden for JWT



*TO DO*
  Pending relationships
  Channel can have following



10/31
Forced SSL in config due to parsing error
