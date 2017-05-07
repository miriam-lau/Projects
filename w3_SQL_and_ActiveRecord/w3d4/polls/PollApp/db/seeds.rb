# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(user_name: 'Ally McBeal')
user2 = User.create(user_name: 'Homer Simpson')
user3 = User.create(user_name: 'Tapanga')

poll1 = Poll.create(title: 'Ally\'s Poll', author_id: user1.id)
poll2 = Poll.create(title: 'Homer\'s Poll', author_id: user2.id)
poll3 = Poll.create(title: 'Tapanga\'s Poll', author_id: user3.id)

question1 = Question.create(body: 'Favorite Color', poll_id: poll1.id)
question2 = Question.create(body: 'Favorite Beer',  poll_id: poll2.id)
question3 = Question.create(body: 'Favorite Animal', poll_id: poll3.id)

answer_choice1 = AnswerChoice.create(choice: 'Purple', question_id: question1.id)
answer_choice2 = AnswerChoice.create(choice: 'Ruby', question_id: question1.id)

answer_choice3 = AnswerChoice.create(choice: 'Duff', question_id: question2.id)
answer_choice4 = AnswerChoice.create(choice: 'PBR', question_id: question2.id)
answer_choice5 = AnswerChoice.create(choice: 'Blue Moon', question_id: question2.id)

answer_choice6 = AnswerChoice.create(choice: 'Panther', question_id: question3.id)
answer_choice7 = AnswerChoice.create(choice: 'Bugs', question_id: question3.id)

response1 = Response.create(user_id: user1.id, answer_choice_id: answer_choice1.id)
response2 = Response.create(user_id: user2.id, answer_choice_id: answer_choice1.id)

response3 = Response.create(user_id: user2.id, answer_choice_id: answer_choice3.id)
response4 = Response.create(user_id: user3.id, answer_choice_id: answer_choice4.id)
response5 = Response.create(user_id: user1.id, answer_choice_id: answer_choice5.id)

response6 = Response.create(user_id: user2.id, answer_choice_id: answer_choice6.id)
response7 = Response.create(user_id: user3.id, answer_choice_id: answer_choice6.id)
response8 = Response.create(user_id: user1.id, answer_choice_id: answer_choice6.id)
