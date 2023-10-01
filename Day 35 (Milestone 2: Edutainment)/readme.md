# Challenge:

The goal is to build an “edutainment” app for kids to help them practice multiplication tables – “what is 7 x 8?” and so on. Edutainment apps are educational at their code, but ideally have enough playfulness about them to make kids want to play.

Breaking it down:

* The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.
* The player should be able to select how many questions they want to be asked: 5, 10, or 20.
* You should randomly generate as many questions as they asked for, within the difficulty range they asked for.
* If you want to go fully down the “education” route then this is going to be some steppers, a text field and a couple of buttons. I would suggest that’s a good place to start, just to make sure you have the basics covered.

Once you have that, it’s down to you how far you want to take the app down the “entertainment” route – you could throw away fixed controls like Stepper entirely if you wanted, and instead rely on colorful buttons to get the same result.

This is one of those challenges that is best approached step by step: get something working first, then improve it as far as you want. Maybe you’re happy with a simple app, or maybe you really want to spend some time crafting a fun design. It’s down to you!

At the very least, you should:

* Start with an App template, then add some state to determine whether the game is active or whether you’re asking for settings.
* Generate a range of questions based on the user’s settings.
* Show the player how many questions they got correct at the end of the game, then offer to let them play again.
* Once you have your code working, try and see if you can break up your layouts into new SwiftUI views rather than putting everything in ContentView. This requires passing data between views, which isn’t something we’ve covered in detail yet, so in the meantime send data using closures – the button action from your settings view would call a function passed in by the parent view that starts the game with the user’s settings, for example.

# Preview:



https://github.com/chxenia/100-Days-Of-SwiftUI/assets/145117372/07219bed-cfbe-4c4d-99f8-8b725d640b19


