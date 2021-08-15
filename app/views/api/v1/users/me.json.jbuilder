json.extract! @me,
              :id,
              :first_name,
              :last_name,
              :gender,
              :email,
              :phone,
              :birthday,
              :image_url,
              :created_at,
              :updated_at
json.favorites do
  json.array!(@me_favorites) do |me_favorite|
    json.name me_favorite.facility.name
  end
end