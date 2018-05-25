#!/usr/bin/env ruby -w

Dir['./lib/**/*.rb'].each { |file| require file }

account = Account.new
account.deposit(1000)
account.deposit(2000)
account.withdraw(500)

statement = Statement.create_from(account.transactions)

display = Display.new
display.print(statement)
