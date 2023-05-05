import axios from 'axios';

const short = [
  {
    name: 'Steve Jobs',
    short: 'The only way to do great work is to love what you do.',
  },
  {
    name: 'Eleanor Roosevelt',
    short: 'The future belongs to those who believe in the beauty of their dreams.',
  },
  {
    name: 'Winston Churchill',
    short: 'Success is not final, failure is not fatal: it is the courage to continue that counts.',
  },
  {
    name: 'Theodore Roosevelt',
    short: "Believe you can and you're halfway there.",
  },
  {
    name: 'Unknown',
    short: 'If you want to live a happy life, tie it to a goal, not to people or things.',
  },
  {
    name: 'Maya Angelou',
    short: "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.",
  },
  {
    name: 'Oscar Wilde',
    short: 'Be yourself; everyone else is already taken.',
  },
  {
    name: 'Helen Keller',
    short: 'The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.',
  },
  {
    name: 'Mark Twain',
    short: 'The secret of getting ahead is getting started.',
  },
  {
    name: 'Nelson Mandela',
    short: 'I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear.',
  },
  {
    name: 'Albert Einstein',
    short: 'Try not to become a man of success, but rather try to become a man of value.',
  },
  {
    name: 'Martin Luther King Jr.',
    short: 'I have a dream that my four little children will one day live in a nation where they will not be judged by the color of their skin, but by the content of their character.',
  },
  {
    name: 'Maya Angelou',
    short: "I can't change the direction of the wind, but I can adjust my sails to always reach my destination.",
  },
  {
    name: 'Winston Churchill',
    short: "If you're going through hell, keep going.",
  },
  {
    name: 'Eleanor Roosevelt',
    short: 'No one can make you feel inferior without your consent.',
  },
  {
    name: 'Abraham Lincoln',
    short: "In the end, it's not the years in your life that count. It's the life in your years.",
  },
  {
    name: 'William Shakespeare',
    short: 'To be, or not to be, that is the question.',
  },
  {
    name: 'Helen Keller',
    short: 'Optimism is the faith that leads to achievement. Nothing can be done without hope and confidence.',
  },
  {
    name: 'Thomas Edison',
    short: "I have not failed. I've just found 10,000 ways that won't work.",
  },
  {
    name: 'Ralph Waldo Emerson',
    short: 'To be yourself in a world that is constantlytrying to make you something else is the greatest accomplishment.',
  },
  {
    name: 'Confucius',
    short: 'It does not matter how slowly you go as long as you do not stop.',
  },
  {
    name: 'Mahatma Gandhi',
    short: 'The weak can never forgive. Forgiveness is the attribute of the strong.',
  },
  {
    name: 'Rumi',
    short: 'Yesterday I was clever, so I wanted to change the world. Today I am wise, so I am changing myself.',
  },
  {
    name: 'Eleanor Roosevelt',
    short: 'Do one thing every day that scares you.',
  },
  {
    name: 'Dr. Seuss',
    short: 'You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.',
  },
  {
    name: 'Martin Luther King Jr.',
    short: 'Darkness cannot drive out darkness; only light can do that. Hate cannot drive out hate; only love can do that.',
  },
  {
    name: 'Maya Angelou',
    short:
      'You may encounter many defeats, but you must not be defeated. In fact, it may be necessary to encounter the defeats, so you can know who you are, what you can rise from, how you can still come out of it.',
  },
  {
    name: 'Henry David Thoreau',
    short: 'Go confidently in the direction of your dreams. Live the life you have imagined.',
  },
  {
    name: 'Winston Churchill',
    short: 'Success consists of going from failure to failure without loss of enthusiasm.',
  },
  {
    name: 'Albert Einstein',
    short: 'Imagination is more important than knowledge. Knowledge is limited. Imagination encircles the world.',
  },
  {
    name: 'Nelson Mandela',
    short: 'Education is the most powerful weapon which you can use to change the world.',
  },
  {
    name: 'Eleanor Roosevelt',
    short: 'You must do the things you think you cannot do.',
  },
  {
    name: 'Steve Jobs',
    short:
      "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it.",
  },
  {
    name: 'Ralph Waldo Emerson',
    short: 'The only way to have a friend is to be one.',
  },
  {
    name: 'Mark Twain',
    short:
      "Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails. Explore, Dream, Discover.",
  },
  {
    name: 'Abraham Lincoln',
    short: 'Folks are usually about as happy as they make their minds up to be.',
  },
  {
    name: 'Maya Angelou',
    short: "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.",
  },
  {
    name: 'Helen Keller',
    short: 'The only thing worse thanbeing blind is having sight but no vision.',
  },
  {
    name: 'Martin Luther King Jr.',
    short: 'I have decided to stick with love. Hate is too great a burden to bear.',
  },
  {
    name: 'Dalai Lama',
    short: 'The purpose of our lives is to be happy.',
  },
  {
    name: 'Maya Angelou',
    short: 'We may encounter many defeats but we must not be defeated.',
  },
  {
    name: 'Thomas Edison',
    short: "I have not failed. I've just found 10,000 ways that won't work.",
  },
  {
    name: 'Albert Einstein',
    short: 'Try not to become a man of success, but rather try to become a man of value.',
  },
  {
    name: 'Mother Teresa',
    short: 'Spread love everywhere you go. Let no one ever come to you without leaving happier.',
  },
  {
    name: 'Walt Disney',
    short: 'All our dreams can come true, if we have the courage to pursue them.',
  },
  {
    name: 'Oscar Wilde',
    short: 'Be yourself; everyone else is already taken.',
  },
  {
    name: 'Nelson Mandela',
    short: 'I never lose. I either win or learn.',
  },
  {
    name: 'Maya Angelou',
    short: "You can't use up creativity. The more you use, the more you have.",
  },
  {
    name: 'Eleanor Roosevelt',
    short: "Do what you feel in your heart to be right – for you'll be criticized anyway.",
  },
  {
    name: 'Mark Twain',
    short: 'The secret of getting ahead is getting started.',
  },
  {
    name: 'Audrey Hepburn',
    short: "Nothing is impossible, the word itself says 'I'm possible'!",
  },
  {
    name: 'Henry David Thoreau',
    short: 'Our truest life is when we are in dreams awake.',
  },
  {
    name: 'Martin Luther King Jr.',
    short: 'Our lives begin to end the day we become silent about things that matter.',
  },
  {
    name: 'Maya Angelou',
    short: "If you don't like something, change it. If you can't change it, change your attitude.",
  },
  {
    name: 'Ralph Waldo Emerson',
    short: 'To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.',
  },
  {
    name: 'Confucius',
    short: 'It does not matter how slowly you go as long as you do not stop.',
  },
  {
    name: 'Mahatma Gandhi',
    short: 'The weak can never forgive. Forgiveness is the attribute of the strong.',
  },
  {
    name: 'Rumi',
    short: 'Yesterday I was clever, so I wanted to change the world. Today I am wise, so I am changing myself.',
  },
  {
    name: 'Eleanor Roosevelt',
    short: 'Do one thing every day that scares you.',
  },
  {
    name: 'Dr. Seuss',
    short: 'You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.',
  },
  {
    name: 'Martin Luther KingJr.',
    short: 'Darkness cannot drive out darkness; only light can do that. Hate cannot drive out hate; only love can do that.',
  },
  {
    name: 'Maya Angelou',
    short: 'Success is liking yourself, liking what you do, and liking how you do it.',
  },
  {
    name: 'William Shakespeare',
    short: "All the world's a stage, and all the men and women merely players.",
  },
  {
    name: 'Eleanor Roosevelt',
    short: 'No one can make you feel inferior without your consent.',
  },
  {
    name: 'Abraham Lincoln',
    short: 'I will prepare and someday my chance will come.',
  },
  {
    name: 'Maya Angelou',
    short: "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.",
  },
  {
    name: 'Steve Jobs',
    short: 'Innovation distinguishes between a leader and a follower.',
  },
  {
    name: 'Helen Keller',
    short: 'The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.',
  },
  {
    name: 'Napoleon Hill',
    short: 'Whatever the mind of man can conceive and believe, it can achieve.',
  },
  {
    name: 'Maya Angelou',
    short:
      'You may encounter many defeats, but you must not be defeated. In fact, it may be necessary to encounter the defeats, so you can know who you are, what you can rise from, how you can still come out of it.',
  },
  {
    name: 'Albert Einstein',
    short: 'Imagination is more important than knowledge. Knowledge is limited. Imagination encircles the world.',
  },
  {
    name: 'Martin Luther King Jr.',
    short: 'The time is always right to do what is right.',
  },
  {
    name: 'Maya Angelou',
    short: "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.",
  },
  {
    name: 'Oprah Winfrey',
    short: 'The biggest adventure you can ever take is to live the life of your dreams.',
  },
  {
    name: 'Mark Twain',
    short: 'The man who does not read good books has no advantage over the man who cannot read them.',
  },
  {
    name: 'Buddha',
    short: 'The mind is everything. What you think you become.',
  },
  {
    name: 'Maya Angelou',
    short: "If you're always trying to be normal, you will never know how amazing you can be.",
  },
  {
    name: 'Nelson Mandela',
    short: 'Education is the most powerful weapon which you can use to change the world.',
  },
  {
    name: 'Helen Keller',
    short: 'The only thing worse than being blind is having sight but no vision.',
  },
  {
    name: 'Martin Luther King Jr.',
    short: 'I have decided to stick with love. Hate is too great a burden to bear.',
  },
  {
    name: 'Dalai Lama',
    short: 'The purpose of our lives is to be happy.',
  },
  {
    name: 'Confucius',
    short: 'It does not matter how slowly you go as long as you do not stop.',
  },
  {
    name: 'Maya Angelou',
    short: "Try to be a rainbow in someone's cloud.",
  },
  {
    name: 'Oscar Wilde',
    short: 'Be yourself; everyone else is already taken.',
  },
  {
    name: 'Helen Keller',
    short: 'Alone we can do so little; together we can do so much.',
  },
  {
    name: 'Maya Angelou',
    short: "You can't use up creativity. The more you use, the more you have.",
  },
  {
    name: 'Steve Jobs',
    short:
      "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it.",
  },
  {
    name: 'Winston Churchill',
    short: 'Success is not final, failure is not fatal: it is the courage to continue that counts.',
  },
  {
    name: 'Maya Angelou',
    short: 'Nothing will work unless you do.',
  },
  {
    name: 'Ralph Waldo Emerson',
    short: 'Do not go where the path may lead, go instead where there is no path and leave a trail.',
  },
  {
    name: 'Nelson Mandela',
    short: "It always seems impossible until it's done.",
  },
  {
    name: 'Maya Angelou',
    short: 'We may encounter many defeats but we must not be defeated.',
  },
  {
    name: 'Walt Disney',
    short: 'All our dreams can come true, if we have the courage to pursue them.',
  },
  {
    name: 'Maya Angelou',
    short: "Courage is the most important of all the virtues because without courage, you can't practice any other virtue consistently.",
  },
  {
    name: 'Albert Einstein',
    short: 'The important thing is not to stop questioning. Curiosity has its own reason for existing.',
  },
  {
    name: 'Maya Angelou',
    short: 'You may not control all the events that happen to you, but you can decide not to be reduced by them.',
  },
  {
    name: 'Mark Twain',
    short:
      "Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do. So throw off the bowlines. Sail away from the safe harbor. Catch the trade winds in your sails. Explore. Dream. Discover.",
  },
  {
    name: 'Maya Angelou',
    short: 'There is no greater agony than bearing an untold story inside you.',
  },
  {
    name: 'Eleanor Roosevelt',
    short: 'Do one thing every day that scares you.',
  },
  {
    name: 'Maya Angelou',
    short: 'I know why the caged bird sings.',
  },
  {
    name: 'Mahatma Gandhi',
    short: 'The weak can never forgive. Forgiveness is the attribute of the strong.',
  },
];

(async () => {
  let length: number = short.length;
  for (var i = 0; i < length; i += 1) {
    const data = {
      name: short[i].name,
      short: short[i].short,
    };
    await axios.post(`http://0.0.0.0:5000/shorts/`, data);
    console.log(data);
  }
})();
