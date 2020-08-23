# Vending machine example

## Installing
I use `rbenv` to manage my Ruby versions and am using 2.7.1. 
Should work in other versions though.

Run `bundle install` to install the gems we're using (only needed for tests).

## Running
Run `ruby/main.rb`.

You can use the following commands to interact with the vending machine:
- `buy {product}`: buy a product in the machine
- `contents`: see the contents of the vending machine
- `help`: show all commands
- `insert {coin}`: add a coin
- `payment`: see how much money you have paid in
- `purchase {product}` alias for `buy`
- `restock`: reset coins and products

## Choices made
- Indexing the coins in the machine is a fairly arbritary choice - do we do it by coin  name or value?
I chose by name because the majority of coin operations are going to be insertions, where you want the name.
That said, I can see the case for indexing by value.
Obviously if we had a relational DB we could just define two indices
- I decided to make all coins copies of a "true" version of the coin.
This is almost like prototype inheritance.
Defining subclasses of `Coin` for each type seemed to be overkill to me.
In another language I'd just use an enum, but Ruby doesn't support them!
- I didn't go with "prototype" products because I couldn't be bothered implementing all that logic again...
Rather each product is unique unto itself - no multiples of each product.
It would be pretty simple to add the same style of logic as `Coin`, but that is left
as an exercise to the reader
- I could have used a gem like `currency`, but for this project that was overkill.
We don't need to convert currencies or format currencies for different locales.

## Improvements to be made
- The vending machine doesn't handle the case where there it can't dispense the correct change.
`CoinStore` supports this, the vending machine purchase logic is just done in a way that it's 
difficult to check if we can dispense the correct change _before_ we take your money.
As the vending machine bank is very big (100 coins) this is unlikely to happen in practice
but should still be handled.
- It would be nice to give formatting duties to the `Printer` object rather than `VendingMachine`
doing some too. Should  be a case of passing a string and a list of currency numbers to format,
and `Printer`  can then format them and then put them into the string using `sprintf`.

## Tests
Run `rake test` to run all tests/specs.

## Developing
Run `ruby ./bin/console.rb` to get an instance of `irb` running with all the classes loaded.

## Project time
I spent about 4.5h on this project, although almost an hour of that was spent wrangling with
project setup.
I rarely set up new projects and normally work in a Rails context so there was some
learning/re-learning to do there. In terms of actual dev time, it was about 3.5h