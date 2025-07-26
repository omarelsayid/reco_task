A scalable and maintainable Flutter application that showcases clean architecture using MVVM, the Repository Pattern, and robust state management. This app features a complete cart system and integrates Firebase services for data management and app distribution.

---

## 🚀 Features

- **🗂️ Clean Architecture**
  - Applied **MVVM (Model-View-ViewModel)** to separate business logic from UI.
  - Used **Repository Pattern** to abstract data sources for better testability and scalability.
  - Implemented **Dependency Injection (DI)** using `injectable` and `get_it`.

- **🛒 Cart System**
  - Add, update, and remove items in the cart.
  - Cart state is managed efficiently using **Bloc/Cubit**.
  - Real-time UI updates and persistent cart data.

- **🔥 Firebase Integration**
  - Data (e.g., product images, details) is stored and retrieved via **Firebase Cloud Storage**.
  - Fast and reliable media loading through Firebase-backed URLs.

- **⚙️ Continuous Integration & Deployment**
  - **GitHub Actions** for automated builds of APK files on every push.
  - Seamless deployment via **Firebase App Distribution** to testers or QA teams.
