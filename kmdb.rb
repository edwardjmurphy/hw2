# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.


Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Studios
warner_bros = Studio.new
warner_bros.name = "Warner Bros."
warner_bros.save

warner = Studio.find_by({"name"=> "Warner Bros."})

# Movies
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins ["rated"] = "PG-13"
batman_begins ["studio_id"] = warner["id"] 
batman_begins.save

the_dark_knight = Movie.new
the_dark_knight ["title"] = "The Dark Knight"
the_dark_knight ["year_released"] = 2008
the_dark_knight ["rated"] = "PG-13"
the_dark_knight ["studio_id"] = warner["id"] 
the_dark_knight.save

the_dark_knight_rises = Movie.new
the_dark_knight_rises ["title"] = "The Dark Knight Rises"
the_dark_knight_rises ["year_released"] = 2012
the_dark_knight_rises ["rated"] = "PG-13"
the_dark_knight_rises ["studio_id"] = warner["id"] 
the_dark_knight_rises.save

# Actors
actor = Actor.new
actor ["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor ["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor ["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor ["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor ["name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor ["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor ["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor ["name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor ["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor ["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor ["name"] = "Anne Hathaway"
actor.save

# Movie IDs
batmanbegins = Movie.find_by({"title"=> "Batman Begins"})
darkknight = Movie.find_by({"title"=> "The Dark Knight"})
darkknightrises = Movie.find_by({"title"=> "The Dark Knight Rises"})

# Batman Begins roles
christian = Actor.find_by({"name" => "Christian Bale"})
role = Role.new
role ["movie_id"] = batmanbegins ["id"]
role ["actor_id"] =  christian ["id"]
role ["character_name"] = "Bruce Wayne"
role.save

michael = Actor.find_by({"name" => "Michael Caine"})
role = Role.new
role ["movie_id"] = batmanbegins ["id"]
role ["actor_id"] =  michael ["id"]
role ["character_name"] = "Alfred"
role.save

liam = Actor.find_by({"name" => "Liam Neeson"})
role = Role.new
role ["movie_id"] = batmanbegins ["id"]
role ["actor_id"] =  liam ["id"]
role ["character_name"] = "Ra's Al Ghul"
role.save

katie = Actor.find_by({"name" => "Katie Holmes"})
role = Role.new
role ["movie_id"] = batmanbegins ["id"]
role ["actor_id"] =  katie ["id"]
role ["character_name"] = "Rachel Dawes"
role.save

gary = Actor.find_by({"name" => "Gary Oldman"})
role = Role.new
role ["movie_id"] = batmanbegins ["id"]
role ["actor_id"] =  gary ["id"]
role ["character_name"] = "Commissioner Gordon"
role.save

# The Dark Knight roles
role = Role.new
role ["movie_id"] = darkknight ["id"]
role ["actor_id"] =  christian ["id"]
role ["character_name"] = "Bruce Wayne"
role.save

heath = Actor.find_by ({"name" => "Heath Ledger"})
role = Role.new
role ["movie_id"] = darkknight ["id"]
role ["actor_id"] =  heath ["id"]
role ["character_name"] = "Joker"
role.save

aaron = Actor.find_by ({"name" => "Aaron Eckhart"})
role = Role.new
role ["movie_id"] = darkknight ["id"]
role ["actor_id"] =  aaron ["id"]
role ["character_name"] = "Harvey Dent"
role.save

role = Role.new
role ["movie_id"] = darkknight ["id"]
role ["actor_id"] =  michael ["id"]
role ["character_name"] = "Alfred"
role.save

maggie = Actor.find_by ({"name" => "Maggie Gyllenhaal"})
role = Role.new
role ["movie_id"] = darkknight ["id"]
role ["actor_id"] =  maggie ["id"]
role ["character_name"] = "Rachel Dawes"
role.save

# The Dark Knight Rises roles
role = Role.new
role ["movie_id"] = darkknightrises ["id"]
role ["actor_id"] =  christian ["id"]
role ["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role ["movie_id"] = darkknightrises ["id"]
role ["actor_id"] =  gary ["id"]
role ["character_name"] = "Commissioner Gordon"
role.save

tom = Actor.find_by ({"name" => "Tom Hardy"})
role = Role.new
role ["movie_id"] = darkknightrises ["id"]
role ["actor_id"] =  tom ["id"]
role ["character_name"] = "Bane"
role.save

joseph = Actor.find_by ({"name" => "Joseph Gordon-Levitt"})
role = Role.new
role ["movie_id"] = darkknightrises ["id"]
role ["actor_id"] =  joseph ["id"]
role ["character_name"] = "John Blake"
role.save

anne = Actor.find_by ({"name" => "Anne Hathaway"})
role = Role.new
role ["movie_id"] = darkknightrises ["id"]
role ["actor_id"] =  anne ["id"]
role ["character_name"] = "Selina Kyle"
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

movies = Movie.all

for movie in movies
    title = movie["title"]
    year_released = movie["year_released"]
    rated = movie["rated"]

    studio = Studio.find_by({"id" => movie["studio_id"]})    
    studio_name = studio["name"]

    puts "#{title} | #{year_released} | #{rated} | #{studio_name}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

roles = Role.all

for role in roles
  
    character_name = role["character_name"]
    # movie_id = role["movie_id"]
    # actor_id = role["actor_id"]
    
    movie = Movie.find_by ({"id" => role["movie_id"]})
    movie_name = movie["title"]

    actor = Actor.find_by({"id" => role["actor_id"]})    
    actor_name = actor["name"]

    puts "#{movie_name} | #{actor_name} | #{character_name}" 
end
