me = User.create(full_name: 'Weslley Lucas Silva dos Santos', email: 'weslusisa@gmail.com', password: '102030')

my_first_deck = Deck.create(name: 'first deck', description: 'deck for tests purpose', user: me)

Question.create(question: 'Meu primeiro nome', question_type: 'multiple_choice', correct_answer: 'Weslley',
                wrong_answer_n1: 'Joao', wrong_answer_n2: 'Pedro', wrong_answer_n3: 'Lucas', deck: my_first_deck)
