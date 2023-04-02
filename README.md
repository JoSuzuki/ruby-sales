# ruby-sales

## How to run

To execute the program have ruby installed and run `ruby ./app/main.rb`

The available input file names are `input_01.txt`, `input_02.txt` and `input_03.txt`.

To execute the tests run `bundle install` then `bundle exec rspec`

## Overview of classes

### DataSource

Is a wrapper for where the data will come from. For simplicity sake this was implemented with .txt files and using ruby filesystem to read it. In it we prompt the user to pass the .txt filename. Calling `DataSource.get_products` will return the products in that file.

### Product

This is the core of the application. It holds the names of the products that don't have a basic tax applied to it. It also holds the values of each tax and is capable of calculating the tax itself.

### Receipt

This module is responsible for aggregating the products and printing a receipt.

### Main

This isn't a class per se, but just a runner to orchestrate the calls for the other services.