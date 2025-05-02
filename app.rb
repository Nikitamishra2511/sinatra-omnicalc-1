## app.rb

require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  erb :square
end

get("/square/new") do
  erb :square
end

get("/square/results") do
  number = params["number"].to_f
  result = number ** 2
  erb :square_results, locals: { number: number, result: result }
end

get("/square_root/new") do
  erb :square_root
end

get("/square_root/results") do
  number = params["number"].to_f
  result = Math.sqrt(number)
  erb :square_root_results, locals: { number: number, result: result }
end

get("/random/new") do
  erb :random
end

get("/random/results") do
  min = params["min"].to_i
  max = params["max"].to_i
  result = rand(min..max)
  erb :random_results, locals: { min: min, max: max, result: result }
end

get("/payment/new") do
  erb :payment
end

get("/payment/results") do
  apr = params["apr"].to_f / 100 / 12
  years = params["years"].to_i * 12
  principal = params["principal"].to_f

  numerator = apr * principal
  denominator = 1 - ((1 + apr) ** -years)
  payment = numerator / denominator

  erb :payment_results, locals: { apr: apr, years: years, principal: principal, payment: payment }
end
