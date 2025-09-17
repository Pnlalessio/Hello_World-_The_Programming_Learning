# 🌍 Hello World – Web Application

## 📖 Introduction
**Hello World** is a **web application** developed using **WebRatio**.  
Its main purpose is to help users **learn programming languages** through:
- 📚 Structured courses  
- 🎥 Video tutorials  
- 📝 Interactive exercises (quizzes & open-ended questions)  
- 💬 Forums for collaboration and discussion  
- 👨‍🏫 Tutors available for guidance  

The system offers **four main views**:
1. 🏠 **Home**  
2. 👤 **User**  
3. 🎓 **Tutor**  
4. ⚙️ **Administration**

---

## 🗄️ Domain Model
The application is backed by an **Apache Derby Database**.  
Key entities include:

- 📘 **Course** → Course info + statistics  
- 📂 **Content** → Lessons (with videos) & Exercises (with quizzes/options)  
- 👨‍🎓 **Course Followed** → Tracks users enrolled in courses  
- 💬 **Forum / Post / Comment** → Discussion system per course  
- ✉️ **Private Messages** → User ↔ Tutor direct communication  
- 🏷️ **Category** → Groups courses by programming language  
- ⭐ **Feedback** → User ratings (1–5)  
- 📑 **Curriculum** → Tutors submit CVs for approval  
- 🆘 **Support Requests** → Users/tutors ask administrators for help  

---

## 🏠 Home View
- 👥 Three types of users: **Administrators**, **Tutors**, **Regular Users**  
- 🔑 Login & registration directly from the homepage  
- 📄 Tutors must upload a **CV** for approval by the administrator  
- ⭐ Shows **3 most popular courses** for new visitors  

---

## ⚙️ Administration View
Administrators can:
- ✅ Approve or ❌ Reject tutors (automatic email notifications included)  
- 📝 Edit/Delete user profiles  
- 🏷️ Manage course categories (add, edit, delete with reassignment if needed)  
- 🗑️ Delete courses from the platform  
- 🆘 Manage and resolve **support requests** (tracked as *Solved* / *Not solved*)  

---

## 🎓 Tutor View
Tutors have access to:
- ➕ **Create new courses** (with automatic forum creation)  
- 📂 **Manage course content** → add/edit/delete lessons & exercises  
- 💬 **Forums** → interact with students in discussions  
- ✉️ **Private messages** → answer student questions  
- 📝 **Edit or Delete courses**  
- 🆘 **Support requests** → send issues to the administrator  

Extra Features:
- 📊 Course statistics (average rating ⭐ & number of followers 👥)  
- 🔒 Only approved tutors can upload content  

---

## 👤 User View
Users can:
- 🔎 **Explore courses** → search/sort by popularity or ratings  
- ⭐ **Follow/Unfollow courses**  
- 🎥 Access course content (lessons & exercises)  
- 💬 Participate in course **forums**  
- 📩 **Contact tutors directly** for clarification  
- ⭐ **Rate courses** (feedback stored and updated dynamically)  
- 🆘 Submit support requests to administrators  

Exercise system:
- ❓ Users answer quizzes → solution checked automatically  
- ✅/❌ Instant feedback shown (correct/incorrect)  

---

## 🧩 Module Definitions
The system includes **2 action modules** and **7 hybrid modules** that encapsulate reusable logic, such as:
- Add/Edit/Delete content  
- Manage profiles  
- Handle support requests  
- Manage categories  

---

## 🚀 Key Features Recap
- 👨‍🏫 **Tutor approval workflow** (via CV validation by admin)  
- 🏷️ **Course categorization** for easier discovery  
- 💬 **Collaborative forums** per course  
- ✉️ **Private messaging system** (User ↔ Tutor)  
- 🆘 **Support system** (User/Tutor ↔ Admin)  
- 📊 **Statistics & ratings** for courses  
- 🔒 **Role-based access** (Admin, Tutor, User)  

---

## 🛠️ Tech Stack
- **Platform:** WebRatio  
- **Database:** Apache Derby  
- **Architecture:** Role-based MVC with modular components  

---

## 👩‍💻 Authors
- Jessica Frabotta –  
- Alessio Ferrone –   

--- 
