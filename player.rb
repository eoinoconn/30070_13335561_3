class Player

  attr_reader :proficiency, :min_desired_partner_proficiency, :name

  def initialize(name, proficiency, min_desired_partner_proficiency)
    @name, @proficiency, @min_desired_partner_proficiency = name, proficiency, min_desired_partner_proficiency
  end

end