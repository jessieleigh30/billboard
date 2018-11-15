10.times do 
  Chart.create(
    name: Faker::Music.genre
  )
end

 50.times do
  Artist.create(
    name: Faker::Music.band
  )
 end
 
  Artist.all.each do 
    title = Faker::Book.title,
    album = Faker::Music.album,
    chart_id = rand(10) + 1
    artist_id = rand(50) + 1
    Song.create(
      title: title,
      album: album,
      chart_id: chart_id,
      artist_id: artist_id
      )
    end
   


 puts "successfully seeded"