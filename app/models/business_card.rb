class BusinessCard < ActiveRecord::Base
  # The associations were done backwards intentionally. Long story short, it has to do with the select tags in the main search form. Since the select tags rely on numeric option values in the HTML, as opposed to strings, this was an easier solution. It required less code. That alone wouldn't necessarily justify the decision to go against the Rails "Convention over Configuration" idiom. But there were other reasons that motivated this decision. For the record, I'm aware of the unusual nature of these associations.
  belongs_to :print_method
  belongs_to :ink_color
  belongs_to :bleed
  belongs_to :raised_ink
  belongs_to :dimension
  belongs_to :paper_type
  belongs_to :coating
  belongs_to :quantity
  belongs_to :box_count
  belongs_to :metal
  belongs_to :user

  validates :price, 
            :cost, 
            :print_method_id, 
            :ink_color_id, 
            :quantity_id, 
            :box_count_id, 
            :paper_type_id, 
            presence: true

  validates_numericality_of :price, 
                            :cost, 
                            :print_method_id, 
                            :ink_color_id, 
                            :quantity_id, 
                            :box_count_id, 
                            :paper_type_id, 
                            on: :create


  # Returns string of coatings for use in business_cards_controller.rb.
  def has_coating?
    if self.coating.id > 1
      front = self.coating.front.downcase
      back = self.coating.back.downcase
      coating = [front, back].reject { |c| c == "none" }

      if front == "none"
        front = "0"
      else
        front = "1"
      end

      if back == "none"
        back = "0"
      else
        back = "1"
      end

      "#{front}/#{back} #{multi_capitalize(coating[0])}"
    end
  end

  # Returns string of metals for use in business_cards_controller.rb.
  def has_metal?
    if self.metal.id > 1
      front = self.metal.front.downcase
      back = self.metal.back.downcase
      metal = [front, back].reject { |c| c == "none" }

      if front == "none"
        front = "0"
      else
        front = "1"
      end

      if back == "none"
        back = "0"
      else
        back = "1"
      end

      "#{front}/#{back} #{multi_capitalize(metal[0])}"
    end
  end

  # Returns string of raised inks for use in business_cards_controller.rb.
  def has_raised_ink?
    if self.raised_ink.id > 1
      "#{self.raised_ink.front}/#{self.raised_ink.back}"
    end
  end

  # Returns string of bleeds for use in business_cards_controller.rb.
  def has_bleed?
    if self.bleed.id > 1
      "#{self.bleed.front}/#{self.bleed.back}"
    end
  end


  # Class method that takes a query in the form of the params hash and searches the db for a business card that matches the specifications.
  def self.search(q)
    result = where("print_method_id = ? AND ink_color_id = ? AND bleed_id = ? AND raised_ink_id = ? AND dimension_id = ? AND paper_type_id = ? AND coating_id = ? AND quantity_id = ? AND box_count_id = ? AND metal_id = ?", q['print_method_id'], q['ink_color_id'], q['bleed_id'], q['raised_ink_id'], q['dimension_id'], q['paper_type_id'], q['coating_id'], q['quantity_id'], q['box_count_id'], q['metal_id'])
  end

  # Below is the single most complicated method in the entire app. As a beginner, I fully expect that there will be many amateur mistakes within this method. Bottom line is that it works as intended. Anyway, the purpose of this method is to return a nested array of business cards that are similar to the search query. It takes the params of the target business card, and returns a nested array of business card id's and a score assigned to each business card. This score is based on how similar the business card is to the target business card.

  def self.similar_products(target_params)
    same_print_method =  BusinessCard.where(print_method_id: target_params['print_method_id'])
    # The first step is to isolate only the results with the same print method. Although same_print_method suggests that the results actually have the same print method, this is not entirely true. The variable same_print_method can also be overridden to represent results that have metals or bleeds. Certain specifications take priority over the actual print method.

    target_ink_obj = InkColor.find(target_params['ink_color_id'])
    target_bleed_obj = Bleed.find(target_params['bleed_id'])
    target_raised_obj = RaisedInk.find(target_params['raised_ink_id'])
    target_dimension_obj = Dimension.find(target_params['dimension_id'])
    target_coating_obj = Coating.find(target_params['coating_id'])
    target_metal_obj = Metal.find(target_params['metal_id'])
    # Store a few of the important specifications to variables. Note, each of them is an object.

    # If there are metals involved, prioritize and query the db for business cards with metals.
    if target_metal_obj.front != "none" || target_metal_obj.back != "none"
      same_print_method =  BusinessCard.where(metal_id: target_params['metal_id'])
    end

    # Separate results based on bleeds or no-bleeds.
    if target_bleed_obj.front == false && target_bleed_obj.back == false
      same_print_method = same_print_method.map {|obj| obj if obj.bleed.front == false && obj.bleed.back == false}.compact
    elsif target_bleed_obj.front || target_bleed_obj.back
      same_print_method = same_print_method.map {|obj| obj if obj.bleed.front || obj.bleed.back}.compact
    end

    # Represent the target business card as a hash for easier querying.
    target_bc = {"ink_color" => {"front" => "#{target_ink_obj.front}",   "back" => "#{target_ink_obj.back}"},
                 "bleed"     => {"front" => "#{target_bleed_obj.front}", "back" => "#{target_bleed_obj.back}"},
                 "raised_ink"     => {"front" => "#{target_raised_obj.front}", "back" => "#{target_raised_obj.back}"},
                 "dimension"     => {"width" => "#{target_dimension_obj.width}", "height" => "#{target_dimension_obj.height}"},
                 "coating"     => {"front" => "#{target_coating_obj.front}", "back" => "#{target_coating_obj.back}"}
                  }

    business_card_scores = []

    # After the variable same_print_method has the appropriate contents, the app iterates through them and stores their id's and scores in a nested array.
    if same_print_method.count > 0
      same_print_method.each do |bc|
        business_card_scores << [bc.id, self.generate_score(bc, target_bc)]
      end
      results = business_card_scores.sort_by{ |bc| bc[1] }
      results.reverse
    end
  end


  private

    # Capitalizes strings that have multiple words. Also capitalizes certain abbreviations.
    def multi_capitalize(string)
      caps = string.split.map(&:capitalize).join(' ').sub("Cmyk", "CMYK").gsub("Uv", "UV")
    end

    # This class method was originally created to contain an additional method inside it. Undecided whether I will add that. For now, we will leave it, despite it being a pointless encapsulation of the generate_pantone_offset_score method below it.
    def self.generate_score(bc, target)
      generate_pantone_offset_score(bc, target)
    end

    # This method generates the score for any given business card. It utilizes various other method call for specific aspects of a business card to come up with a final score.
    def self.generate_pantone_offset_score(bc, target)
      score = []
      score << self.pantone_ink_color_score(bc, target)
      score << self.pantone_bleed_score(bc) if target["bleed"]["front"] == "true" || target["bleed"]["back"] == "true"
      score << self.pantone_raised_ink_score(bc, target) if target["raised_ink"]["front"].to_i > 0 || target["raised_ink"]["back"].to_i > 0
      score << self.pantone_dimension_score(bc, target)
      score << self.pantone_coating_score(bc, target) if target["coating"]["front"] != "none" || target["coating"]["back"] != "none"
      sum = score.inject(:+)
    end

    # Generates a score for the Pantone ink colors. This score is based on the difference between the target business card ink colors and the similar business card ink colors. The smaller the difference, the higher the score.
    def self.pantone_ink_color_score(b, t)
      b_colors = b.ink_color.front + b.ink_color.back
      t_colors = t["ink_color"]["front"].to_i + t["ink_color"]["back"].to_i
      diff = nil
      pic_score = nil

      if b_colors > t_colors
        diff = b_colors - t_colors
      else
        diff = t_colors - b_colors
      end

      case diff
      when 0
        pic_score = 15
      when 1
        pic_score = 10
      when 2
        pic_score = 5
      when 3..9
        pic_score = 3
      else
        pic_score = 0
      end
        
      pic_score
    end

    # Generates the score for bleeds. Its very simple since the presence of bleeds is pretty significant. If any bleeds exist, the maximum score is given.
    def self.pantone_bleed_score(b)
      pb_score = 0

      if b.bleed.front == true || b.bleed.back == true
        pb_score = 15
      else
        pb_score = 0
      end
    end

    # Generates a score for the raised ink colors. This score is based on the difference between the target business card raised ink colors and the similar business card raised ink colors. The smaller the difference, the higher the score.
    def self.pantone_raised_ink_score(b, t)
      b_colors = b.raised_ink.front + b.raised_ink.back
      t_colors = t["raised_ink"]["front"].to_i + t["raised_ink"]["back"].to_i
      diff = nil
      pri_score = nil

      if b_colors > t_colors
        diff = b_colors - t_colors
      else
        diff = t_colors - b_colors
      end

      case diff
      when 0
        pri_score = 15
      when 1
        pri_score = 10
      when 2
        pri_score = 5
      when 3..9
        pri_score = 3
      else
        pri_score = 0
      end
        
      pri_score
    end

    # Generates a score for the dimensions. This score is based on the difference between the target business card dimensions and the similar business card dimensions. The smaller the difference, the higher the score.
    def self.pantone_dimension_score(b, t)
      b_size = b.dimension.width.to_i + b.dimension.height.to_i
      t_size = t["dimension"]["width"].to_i + t["dimension"]["height"].to_i
      diff = nil
      pd_score = nil

      if b_size > t_size
        diff = b_size - t_size
      else
        diff = t_size - b_size
      end

      case diff
      when 0
        pd_score = 15
      when 1
        pd_score = 10
      when 2
        pd_score = 5
      when 3..9
        pd_score = 3
      else
        pd_score = 0
      end
        
      pd_score
    end

    # Generates the score for coatings. Its very simple since the presence of coatings is pretty significant. If any coatings exist, the maximum score is given.
    def self.pantone_coating_score(b, t)
      if b.coating.front == t["coating"]["front"]
        pc_score = 15
      elsif b.coating.back == t["coating"]["back"]
        pc_score = 15
      else
        pc_score = 0
      end
    end

  end
















