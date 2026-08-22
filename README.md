# 🛍️ Flutter E-Commerce App

A modern and scalable **E-Commerce mobile application** built with **Flutter and Dart**. The application provides a complete shopping experience with user authentication, product browsing, product details, cart management, wishlist, and user profile features.

The project uses **Firebase** as the backend and **Riverpod** for state management, with **GoRouter** for navigation and route management.

---

## ✨ Features

- 🔐 User Authentication
- 📝 User Registration
- 🔑 User Login
- 🚪 Logout
- 🏠 Home Screen
- 🛍️ Product Listing
- 🔎 Product Search
- 📦 Product Details
- ❤️ Wishlist / Favorites
- 🛒 Shopping Cart
- 💳 Checkout Flow
- 👤 User Profile
- 📍 Address Management
- 🔥 Firebase Backend
- ⚡ Riverpod State Management
- 🧭 GoRouter Navigation
- 📱 Responsive UI
- 🎨 Modern and Clean UI

---

## 🛠️ Tech Stack

### Frontend

- **Flutter** – Cross-platform mobile application framework
- **Dart** – Programming language
- **Riverpod** – State management
- **GoRouter** – Navigation and routing
- **Material Design** – UI components and design system

### Backend

- **Firebase Authentication** – User authentication
- **Cloud Firestore** – Database
- **Firebase Storage** – File and image storage

---

## 🔥 Firebase

Firebase is used as the backend infrastructure for the application.

### Firebase Authentication

Used for:

- User registration
- User login
- User logout
- Authentication state
- User account management

### Cloud Firestore

Used to store and manage application data such as:

- Users
- Products
- Cart items
- Wishlist items
- Orders
- Addresses

### Firebase Storage

Used for storing:

- Product images
- User profile images
- Application media

---

## 🧠 State Management

The application uses **Riverpod** for efficient and scalable state management.

Riverpod is used to manage:

- Authentication state
- Product data
- Cart state
- Wishlist state
- User information
- Loading states
- Error states

Example:

```dart
final productProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});
