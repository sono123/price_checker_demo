# USER SEEDS

User.create!(name: "Sample User",
						 email: "stevenwono@gmail.com",
						 password:              "foobar",
						 password_confirmation: "foobar",
						 admin: false, 
						 activated: true,
						 activated_at: Time.zone.now)


User.create!(name: "Steve Ono",
						 email: "steveono@gmail.com",
						 password:              "temporary",
						 password_confirmation: "temporary",
						 admin: true, 
						 activated: true,
						 activated_at: Time.zone.now)


99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(name: name,
							 email: email,
							 password:              password,
							 password_confirmation: password,
							 activated: true,
							 activated_at: Time.zone.now)
end



# PRODUCT RELATED SEEDS

# Print Methods
print_methods = ["pantone offset", "cmyk offset", "letterpress", "digital"]
print_methods.each do |name|
	PrintMethod.create(print_method: name)
end


# Ink Colors
InkColor.create(front: 1, back: 0)
InkColor.create(front: 2, back: 0)
InkColor.create(front: 3, back: 0)
InkColor.create(front: 4, back: 0)
InkColor.create(front: 1, back: 1)
InkColor.create(front: 2, back: 1)
InkColor.create(front: 3, back: 1)
InkColor.create(front: 4, back: 1)
InkColor.create(front: 2, back: 2)
InkColor.create(front: 3, back: 2)
InkColor.create(front: 4, back: 2)
InkColor.create(front: 3, back: 3)
InkColor.create(front: 4, back: 3)
InkColor.create(front: 4, back: 4)




# Bleeds
Bleed.create(front: false, back: false)
Bleed.create(front: true, back: false)
Bleed.create(front: false, back: true)
Bleed.create(front: true, back: true)


# Raised Inks
RaisedInk.create(front: 0, back: 0)
RaisedInk.create(front: 1, back: 0)
RaisedInk.create(front: 2, back: 0)
RaisedInk.create(front: 3, back: 0)
RaisedInk.create(front: 4, back: 0)
RaisedInk.create(front: 1, back: 1)
RaisedInk.create(front: 2, back: 1)
RaisedInk.create(front: 3, back: 1)
RaisedInk.create(front: 4, back: 1)
RaisedInk.create(front: 2, back: 2)
RaisedInk.create(front: 3, back: 2)
RaisedInk.create(front: 4, back: 2)
RaisedInk.create(front: 3, back: 3)
RaisedInk.create(front: 4, back: 3)
RaisedInk.create(front: 4, back: 4)


# Dimensions
Dimension.create(width: 3.5, height: 2)
Dimension.create(width: 2.5, height: 2.5)
Dimension.create(width: 6, height: 4)


# Paper Types
PaperType.create(brand: "neenah", name: "classic crest", color: "solar white", thickness: 130)
PaperType.create(brand: "neenah", name: "classic crest", color: "natural white", thickness: 130)
PaperType.create(brand: "neenah", name: "classic linen", color: "solar white", thickness: 130)
PaperType.create(brand: "mohawk", name: "strathmore", color: "ultimate white", thickness: 130)
PaperType.create(brand: "mohawk", name: "strathmore", color: "bright white", thickness: 130)
PaperType.create(brand: "mohawk", name: "strathmore", color: "natural white", thickness: 130)
PaperType.create(brand: "house", name: "premium matte", color: "white", thickness: 130)


# Coatings
Coating.create(front: "none", back: "none")

Coating.create(front: "uv", back: "none")
Coating.create(front: "none", back: "uv")
Coating.create(front: "uv", back: "uv")
Coating.create(front: "silk", back: "silk")
Coating.create(front: "suede", back: "suede")
Coating.create(front: "varnish", back: "none")
Coating.create(front: "none", back: "varnish")
Coating.create(front: "varnish", back: "varnish")


# Quantities
quantity_increments = [250, 500, 1000, 1500, 2000, 2500]
quantity_increments.each do |qty|
	Quantity.create(quantity: qty)
end


# Box Counts
(1..10).to_a.each do |qty|
	BoxCount.create(box_count: qty)
end

# Metals
Metal.create(front: "none", back: "none")
Metal.create(front: "foil", back: "none")
Metal.create(front: "none", back: "foil")
Metal.create(front: "foil", back: "foil")
Metal.create(front: "metallic ink", back: "none")
Metal.create(front: "none", back: "metallic ink")
Metal.create(front: "metallic ink", back: "metallic ink")

# Print Method    1..4
# Ink Color       1..14
# Bleed           1(none)..4
# Raised Ink      1(none)..15
# Dimensions      1
# Coatings        1(none)..9
# Quantities      1..6
# Box Counts      1..10
# Metal           1(none)..7
# Paper Type      1..7


# Business Card Seeds

# 1/0 Pantone
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 1, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 100, 
										price: 200
										)

# 1/0 Pantone  x  2 Boxes
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 1, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 2, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 150, 
										price: 300
										)

# 2/0 Pantone
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 2, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 100, 
										price: 200
										)

# 2/0 Pantone  x  2 Boxes
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 2, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 2, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 150, 
										price: 310
										)

# 3/0 Pantone
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 3, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 150, 
										price: 280
										)

# 3/0 Pantone  x  2 Boxes
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 3, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 2, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 250, 
										price: 400
										)

# 4/0 Pantone
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 4, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 150, 
										price: 310
										)

# 4/0 Pantone  x  2 Boxes
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 4, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 2, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 200, 
										price: 400
										)

# 1/1 Pantone
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 5, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 100, 
										price: 190
										)

# 2/1 Pantone
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 6, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 125, 
										price: 250
										)

# 3/1 Pantone
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 7, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 150, 
										price: 300
										)

# 4/1 Pantone
BusinessCard.create(print_method_id: 1, 
										ink_color_id: 8, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 200, 
										price: 350
										)

# 4/0 CMYK Offset
BusinessCard.create(print_method_id: 2, 
										ink_color_id: 4, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 7, 
										user_id: 1, 
										cost: 175, 
										price: 320
										)

# 4/1 CMYK Offset
BusinessCard.create(print_method_id: 2, 
										ink_color_id: 8, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 130, 
										price: 260
										)

# 4/4 CMYK Offset
BusinessCard.create(print_method_id: 2, 
										ink_color_id: 14, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 7, 
										user_id: 1, 
										cost: 200, 
										price: 380
										)


# 1/0 Letterpress
BusinessCard.create(print_method_id: 3, 
										ink_color_id: 1, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 400, 
										price: 650
										)

# 2/0 Letterpress
BusinessCard.create(print_method_id: 3, 
										ink_color_id: 2, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 450, 
										price: 750
										)

# 3/0 Letterpress
BusinessCard.create(print_method_id: 3, 
										ink_color_id: 3, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 500, 
										price: 850
										)

# 4/0 Letterpress
BusinessCard.create(print_method_id: 3, 
										ink_color_id: 4, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 550, 
										price: 950
										)

# 1/1 Letterpress
BusinessCard.create(print_method_id: 3, 
										ink_color_id: 5, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 450, 
										price: 750
										)

# 2/1 Letterpress
BusinessCard.create(print_method_id: 3, 
										ink_color_id: 6, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 500, 
										price: 850
										)


# 4/0 Digital
BusinessCard.create(print_method_id: 4, 
										ink_color_id: 4, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 100, 
										price: 220
										)

# 4/1 Digital
BusinessCard.create(print_method_id: 4, 
										ink_color_id: 8, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 1, 
										user_id: 1, 
										cost: 130, 
										price: 260
										)

# 4/4 Digital
BusinessCard.create(print_method_id: 4, 
										ink_color_id: 14, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 7, 
										user_id: 1, 
										cost: 200, 
										price: 380
										)

# 1/1 Digital
BusinessCard.create(print_method_id: 4, 
										ink_color_id: 5, 
										bleed_id: 1, 
										raised_ink_id: 1, 
										dimension_id: 1, 
										coating_id: 1, 
										quantity_id: 2, 
										box_count_id: 1, 
										metal_id: 1, 
										paper_type_id: 7, 
										user_id: 1, 
										cost: 110, 
										price: 210
										)

























