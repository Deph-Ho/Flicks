# Flicks
iOS app that lets users view top movies in theatres

# Project 1 - Flicks

Flicks is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **7** hours spent in total
## User Stories

The following **required** functionality is complete:

- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [ ] User sees an error message when there's a networking error.
- [ ] Movies are displayed using a CollectionView instead of a TableView.
- [x] User can search for a movie.
- [x] All images fade in as they are loading.
- [ ] Customize the UI.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Explain more on how JSON works - does it show the structure of the API so that we know how to structure the UI? 
2. How to view the movie descriptions fully when pressed

## Video Walkthrough 
http://imgur.com/DyX8KcL

<img src='http://imgur.com/DyX8KcL.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
The challenges in making this application was not understanding the full use of the methods and labels in Swift.  
I had a problem with the network request snippet because my Xcode was an older version so the syntax was different than 
the instructions and had bugs on all those lines.  Those got fixed during class with the help of TA's explaining
that the best way was to follow Xcode's syntax by retyping it out to get the latest version/appropriate version.
In the end, I did update Xcode to 8.0 to make sure I was up to date.  Major challenge was to figure out where to put
the lines of code and trying to comprehend the logic and flow of the code.

# Project 2 - *Flicks*

**Flicks** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **10** hours spent in total for part 2

## User Stories

The following **required** functionality is completed:

- [x] User can view movie details by tapping on a cell.
- [x] User can select from a tab bar for either **Now Playing** or **Top Rated** movies.
- [x] Customize the selection effect of the cell.

The following **optional** features are implemented:

- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the navigation bar.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How does navigation controller relate to showing a view from the main view? How do you use more than one?
2. How to know what to access in the API that is in JSON.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:
http://imgur.com/cM1YZ1G

<img src='http://i.imgur.com/cM1YZ1G.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

Challenge Update 2/13/17
Major challenges were trying to understand the conceptual meaning behind the code. I also had a hard time trying to figure out how to put on a button in the main view, and when the button is pushed, it moves to a the collectionview controller. I need to understand more what each variable represents and what the functions do.  A lot of challenges include trying to follow the general guide provided by CodePath, while making sure the code is in context to the project.  Also, it was hard trying to figure out where to put variables and methods in.  I keep mixing them up in different functions or different view classes.

## License

    Copyright [2017] [Dephanie Ho]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
