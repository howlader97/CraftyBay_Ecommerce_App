# craftybay_ecommerce_app

# ayuuto_savings_app
<p align="center">
  <img src="https://img.shields.io/github/stars/SinaSys/flutter_japanese_restaurant_app">
  <img src="https://img.shields.io/github/forks/SinaSys/flutter_japanese_restaurant_app">
  <img src="https://img.shields.io/github/actions/workflow/status/SinaSys/flutter_japanese_restaurant_app/main.yml?label=CI&logo=github">
  <img src="https://img.shields.io/github/v/release/SinaSys/flutter_japanese_restaurant_app?label=Release&logo=semantic-release">
  <img src="https://img.shields.io/github/last-commit/SinaSys/flutter_japanese_restaurant_app?label=Last%20commit">

## Screenshots (Light mode)

Login screen                    |   SignUp Screen          |  Admin HomeScreen |  User Management
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![Media](assets/images/image.1.PNG|![Media (1)](https://github.com/user-attachments/assets/55b6e4d8-f810-436a-b306-7fe9227c85f8)|![Media (2)](https://github.com/user-attachments/assets/6576e4d8-81cb-477a-9ca4-690d00b9ad10)|![Media (3)](https://github.com/user-attachments/assets/0154ce73-4d98-4feb-83d0-295f0be2438d)



## Screenshots (Light mode)

Create group        |   Group DetailsScreen           |  Payment Management     |  Profile Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![Media (4)](https://github.com/user-attachments/assets/d17f107a-5987-47f5-a9f0-a2fe6d83d186)|![Media (6)](https://github.com/user-attachments/assets/aa4b2a24-f7d7-46eb-b82f-49d96570af6f)|![Media (7)](https://github.com/user-attachments/assets/582e2586-f68b-4efb-945b-eaf61b1ac5f9)|![Media (8)](https://github.com/user-attachments/assets/bca6731c-3c38-44b1-8ab9-f2a1a2ad1726)



## 🚀 Features :
```
• Bottom navigation animation when switch from one screen to another
• Fade animation for food items in detail screen and list views
• Delete single food item from cart by swipe item to right side
• Automatically delete single item from cart by set its value to zero
• Increase or Decrease quantity for each food item in cart screen
• Display food list on the food list screen
• Real-time calculation of total price in the cart screen
• Select quantity for each item on detail screen
• Filter foods by category
• State management with GetX 
```


## Directory Structure (GetX version)
```

## project structure
- lib
  - main.dart
  - screens
    - home_screen.dart
    - product_details_screen.dart
    - cart_screen.dart
    - checkout_screen.dart
  - models
    - product.dart
    - cart_item.dart
  - providers
    - product_provider.dart
    - cart_provider.dart
