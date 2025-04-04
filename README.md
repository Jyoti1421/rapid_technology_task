# 📝 Flutter To-Do App (Real-time Sharing)

A powerful **To-Do List app** built using **Flutter** with **MVVM architecture** and **Provider for state management**. This app supports **real-time task sharing**, allowing users to manage and collaborate on tasks efficiently.

---

## 🚀 Features
- ✅ **Task Management** – Add, Edit, Mark as Complete, and Delete tasks.  
- ✅ **Real-time Syncing** – Share tasks with others instantly.  
- ✅ **MVVM Architecture** – Clean separation of UI & business logic.  
- ✅ **Provider for State Management** – Efficient & scalable.  
- ✅ **Beautiful UI** – Responsive & modern UI design.  
- ✅ **Flutter Best Practices** – Organized structure with reusable components.  

---

## 📂 Project Structure
📦 todo_realtime_mvvm ┣ 📂 lib ┃ ┣ 📂 models ┃ ┃ ┗ 📜 task_model.dart ┃ ┣ 📂 viewmodels ┃ ┃ ┗ 📜 task_view_model.dart ┃ ┣ 📂 views ┃ ┃ ┣ 📜 task_list.dart ┃ ┃ ┣ 📜 task_input.dart ┃ ┃ ┗ 📜 edit_task_dialog.dart ┃ ┣ 📂 utils ┃ ┃ ┣ 📜 app_colors.dart ┃ ┃ ┣ 📜 app_styles.dart ┃ ┃ ┣ 📜 app_dimensions.dart ┃ ┃ ┗ 📜 app_strings.dart ┃ ┗ 📜 main.dart ┣ 📜 pubspec.yaml ┣ 📜 README.md

### 📌 Key Components
- 📌 **`models/task_model.dart`** – Defines the Task object.  
- 📌 **`viewmodels/task_view_model.dart`** – Handles business logic.  
- 📌 **`views/`** – UI components (`task_list.dart`, `task_input.dart`, `edit_task_dialog.dart`).  
- 📌 **`utils/`** – Theme, colors, strings, and styles for better maintainability.  
- 📌 **`main.dart`** – Entry point of the app