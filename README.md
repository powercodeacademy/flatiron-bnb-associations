# Bonus Lab: Flatiron-BnB Associations

We're going to build Airbnb. Really. We're going to take this in steps. First
let's work on our model associations and write migrations. This will be
challenging, but doable. Take it slow and work together. Follow the model specs.

## Where to Begin

First, you will have to set up your migration files in order for the tests to run. Take a look at the spec files for an idea of how to build each table.
Once you run your migrations, think about the relations between all of the objects. Let's work through
Users and Listings, and from there you should know some cool ActiveRecord tricks
to get started on the rest.

We have a `user` object but a listing belongs to a specific type of user: a
host. And the reservation (aka a trip) and a review both belong to a specific
type of user: a guest. But we don't want to make two tables for a host and a
guest. One way to do this is to create an association where, for example, a
listing belongs to a host:

```ruby
belongs_to :host
```

Active Record's `belongs_to` method is going to look for a table named "host",
but that doesn't exist. Instead, we need to tell ActiveRecord which table host
is referring to:

```ruby
belongs_to :host, :class_name => "User"
```

The listings table is instead going to have a column for the foreign key called
`host_id`.

Then on the User class, when we're creating a relationship with listings, where
a user `has_many` listings, we need to specify which foreign key to look for on
the listings table, otherwise, ActiveRecord is going to default to looking for a
`user_id` when we named it `host_id`:

```ruby
has_many :listings, :foreign_key => 'host_id'
```

If you're not sure how to use these options, make sure to check out the resource
links below.

## Resources

- [`belongs_to` class_name option](https://guides.rubyonrails.org/association_basics.html#options-for-belongs-to-class-name)
- [`has_many` foreign_key option](https://guides.rubyonrails.org/association_basics.html#options-for-has-many-foreign-key)
