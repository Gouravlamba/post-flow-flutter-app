
🚀 PostsFlow App
A Flutter Application to Fetch, Cache, and Display Posts Smoothly

Built with Flutter 3, BLoC State Management, REST APIs, and Local Storage

📑 Table of Contents

Project Overview

Objectives

Features

Tech Stack

Architecture Overview

Folder Structure

Data Flow

API Details

Local Storage

State Management (BLoC)

UI & Theme Decisions

Screens & UI Explanation

GIF & Gradient Card Logic

Error Handling

Setup Instructions

Build & Run

Common Errors & Fixes

Future Enhancements

Contributing

License

🧩 Project Overview

PostsFlow App is a Flutter application designed to fetch a list of posts from a REST API, cache them locally, display them in a beautiful UI, and provide a smooth browsing experience using state management and clean architecture.

The goal of this assignment project is to show:

✔ Code cleanliness
✔ Layered folder architecture
✔ Efficient state management
✔ UI/UX polish
✔ API handling + caching
✔ Reusability of widgets
✔ Professional development practices

🎯 Objectives
1. Functional Objectives

Fetch posts from API

Show posts in a list

Navigate to detail screen

Mark posts as "read"

Cache read status locally

Provide drawer + settings screen

2. Technical Objectives

Implement BLoC for app-wide state management

Build Repository Pattern for API abstraction

Add local caching using SharedPreferences

Build reusable widgets (GIF Banner, Post Card, etc.)

3. UI/UX Objectives

Gradient cards for unread posts

Change card to red after clicking

Light animated GIF on Home screen

Clean theme with consistent color palette

🛠️ Tech Stack
Layer    |    	Technology Used

Framework  	|   Flutter 3.x

State Management	|    BLoC (flutter_bloc)

Networking	  |   http package

Architecture	|  MVVM + Repository

Caching  	|    SharedPreferences

UI	  |     Material 3,Custom Widgets

API	  |    JSON Placeholder REST API

🧠🔥USED BLoC STATE MANAGEMENT :
BLoC is a pattern that separates the UI from the business logic, ensuring that the UI only reacts to states while the logic is processed behind the scenes.

It follows:

Event  →  Bloc (Logic)  →  State


Meaning:

UI sends Events

BLoC receives events and runs logic

BLoC outputs States

UI rebuilds based on state

🟦 Why BLoC?

Problem Without BLoC	How BLoC Solves It UI gets mixed with logic	Clean separation Hard to maintain	Highly scalable Rebuilding wrong widgets	Only updates listening widgets Unpredictable behavior	Predictable state transitions
Difficult debugging	State-by-state traceable logic

BLoC guarantees that your app behaves the same way every time, even with complex flows.

🟩 How BLoC Works in PostsFlow App

Below is the actual flow used in this project:

1️⃣ UI Sends an Event

When Posts screen opens:

context.read<PostsBloc>().add(FetchPostsEvent());


When tapping a post card:

context.read<PostsBloc>().add(MarkPostAsReadEvent(post));


The UI never touches API logic.

2️⃣ BLoC Receives the Event

Example:

on<FetchPostsEvent>(_onFetchPosts);


Now the BLoC decides what to do:

Fetch API data

Validate response

Store read status

Emit success or failure states

3️⃣ BLoC Emits a State

Possible states:

Loading State
emit(PostsLoadingState());


The UI shows a loader.

Loaded State
emit(PostsLoadedState(posts));


UI displays data.

Error State
emit(PostsErrorState("Failed to fetch posts"));


UI shows an error message.

🟨 Full Visual Flow Diagram
 ┌────────────┐       ┌──────────────┐      ┌──────────────┐      ┌────────────┐
 │    UI      │ ----> │    Event     │ ---> │     BLoC     │ ---> │   State    │
 └────────────┘       └──────────────┘      └──────────────┘      └────────────┘
         ↑                                                                 |
         └──────────────────── UI listens for state changes ───────────────┘



🟪 BLoC Components Used
✔ PostsEvent

Handles all user-triggered actions:

Fetch posts

Refresh

Mark as read

✔ PostsState

Represents the UI at any moment:

Loading

Loaded

Error

✔ PostsBloc

The heart of the logic:

Communicates with repository

Emits correct states

Updates UI

✔ PostDetailBloc

Handles details screen logic.

✔ BottomNavCubit

Controls bottom nav state.

🟧 Benefits of Using BLoC in this Assignment

Clean and professional architecture

Reusable widgets with predictable behavior

Very easy to test

Works with large real-world apps

Matches modern Flutter standards

No direct logic inside widgets

Smooth UI performance

🟦 Summary of BLoC Workflows in This App
🔹 Fetch Posts

UI → Event → Repository → API → State → UI Update

🔹 Mark as Read

UI → Event → Local Storage → Update State → UI Update

🔹 Navigate to Details

UI → Router → PostDetailBloc → UI

🔹 Bottom Navigation

User tap → Cubit → State → Page Switch


⚠️ Error Handling in PostsFlow App

The PostsFlow App uses a structured, layered error-handling system to ensure smooth user experience even when network or data failures occur. The app never crashes due to API or storage errors because all exceptions are properly captured, mapped, and converted into user-friendly messages.

🎯 Key Principles of Error Handling

Prevent application crashes

Convert technical exceptions into readable messages

Keep UI free from business-logic errors

Maintain a predictable BLoC → State → UI flow

Enable users to retry operations easily

🧱 Error Handling Architecture

Error handling in PostsFlow is implemented across three distinct layers:

1️⃣ API Service Layer (Network-Level Errors)

All API calls are wrapped in try-catch and can throw custom exceptions when:

Internet connection fails

Request timeouts occur

API endpoint returns 404/500

Response data is invalid or empty

When such errors occur, ApiService throws:

AppException("Unable to fetch data from server.")


This prevents raw HTTP errors from leaking into the UI.

2️⃣ Repository Layer (Logic-Level Error Mapping)

The repository receives exceptions from the API service and converts them into clean domain errors.

Example:

throw AppException("Failed to load posts. Please try again.");


This ensures the UI and BLoC receive meaningful messages instead of raw exceptions.

3️⃣ BLoC Layer (State-Level Error Handling)

BLoC listens for exceptions and emits appropriate error states:

emit(PostsErrorState("Something went wrong while loading posts."));


This ensures:

All errors are represented as states, not crashes

UI can gracefully switch to an error message screen

User can pull-to-refresh or retry

🖥️ User-Friendly Error Display

Errors are shown through a common reusable component:

ErrorMessage Widget

Displays:

Error text

Retry button

Friendly styling

Example message:

Unable to fetch posts.
Please check your internet connection.

🔁 Retry Support

Users can retry loading posts via:

A refresh event

Retry button

Back navigation

This triggers:

FetchPostsEvent()


ensuring the app recovers without restarting.


🏛 Architecture Overview

PostsFlow follows a clean, scalable architecture:

Presentation Layer (UI)
      ↓
Logic Layer (BLoC / Cubits)
      ↓
Repository Layer
      ↓
Data Source
(API Service & Local Storage)

📂 Folder Structure
lib/
 ├── app.dart
 
 ├── main.dart

 ├── config/
 │    ├── routes.dart
 │    └── theme.dart

 ├── core/
 │    ├── constants/
 │    │     └── app_colors.dart
 
 │    ├── error/
 
 │    │     └── app_exceptions.dart
 
 │    └── utils/
 │          └── helpers.dart

 ├── data/
 │    ├── models/
 │    │     └── post_model.
 
 │    ├── repository/
 │    │     └── post_repository.dart
 
 │    ├── services/
 │    │     ├── api_service.dart
 │    │     └── local_storage_service.dart
 
 │    └── local/
 │          └── local_database.dart

 ├── logic/
 │    ├── bottom_nav/
 │    │     ├── bottom_nav_cubit.dart
 │    │     └── bottom_nav_state.dart
 
 │    ├── posts/
 │    │     ├── posts_bloc.dart
 │    │     ├── posts_event.dart
 │    │     └── posts_state.dart
 
 │    └── post_detail/
 │          ├── post_detail_bloc.dart
 │          ├── post_detail_event.dart
 │          └── post_detail_state.dart

 ├── presentation/
 │    ├── screens/
 │    │     ├── home/home_screen.dart
 │    │     ├── posts/posts_list_screen.dart
 │    │     ├── posts/post_detail_screen.dart
 │    │     ├── settings/settings_screen.dart
 │    │     ├── profile/profile_screen.dart
 
 │    ├── widgets/
 │    │     ├── post_item_card.dart
 │    │     ├── gif_banner.dart
 │    │     ├── app_drawer.dart
 │    │     └── error_message.dart

 └── assets/
       ├── task.png
       └── gif/avatar.gif

🔄 Data Flow
1. Fetch API
UI → PostsBloc → Repository → ApiService → API

2. Store read status locally
UI → Bloc Event → LocalStorageService → SharedPreferences

3. Navigate to details
UI → Navigator → PostDetailScreen

🌐 API Details

API Source:

https://jsonplaceholder.typicode.com/posts

Sample Response:
{
  "userId": 1,
  "id": 1,
  "title": "Sample title",
  "body": "Sample description..."
}

💾 Local Storage (Caching Read Status)

The app saves:

read_posts = [1, 4, 7, 10]


So when user opens app again → read posts stay marked as red.

🖼 Screens & UI Explanation
Home Screen

Welcoming text

Animated GIF

Drawer with profile

Posts List Screen

Gradient card for unread posts

Tap card → mark as read (turns red)

Post Detail Screen

Shows title + body

Settings Screen

settings

Logo + user options

Drawer

Logo

Circular avatar

Menu options

Clean one-color background

🪄 GIF & Gradient Card Logic
Unread Post
Pink → Gold gradient

After Clicking
Solid Red

GIF Widget Features

Smooth fade-in

Circular loader

gaplessPlayback = true

Reusable widget

🧩 Error Handling

Custom App Exceptions:

No Internet

API Failure

Timeout

Parsing Error

UI fallback → ErrorMessage widget.

🚀 Setup Instructions
1. Clone Repo
git clone https://github.com/yourusername/postsflow_app.git

2. Install Dependencies
flutter pub get

3. Run App
flutter run

📦 Build Release
Android:
flutter build apk

iOS:
flutter build ios


🔮 Future Enhancements

Dark mode

Animated drawer avatar

Offline mode

Search posts

Pagination

Theme personalization
