class BodyMassService
 
  def initialize(mass, height)
    @mass = mass.to_f
    @height = height.to_f
    @bmi = @mass / (@height * @height)
    @category = category
  end

  def category
    case
    when @bmi < 15
      'Very severely underweight'
    when @bmi < 16
      'Severely underweight'
    when @bmi < 18.5
      'Underweight'
    when @bmi < 25
      'Normal (healthy weight)'
    when @bmi < 30
      'Overweight'
    when @bmi < 35
      'Obese Class I (Moderately obese)'
    when @bmi < 40
      'Obese Class II (Severely obese)'
    else
      'Obese Class III (Very severely obese)'
    end    
  end

  def report
    @report = "Your BMI is #{@bmi} and you belong to the #{@category} category"
  end
end
