class CalculatorController < ApplicationController
  
  def home
    render({ :template =>"calculator/home"})
  end

  def square
    render({ :template =>"calculator/home"})
  end

  def square_results
    @number = params.fetch("number", 0).to_f
    @result = @number * @number
    
    render({ :template =>"calculator/results"})
  end

  def square_root
    render({ :template =>"calculator/homeroot"})
  end

  def square_root_results
    @number = params.fetch("number", 0).to_f
    @resultsqrt = Math.sqrt(@number)

    render({ :template =>"calculator/resultssqrt"})
  end

  def payment
    render({ :template =>"calculator/homepay"})
  end

  def payment_results
    @apr = params.fetch("user_apr", 0).to_f
    @pv = params.fetch("user_pv", 0).to_f
    @years = params.fetch("user_years", 0).to_i
  
    ptop = (@apr/ 100.0 / 12) * @pv
    pbottom = (1 - ((1 + @apr / 100.0 / 12) ** (-@years * 12)))

    @payment = ptop / pbottom 
    @paymentr = @payment.round(4)
    @paymentc = @paymentr.to_fs(:currency)
    @aprp = "#{(@apr).round(4)}%"

    render({ :template =>"calculator/resultspay"})
  end

  def random
    render({ :template =>"calculator/homerand"})
  end

  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f

    @resultrand = rand(@min...@max)

    render({ :template =>"calculator/resultsrand"})
  end



end
