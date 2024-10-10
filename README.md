# Steps to Run the App
To run the app, simply clone the repo locally and run via Xcode.

# Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
For this project, I prioritized following SOLID principles and from the very beginning establishing a clear separation of concerns between the user interface and api service related logic. 
This was achieved by using the MVVM design pattern and I chose to focus on this area to make the app easier to understand and improve on in the future. 
This also made it easier to unit test the app.

# Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spent roughly 4 hours working on the project allocating my time by first thinking about the app in a TDD (Test-Driven-Development) manner thinking first about how to architect the app in a way that will make unit testing easier. 
I then spent a good portion of the time thinking of different ways to structure the UI and settled on a simple List approach with recipes organized by cuisine. 
A good amount of time was also spent on researching an acceptable image caching library for this project to save time and focus on other areas of the app.

# Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
Regarding trade-offs, in the interest of time I did decide to go with Kingfisher for image caching. 
While this is not a big deal in the grand scheme of things, this kind of dependence on third party libraries has the potential for the app to break if the developers of the library made breaking changes in future releases.

# Weakest Part of the Project: What do you think is the weakest part of your project?
The weakest part of the project is perhaps the lack of an engaging user interface. Instead of focusing on a flashy user interface, my goal was to make the mobile app simplistic but responsive and reliable. 
Images are cached to avoid unnecessary bandwidth consumption and if the user force-quits the app and then reopens, it’s clear that the images did not have to reload and are pulled directly from the cache. 

# External Code and Dependencies: Did you use any external code, libraries, or dependencies?
Yes, Kingfisher was used for image caching via SPM (Swift Package Manager) as noted in the project requirements. 

# Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
In the beginning, I did initially populate the list in the user interface by directly using the json response as provided. 
However, to make the user interface more natural and appealing, I re-organized the data received from the API call in a way that structures the recipes by cuisines which I believe reads more naturally.
