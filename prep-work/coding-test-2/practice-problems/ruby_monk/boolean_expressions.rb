# We are looking to hire experienced Ruby programmers.
# Our ideal candidate has 2 or more years of experience, but some programmers become really good even before that.
# We'll consider their Github points (a nice indicator of a good programmer), and even if they are not experienced,
# candidates with 500 Github points or more can apply. And there is one more catch: Ruby being a cool and awesome
# language, a lot of smart youngsters are very good at it. We love those kids, but for this particular job we'd
# rather have them study at school than work. Let us filter out candidates who are younger than 15. Also we
# don't want to consider candidates who applied recently for this opening.


is_an_experienced_ruby_programmer = (candidate.languages_worked_with.include? 'Ruby') &&
        (candidate.years_of_experience >= 2 || candidate.github_points >= 500) &&
        ! (candidate.age < 15 || candidate.applied_recently?)