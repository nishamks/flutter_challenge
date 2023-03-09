# flutter_challenge

A new Flutter Assignment.

## Getting Started

###Introduction
This is a simple Flutter application that demonstrates how to use the flutter_bloc package and the retrofit package to fetch and display data from an API.

The application allows the user to list all albums and filter them by title. The user can also view the photos of a specific album and see their thumbnail and title.

###Architecture
This application uses the BLoC (Business Logic Component) architecture pattern, which separates the presentation layer from the business logic layer. The flutter_bloc package is used to implement this pattern.

The retrofit package is used to generate Dart classes that represent the API endpoints. These classes are used by the BLoCs to fetch data from the API.

###Packages used
flutter_bloc: Used to implement the BLoC architecture pattern.
retrofit: Used to generate Dart classes that represent the API endpoints.
dio: A powerful HTTP client for Dart that is used by retrofit to make HTTP requests.

###API endpoints
Album list: https://jsonplaceholder.typicode.com/albums
Album list search by title: https://jsonplaceholder.typicode.com/albums?title={TITLE}
Album: https://jsonplaceholder.typicode.com/albums/{ALBUM_ID}
Album photos list: https://jsonplaceholder.typicode.com/albums/{ALBUM_ID}/photos

###Installation

To run this application, follow these steps:

Clone this repository.
Run flutter packages get to install the required packages.
Run the application using flutter run.

##Usage
When you run the application, you will see a screen with a list of all albums. You can filter the albums by title by typing a search term in the search bar at the top of the screen.

To view the photos of an album, tap on an album in the list. You will be taken to a screen that displays the photos of the selected album. Each photo is displayed as a thumbnail and its title is displayed below it.
