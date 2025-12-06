<h1 align="center">🚀 PostsFlow App</h1>
<h3 align="center">A Flutter Application to Fetch, Cache, and Display Posts Smoothly</h3>
<p align="center"> Built with <b>Flutter 3</b>, <b>BLoC State Management</b>, <b>REST APIs</b>, and <b>Local Storage</b> </p>
<h2>📑 Table of Contents</h2>

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

<h2>🧩 Project Overview</h2>

PostsFlow App is a Flutter application designed to:

Fetch a list of posts from a REST API

Cache them locally

Display them in a beautiful UI

Provide smooth browsing using BLoC + clean architecture

Goals of the assignment:

✔ Code cleanliness

✔ Layered folder architecture

✔ Efficient state management

✔ UI/UX polish

✔ API handling

✔ Reusable widgets

✔ Professional development practices

<h2>🎯 Objectives</h2>
<h3>1️⃣ Functional Objectives</h3>

Fetch posts from API

Show posts in a list

Navigate to detail screen

Mark posts as "read"

Cache read status locally

Provide drawer + settings screen

<h3>2️⃣ Technical Objectives</h3>

Implement BLoC for app-wide state management

Build Repository Pattern for API abstraction

Add local caching using SharedPreferences

Build reusable widgets

Add GIF Banner and Post Card widgets

<h3>3️⃣ UI/UX Objectives</h3>

Gradient cards for unread posts

Card turns red after clicking

Animated GIF on home screen

Clean Material 3 theme

<h2>🛠️ Tech Stack</h2>
Layer	Technology
Framework	Flutter 3.x
State Management	BLoC (flutter_bloc)
Networking	http package
Architecture	MVVM + Repository
Caching	SharedPreferences
UI	Material 3, Custom Widgets
API	JSON Placeholder REST API
<h2>🧠🔥 BLoC State Management</h2>

BLoC separates UI from business logic:

Flow:
Event → BLoC Logic → State

Meaning:

UI sends Events

BLoC receives events & processes logic

BLoC outputs States

UI rebuilds based on new state

<h3>🟦 Why BLoC?</h3>

UI gets mixed with logic  

Hard to scale 

Unpredictable behavior 

Debugging issues 

BLoC fixes all of this via:

Clean separation

Scalable architecture

Predictable state transitions

Easy debugging

Efficient UI rebuilds

<h3>🟩 How BLoC Works in PostsFlow App</h3>
1️⃣ UI Sends Event
context.read<PostsBloc>().add(FetchPostsEvent());
context.read<PostsBloc>().add(MarkPostAsReadEvent(post));

2️⃣ BLoC Receives Event

Processes logic:

Fetch from API

Store read status

Emit states

3️⃣ BLoC Emits State

Loading → PostsLoadingState()

Loaded → PostsLoadedState(posts)

Error → PostsErrorState(message)

<h3>🟨 Visual Flow Diagram</h3>
 ┌────────────┐       ┌──────────────┐      ┌──────────────┐      ┌────────────┐
 │    UI      │ ----> │    Event     │ ---> │     BLoC     │ ---> │   State    │
 └────────────┘       └──────────────┘      └──────────────┘      └────────────┘
         ↑                                                                 |
         └──────────────────── UI listens for state changes ───────────────┘

<h2>🟪 BLoC Components Used</h2>

✔ PostsEvent — fetch, refresh, mark as read

✔ PostsState — loading, loaded, error

✔ PostsBloc — core logic + repository communication

✔ PostDetailBloc

✔ BottomNavCubit

<h2>🟧 Benefits of Using BLoC</h2>

Clean architecture

Reusable widgets

Easy to test

Scales to large apps

No UI-level business logic

Smooth performance

<h2>⚠️ Error Handling in PostsFlow</h2>
Key Principles

Prevent crashes

Convert technical errors → readable messages

Keep BLoC predictable

UI shows friendly fallback screens

Retry support

<h3>🧱 Error Handling Layers</h3>
1️⃣ API Layer

Handles:

No internet

Timeout

404/500

Invalid JSON

Throws:
AppException("Unable to fetch data from server.")

2️⃣ Repository Layer

Maps raw errors → meaningful domain errors.

3️⃣ BLoC Layer

Emits clean error states:

emit(PostsErrorState("Something went wrong."));

4️⃣ UI Error Widget

Displays:

Error message

Retry button

<h2>🏛 Architecture Overview</h2>

Presentation Layer (UI)
⬇
Logic Layer (BLoC/Cubit)
⬇
Repository Layer
⬇
Data Sources (API + Local Storage)

<h2>📂 Folder Structure</h2>
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
 │    │     └── post_model.dart
 
 │    ├── repository/
 │    │     └── post_repository.dart
 
 │    ├── services/
 │    │     ├── api_service.dart
 │    │     └── local_storage_service.dart
 
 │    └── local/
 │          └── local_database.dart
 
 ├── logic/
 │    ├── bottom_nav/
 │    ├── posts/
 │    └── post_detail/
 
 ├── presentation/
 │    ├── screens/
 │    ├── widgets/
 └── assets/
 

<h2>🔄 Data Flow</h2>

Fetch API: UI → BLoC → Repository → ApiService → API

Store Read Status: UI → BLoC → SharedPreferences

Navigate: UI → Navigator → DetailScreen

<h2>🌐 API Details</h2>

API: https://jsonplaceholder.typicode.com/posts

Sample Response:

{
  "userId": 1,
  "id": 1,
  "title": "Sample title",
  "body": "Sample description..."
}

<h2>💾 Local Storage</h2>

Stores:

read_posts = [1, 4, 7, 10]


Read posts remain red on restart.

<h2>🖼 Screens & UI Explanation</h2>
🏠 Home Screen

Welcome text

Animated GIF

Drawer

📃 Posts List

Gradient unread cards

Click → turns red

📄 Post Detail

Title + description

⚙ Settings Screen

Logo

Preferences

<h2>🪄 GIF & Gradient Card Logic</h2>
Unread Post

Gradient: Pink → Gold

After Clicking

Solid Red Card

GIF Widget

Smooth fade-in

Circular loader

gaplessPlayback

Reusable

<h2>🚀 Setup Instructions</h2>
1️⃣ Clone Repo
git clone https://github.com/yourusername/postsflow_app.git

2️⃣ Install Dependencies
flutter pub get

3️⃣ Run App
flutter run

<h2>📦 Build Release</h2>
Android
flutter build apk

iOS
flutter build ios

<h2>🔮 Future Enhancements</h2>

Dark mode

Animated drawer avatar

Offline mode

Search posts

Pagination

Theme personalization
